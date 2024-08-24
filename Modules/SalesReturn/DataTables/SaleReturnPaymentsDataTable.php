<?php

namespace Modules\SalesReturn\DataTables;

use Modules\SalesReturn\Entities\SaleReturnPayment;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Html\Editor\Editor;
use Yajra\DataTables\Html\Editor\Fields;
use Yajra\DataTables\Services\DataTable;

class SaleReturnPaymentsDataTable extends DataTable
{

    public function dataTable($query) {
        return datatables()
            ->eloquent($query)
            ->addColumn('amount', function ($data) {
                return format_currency($data->amount);
            })
            ->addColumn('action', function ($data) {
                return view('salesreturn::payments.partials.actions', compact('data'));
            });
    }

    public function query(SaleReturnPayment $model) {
        return $model->newQuery()->bySaleReturn()->with('saleReturn');
    }

    public function html() {
        return $this->builder()
            ->setTableId('sale-payments-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom("<'row'<'col-md-3'l><'col-md-5 mb-2'B><'col-md-4'f>> .
                                'tr' .
                                <'row'<'col-md-5'i><'col-md-7 mt-2'p>>")
            ->orderBy(5)
            ->buttons(
                
                Button::make('reload')
                    ->text('<i class="bi bi-arrow-repeat"></i> Reload')
            );
    }

    protected function getColumns() {
        return [
            Column::make('date')
              ->title('Tanggal')
                ->className('align-middle text-center'),

            Column::make('reference')
                ->className('align-middle text-center'),

            Column::computed('amount')
              ->title('Total')
                ->className('align-middle text-center'),

            Column::make('payment_method')
              ->title('Metode Pembayaran')
                ->className('align-middle text-center'),

            Column::computed('action')
              ->title('Aksi')
                ->exportable(false)
                ->printable(false)
                ->className('align-middle text-center'),

            Column::make('created_at')
                ->visible(false),
        ];
    }

    protected function filename(): string {
        return 'SaleReturnPayments_' . date('YmdHis');
    }
}