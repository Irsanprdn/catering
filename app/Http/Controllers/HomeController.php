<?php

namespace App\Http\Controllers;

use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Modules\Expense\Entities\Expense;
use Modules\Purchase\Entities\Purchase;
use Modules\Purchase\Entities\PurchasePayment;
use Modules\PurchasesReturn\Entities\PurchaseReturn;
use Modules\PurchasesReturn\Entities\PurchaseReturnPayment;
use Modules\Sale\Entities\Sale;
use Modules\Sale\Entities\SalePayment;
use Modules\SalesReturn\Entities\SaleReturn;
use Modules\SalesReturn\Entities\SaleReturnPayment;
use Modules\Product\Entities\Product;
use Illuminate\Http\Request;
use Modules\People\Entities\Customer;
use Modules\Quotation\Entities\Quotation;
use Modules\Quotation\Entities\QuotationDetails;

class HomeController extends Controller
{

    public function front()
    {
        $product = Product::get();

        return view('front.index', compact('product'));
    }

    public function frontOrder($id)
    {
        $order = Product::find($id);

        $product = Product::get();
        return view('front.order', compact('product', 'order'));
    }

    public function order(Request $request)
    {
        // Validasi input dari form
        $request->validate([
            'nama_penerima' => 'required|string',
            'no_hp' => 'required|string',
            'email' => 'required|email',
            'negara' => 'required|string',
            'kota_kabupaten' => 'required|string',
            'alamat_lengkap' => 'required|string',
            'metode_pembayaran' => 'required|string',
            'bukti_pembayaran' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048', // Validasi file
            'pesanan' => 'required|json',
        ]);

        // Upload file
        if ($request->hasFile('bukti_pembayaran')) {
            $file = $request->file('bukti_pembayaran');
            $destinationPath = public_path('uploads/bukti-pembayaran'); // Define the destination path
            $fileName = time() . '-' . $file->getClientOriginalName(); // Create a unique file name
            $file->move($destinationPath, $fileName); // Move the file to the public directory
            $filePath = 'uploads/bukti-pembayaran/' . $fileName; // Construct the file path for use in the view        
        }

        $customer = Customer::where('customer_email', $request->email)->first();

        if (!$customer) {
            // Jika tidak ditemukan, buat data baru
            $customer = new Customer();
            $customer->customer_name = $request->nama_penerima;
            $customer->customer_phone = $request->no_hp;
            $customer->customer_email = $request->email;
            $customer->country = $request->negara;
            $customer->city = $request->kota_kabupaten;
            $customer->address = $request->alamat_lengkap;
            $customer->save();
        }
        // Dapatkan entri Quotation terakhir berdasarkan reference secara descending
        $lastQuotation = Quotation::orderBy('reference', 'desc')->first();

        if ($lastQuotation) {
            // Ambil bagian angka dari reference terakhir, misalnya dari 'QT-00001' menjadi '1'
            $lastNumber = intval(substr($lastQuotation->reference, 3));

            // Tambahkan satu pada angka terakhir
            $newNumber = $lastNumber + 1;
        } else {
            // Jika tidak ada quotation sebelumnya, mulai dari 1
            $newNumber = 1;
        }

        // Format nomor baru agar selalu 5 digit, misalnya 1 menjadi '00001'
        $newReference = 'QT-' . str_pad($newNumber, 5, '0', STR_PAD_LEFT);

        // Dapatkan ID customer
        $customerId = $customer->id;
        $customerName = $customer->customer_name;
        $quotation = new Quotation();
        $quotation->reference = $newReference;
        $quotation->date = date('Y-m-d');
        $quotation->customer_id = $customerId;
        $quotation->customer_name = $customerName;
        $quotation->tax_percentage = 0;
        $quotation->tax_amount = 0;
        $quotation->discount_percentage = 0;
        $quotation->discount_amount = 0;
        $quotation->shipping_amount = 0;
        $quotation->total_amount = $request->total_harga;
        $quotation->status = 'Pending';
        $quotation->payment_status = $request->metode_pembayaran;
        $quotation->payment_evidence = $filePath; // Simpan path file
        $quotation->save();

        // Simpan detail pesanan (opsional)
        $items = json_decode($request->pesanan, true);
        foreach ($items as $item) {
            $detailPesanan = new QuotationDetails();
            $detailPesanan->quotation_id = $quotation->id;
            $detailPesanan->product_id = $item['id'];

            $product = Product::where('id', $item['id'])->first();
            $detailPesanan->product_name = $product->product_name;
            $detailPesanan->product_code = $product->product_code;
            $detailPesanan->price = $product->product_price;
            $detailPesanan->unit_price = $product->product_price;
            $detailPesanan->quantity = $item['qty'];
            $detailPesanan->sub_total = $product->product_price * $item['qty'];
            $detailPesanan->product_discount_amount = 0;
            $detailPesanan->product_discount_type = 'fixed';
            $detailPesanan->product_tax_amount = 0;
            $detailPesanan->save();
        }

        return response()->json(['success' => true, 'message' => 'Pesanan berhasil disimpan']);
    }

    public function index()
    {
        $sales = Sale::completed()->sum('total_amount');
        $sale_returns = SaleReturn::completed()->sum('total_amount');


        $product_costs = 0;

        foreach (Sale::completed()->with('saleDetails')->get() as $sale) {
            foreach ($sale->saleDetails as $saleDetail) {
                if (!is_null($saleDetail->product)) {
                    $product_costs += $saleDetail->product->product_cost * $saleDetail->quantity;
                }
            }
        }

        $revenue = ($sales - $sale_returns) / 100;
        $profit = $revenue - $product_costs;

        return view('home', [
            'revenue'          => $revenue,
            'sale_returns'     => $sale_returns / 100,

            'profit'           => $profit
        ]);
    }


    public function currentMonthChart()
    {
        abort_if(!request()->ajax(), 404);

        $currentMonthSales = Sale::where('status', 'Completed')->whereMonth('date', date('m'))
            ->whereYear('date', date('Y'))
            ->sum('total_amount') / 100;

        $currentMonthExpenses = Expense::whereMonth('date', date('m'))
            ->whereYear('date', date('Y'))
            ->sum('amount') / 100;

        return response()->json([
            'sales'     => $currentMonthSales,

            'expenses'  => $currentMonthExpenses
        ]);
    }


    public function salesPurchasesChart()
    {
        abort_if(!request()->ajax(), 404);

        $sales = $this->salesChartData();
        $purchases = $this->purchasesChartData();

        return response()->json(['sales' => $sales, 'purchases' => $purchases]);
    }


    public function paymentChart()
    {
        abort_if(!request()->ajax(), 404);

        $dates = collect();
        foreach (range(-11, 0) as $i) {
            $date = Carbon::now()->addMonths($i)->format('m-Y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subYear()->format('Y-m-d');

        $sale_payments = SalePayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $sale_return_payments = SaleReturnPayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $purchase_payments = PurchasePayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $purchase_return_payments = PurchaseReturnPayment::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $expenses = Expense::where('date', '>=', $date_range)
            ->select([
                DB::raw("DATE_FORMAT(date, '%m-%Y') as month"),
                DB::raw("SUM(amount) as amount")
            ])
            ->groupBy('month')->orderBy('month')
            ->get()->pluck('amount', 'month');

        $payment_received = array_merge_numeric_values($sale_payments, $purchase_return_payments);
        $payment_sent = array_merge_numeric_values($purchase_payments, $sale_return_payments, $expenses);

        $dates_received = $dates->merge($payment_received);
        $dates_sent = $dates->merge($payment_sent);

        $received_payments = [];
        $sent_payments = [];
        $months = [];

        foreach ($dates_received as $key => $value) {
            $received_payments[] = $value;
            $months[] = $key;
        }

        foreach ($dates_sent as $key => $value) {
            $sent_payments[] = $value;
        }

        return response()->json([
            'payment_sent' => $sent_payments,
            'payment_received' => $received_payments,
            'months' => $months,
        ]);
    }

    public function salesChartData()
    {
        $dates = collect();
        foreach (range(-6, 0) as $i) {
            $date = Carbon::now()->addDays($i)->format('d-m-y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subDays(6);

        $sales = Sale::where('status', 'Completed')
            ->where('date', '>=', $date_range)
            ->groupBy(DB::raw("DATE_FORMAT(date,'%d-%m-%y')"))
            ->orderBy('date')
            ->get([
                DB::raw(DB::raw("DATE_FORMAT(date,'%d-%m-%y') as date")),
                DB::raw('SUM(total_amount) AS count'),
            ])
            ->pluck('count', 'date');

        $dates = $dates->merge($sales);

        $data = [];
        $days = [];
        foreach ($dates as $key => $value) {
            $data[] = $value / 100;
            $days[] = $key;
        }

        return response()->json(['data' => $data, 'days' => $days]);
    }


    public function purchasesChartData()
    {
        $dates = collect();
        foreach (range(-6, 0) as $i) {
            $date = Carbon::now()->addDays($i)->format('d-m-y');
            $dates->put($date, 0);
        }

        $date_range = Carbon::today()->subDays(6);

        $purchases = Purchase::where('status', 'Completed')
            ->where('date', '>=', $date_range)
            ->groupBy(DB::raw("DATE_FORMAT(date,'%d-%m-%y')"))
            ->orderBy('date')
            ->get([
                DB::raw(DB::raw("DATE_FORMAT(date,'%d-%m-%y') as date")),
                DB::raw('SUM(total_amount) AS count'),
            ])
            ->pluck('count', 'date');

        $dates = $dates->merge($purchases);

        $data = [];
        $days = [];
        foreach ($dates as $key => $value) {
            $data[] = $value / 100;
            $days[] = $key;
        }

        return response()->json(['data' => $data, 'days' => $days]);
    }
}
