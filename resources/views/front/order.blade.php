<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Rosani Catering</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- Favicons -->
    <link rel="icon" href="{{ asset('images/logo2.jpeg') }}">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap') }}" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="{{ asset('front/vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('front/vendor/bootstrap-icons/bootstrap-icons.css') }}" rel="stylesheet">
    <link href="{{ asset('front/vendor/aos/aos.css') }}" rel="stylesheet">
    <link href="{{ asset('front/vendor/glightbox/css/glightbox.min.css') }}" rel="stylesheet">
    <link href="{{ asset('front/vendor/swiper/swiper-bundle.min.css') }}" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="{{ asset('front/css/main.css') }}" rel="stylesheet">
    <style>
        .upload-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .upload-container h2 {
            margin-bottom: 20px;
        }

        .upload-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .upload-btn:hover {
            background-color: #2980b9;
        }

        .upload-btn input[type="file"] {
            display: none;
            /* Sembunyikan input file asli */
        }

        #imagePreview {
            display: none;
            margin-top: 20px;
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .copy-btn {
            cursor: pointer;
            color: #3498db;
        }

        .copy-btn:hover {
            color: #2980b9;
        }

        .copy-alert {
            display: none;
        }
    </style>
</head>

<body class="index-page">

    <header id="header" class="header d-flex align-items-center sticky-top">
        <div class="container-fluid container-xl position-relative d-flex align-items-center">

            <a href="index.html" class="logo d-flex align-items-center me-auto">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="{{ asset('front/img/logo.png') }}" alt=""> -->
                <h2 class="font-weight-bold">Rosani Catering</h2>
            </a>

            <nav id="navmenu" class="navmenu">
                <ul>
                    <li><a href="#hero" class="active">Beranda<br></a></li>
                    <li><a href="#about">Tentang Kami</a></li>
                    <li><a href="#services">Pelayanan</a></li>
                    <li><a href="#pricing">Produk</a></li>
                    <li><a href="#testimonials">Testimoni</a></li>
                    <li><a href="#contact">Kontak</a></li>
                </ul>
                <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
            </nav>


        </div>
    </header>

    <section id="order" class="section">
        <div class="container">
            <!-- <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item text-dark" aria-current="page">Alamat</li>
                    <li class="breadcrumb-item text-secondary">Pembayaran</li>
                </ol>
            </nav> -->
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link px-1 active" id="alamat-customer-tab" data-bs-toggle="tab" data-bs-target="#alamat-customer" type="button" role="tab" aria-controls="alamat-customer" aria-selected="true">Alamat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-1" href="#"><i class="bi bi-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link px-1 disabled" disabled id="pembayaran-customer-tab" data-bs-toggle="tab" data-bs-target="#pembayaran-customer" type="button" role="tab" aria-controls="pembayaran-customer" aria-selected="false">Pembayaran</a>
                </li>
            </ul>

            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="alamat-customer" role="tabpanel" aria-labelledby="alamat-customer-tab">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h3>Informasi Pengiriman</h3>
                                    <div class="my-3">
                                        <label for="namapenerima" class="form-label">Nama lengkap penerima *</label>
                                        <input type="text" class="form-control" id="namapenerima">
                                    </div>
                                    <div class="mb-3">
                                        <label for="nohp" class="form-label">Nomer HP Penerima *</label>
                                        <input type="text" oninput="this.value = this.value.replace(/[^0-9]/g, '');" class="form-control" id="nohp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email *</label>
                                        <input type="email" class="form-control" id="email">
                                    </div>
                                    <div class="mb-3">
                                        <label for="negara" class="form-label">Negara *</label>
                                        <input type="text" class="form-control" id="negara" value="Indonesia" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="kotakab" class="form-label">Kota/Kabupaten *</label>
                                        <input type="text" class="form-control" id="kotakab">
                                    </div>
                                    <div class="mb-3">
                                        <label for="text" class="form-label">Alamat lengkap *</label><br>
                                        <textarea name="text" id="alamat_lengkap" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <h3>Informasi Produk yang di pesan</h3>
                                    <div id="penampung">
                                        <div class="row belanjaan" data-id="{{ $order->id }}">
                                            <div class="col-md-3">
                                                @forelse($order->getMedia('images') as $media)
                                                <img src="{{ $media->getUrl() }}" alt="Product Image" class=" w-auto position-relative img-fluid img-thumbnail mb-2">
                                                @empty
                                                <img src="{{ $order->getFirstMediaUrl('images') }}" alt="Product Image" style="height:150px;" class=" w-auto position-relative img-fluid img-thumbnail mb-2">
                                                @endforelse
                                            </div>
                                            <div class="col-md-5">
                                                <h5 class="fw-bold mb-1">{{ $order->product_name }}</h5>
                                                <p class="mb-1">Rp. <span class="belanjaan-price"> {{ number_format($order->product_price) }} </span><span> / {{ $order->product_unit }}</span></p>
                                            </div>
                                            <div class="col-md-2">
                                                <input type="number" onclick="updateTotal()" onchange="updateTotal()"
                                                    onkeyup="updateTotal()"
                                                    class="form-control belanjaan-qty" value="1" min="1" id="qtyOrder">
                                            </div>
                                            <div class="col-md-2">
                                                <button class="btn btn-danger" type="button">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="card">
                                <div class="card-body">
                                    <h3>Ringkasan pembelanjaan</h3>
                                    <div id="penampung">
                                        <div class="row" data-id="{{ $order->id }}">
                                            <div class="col-md-4">
                                                <h5 class="">Total Harga</h5>
                                                <h5 class="">Total Unit</h5>
                                            </div>
                                            <div class="col-md-8">
                                                <h5 class="mb-1 fw-bold">Rp. <span id="totalHarga">0</span></h5>
                                                <h5 class="text-secondary"><span id="totalQty">0</span> Unit</h5>
                                            </div>
                                            <div class="col-md-12">
                                                <button class="btn btn-dark w-100" onclick="pilihMetodePembayaran()">Pilih metode pembayaran</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="pembayaran-customer" role="tabpanel" aria-labelledby="pembayaran-customer-tab">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <h5 class="card-title">Nama Bank: <strong>Bank XYZ</strong></h5>
                                                            <p class="card-text">Nomor Rekening:
                                                                <span id="rekeningText">1234 5678 91011 1213</span>
                                                                <i class="bi bi-clipboard copy-btn" onclick="copyRekening()" title="Salin Nomor Rekening"></i>
                                                            </p>
                                                            <div class="alert alert-success copy-alert" id="copyAlert" role="alert">
                                                                Nomor rekening berhasil disalin!
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input type="hidden" id="metodepembayaran">
                                                <div class="col-md-6">
                                                    <button class="btn btn-outline-primary w-100" id="pembayaranPenuh" onclick="selectPayment(this, 'penuh')">
                                                        Pembayaran penuh
                                                    </button>
                                                </div>
                                                <div class="col-md-6">
                                                    <button class="btn btn-outline-primary w-100" id="uangMuka50" onclick="selectPayment(this, 'dp')">
                                                        Uang dimuka 50%
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="upload-container">
                                                <h2>Upload dan Preview Bukti Pembayaran</h2>
                                                <!-- Tombol custom untuk memilih gambar -->
                                                <label class="upload-btn">
                                                    Pilih Gambar
                                                    <input type="file" id="uploadFoto" accept="image/*" onchange="previewImage()">
                                                </label>

                                                <!-- Tempat pratinjau gambar -->
                                                <div id="previewContainer">
                                                    <img id="imagePreview" src="" alt="Preview Gambar">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="btn btn-dark w-100 mt-3" onclick="pesanSekarang()">Pesan sekarang</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
    </section>

    <section id="pricing" class="pricing hero py-4 section light-background">

        <!-- Section Title -->
        <div class="container">
            <div class="container section-title" data-aos="fade-up">

                <p class="text-left">Kamu mungkin juga suka</p>
            </div>

            <div class="swiper mySwiper">
                <div class="swiper-wrapper  mb-5">
                    @foreach( $product as $p )
                    <div class="swiper-slide">
                        <div class="pricing-item">
                            <h3>{{ $p->product_name }}</h3>
                            <p>{{ format_currency($p->product_price) }}<span> / {{ $p->product_unit }}</span></p>
                            <ul>
                                <li><i class="bi bi-check"></i> {{ $p->product_note ?? 'N/A' }}</li>
                                <li class="d-flex justify-content-center" style="height:150px;">
                                    @forelse($p->getMedia('images') as $media)
                                    <img src="{{ $media->getUrl() }}" alt="Product Image" class=" w-auto position-relative img-fluid img-thumbnail mb-2">
                                    @empty
                                    <img src="{{ $product->getFirstMediaUrl('images') }}" alt="Product Image" style="height:150px;" class=" w-auto position-relative img-fluid img-thumbnail mb-2">
                                    @endforelse
                                </li>
                            </ul>
                            <div class="text-center">
                                <a onclick="addOrder(this)" data-id="{{ $p->id }}" data-name="{{ $p->product_name }}"
                                    data-price="{{ $p->product_price }}" data-unit="{{ $p->product_unit }}" data-note="{{ $p->product_note }}"
                                    data-image="{{ $media->getUrl() }}" class="buy-btn">Tambah Pesanan</a>
                            </div>
                        </div>
                    </div>
                    @endforeach

                </div>
            </div>


        </div>

    </section><!-- /Pricing Section -->

    <footer id="footer" class="footer light-background">

        <div class="container footer-top">
            <div class="row gy-4">
                <div class="col-lg-8 col-md-12 footer-about">
                    <a href="index.html" class="logo d-flex align-items-center">
                        <span class="sitename">Rosani Catering</span>
                    </a>
                    <p>Rosani Catering adalah lebih dari sekadar penyedia makanan. Kami adalah perpaduan antara cinta akan kuliner dan keinginan untuk membuat setiap acara Anda istimewa.</p>
                </div>
                <div class="col-lg-4 col-md-12 footer-about">
                    <div class="social-links d-flex mt-5">
                        <a href=""><i class="bi bi-twitter-x"></i></a>
                        <a href=""><i class="bi bi-facebook"></i></a>
                        <a href=""><i class="bi bi-instagram"></i></a>
                        <a href=""><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="container copyright text-center mt-4">
            <p>© <span>Copyright</span> <strong class="px-1 sitename">Rosani Catering</strong> <span>All Rights Reserved</span></p>
        </div>

    </footer>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Preloader -->
    <div id="preloader"></div>

    <!-- Vendor JS Files -->
    <script src="{{ asset('front/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('front/vendor/php-email-form/validate.js') }}"></script>
    <script src="{{ asset('front/vendor/aos/aos.js') }}"></script>
    <script src="{{ asset('front/vendor/purecounter/purecounter_vanilla.js') }}"></script>
    <script src="{{ asset('front/vendor/glightbox/js/glightbox.min.js') }}"></script>
    <script src="{{ asset('front/vendor/swiper/swiper-bundle.min.js') }}"></script>
    <script src="{{ asset('front/vendor/imagesloaded/imagesloaded.pkgd.min.js') }}"></script>
    <script src="{{ asset('front/vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>

    <!-- Main JS File -->
    <script src="{{ asset('front/js/main.js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            updateTotal()
        });

        function addOrder(e) {
            var id = e.getAttribute('data-id');
            var name = e.getAttribute('data-name');
            var price = e.getAttribute('data-price');
            var unit = e.getAttribute('data-unit');
            var note = e.getAttribute('data-note');
            var image = e.getAttribute('data-image');

            // Temukan elemen penampung
            var penampung = document.getElementById('penampung');

            // Periksa apakah item dengan data-id yang sama sudah ada
            var existingItem = penampung.querySelector('.belanjaan[data-id="' + id + '"]');

            if (existingItem) {
                // Jika item sudah ada, tambahkan qty
                var qtyInput = existingItem.querySelector('.belanjaan-qty');
                qtyInput.value = parseInt(qtyInput.value) + 1;
            } else {
                // Jika item belum ada, tambahkan item baru
                var html = '<div class="row belanjaan" data-id="' + id + '">' +
                    '<div class="col-md-12"><hr></div>' +
                    '<div class="col-md-3">' +
                    '<img src="' + image + '" alt="Product Image" class="w-auto position-relative img-fluid img-thumbnail mb-2">' +
                    '</div>' +
                    '<div class="col-md-5">' +
                    '<h5 class="fw-bold mb-1">' + name + '</h5>' +
                    '<p class="mb-1">Rp. <span class="belanjaan-price"> ' + formatRupiah(price) + '</span><span> / ' + unit + '</span></p>' +
                    '</div>' +
                    '<div class="col-md-2">' +
                    '<input type="number" onclick="updateTotal()" onchange="updateTotal()" onkeyup="updateTotal()" class="form-control belanjaan-qty" value="1" min="1" id="qtyOrder">' +
                    '</div>' +
                    '<div class="col-md-2">' +
                    '<button class="btn btn-danger" type="button">' +
                    '<i class="bi bi-trash"></i>' +
                    '</button>' +
                    '</div>' +
                    '</div>';

                // Sisipkan HTML ke dalam elemen penampung
                penampung.insertAdjacentHTML('beforeend', html);
            }

            // Hitung ulang total
            updateTotal();
        }


        function formatRupiah(number) {
            var numberString = number.toString().replace(/[^,\d]/g, ''),
                split = numberString.split(','),
                sisa = split[0].length % 3,
                rupiah = split[0].substr(0, sisa),
                ribuan = split[0].substr(sisa).match(/\d{3}/gi);

            if (ribuan) {
                var separator = sisa ? ',' : '';
                rupiah += separator + ribuan.join(',');
            }

            rupiah = split[1] !== undefined ? rupiah + ',' + split[1] : rupiah;
            return rupiah;
        }

        function updateTotal() {
            let totPrice = 0;
            let totQty = 0;

            // Dapatkan semua elemen dengan class 'belanjaan'
            const items = document.querySelectorAll('.belanjaan');

            items.forEach(function(item) {
                // Dapatkan harga dan kuantitas dari elemen
                const priceElement = item.querySelector('.belanjaan-price');
                const qtyElement = item.querySelector('.belanjaan-qty'); // Mengambil input qty yang benar

                const price = parseInt(priceElement.innerText.replace(/[^0-9]/g, ''));
                const qty = parseInt(qtyElement.value);

                totPrice += price * qty;
                totQty += qty;
            });

            // Tampilkan total harga dan total kuantitas
            document.getElementById('totalHarga').innerText = formatRupiah(totPrice);
            document.getElementById('totalQty').innerText = totQty;
        }

        document.addEventListener('click', function(e) {
            // Jika tombol dengan kelas 'btn-danger' diklik
            if (e.target.classList.contains('btn-danger') || e.target.closest('.btn-danger')) {
                // Dapatkan elemen .row yang berisi tombol hapus tersebut
                const row = e.target.closest('.row');

                // Hapus elemen row tersebut
                row.remove();

                // Update total setelah item dihapus
                updateTotal();
            }
        });

        function copyRekening() {
            // Dapatkan elemen teks nomor rekening
            var rekeningText = document.getElementById("rekeningText").innerText;

            // Salin teks ke clipboard
            navigator.clipboard.writeText(rekeningText).then(function() {
                // Tampilkan pesan sukses
                var copyAlert = document.getElementById("copyAlert");
                copyAlert.style.display = "block";

                // Sembunyikan pesan setelah 2 detik
                setTimeout(function() {
                    copyAlert.style.display = "none";
                }, 2000);
            }, function(err) {
                console.error('Gagal menyalin teks: ', err);
            });
        }

        function pilihMetodePembayaran() {

            // Cek jika nama penerima kosong
            // if (document.getElementById('namapenerima').value === '') {
            //     alert('Nama penerima tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika nomor HP penerima kosong
            // if (document.getElementById('nohp').value === '') {
            //     alert('Nomer HP penerima tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika email kosong
            // if (document.getElementById('email').value === '') {
            //     alert('Email tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika negara kosong
            // if (document.getElementById('negara').value === '') {
            //     alert('Negara tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika kota/kabupaten kosong
            // if (document.getElementById('kotakab').value === '') {
            //     alert('Kota/Kabupaten tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika alamat lengkap kosong
            // if (document.getElementById('alamat_lengkap').value === '') {
            //     alert('Alamat lengkap tidak boleh kosong');
            //     return false;
            // }

            // // Cek jika total harga adalah 0
            // if (document.getElementById('totalHarga').innerText == '0') {
            //     alert('Belum ada pesanan yang dipilih');
            //     return false;
            // }


            // Dapatkan elemen dengan ID 'pembayaran-customer-tab'
            var pembayaranTab = document.getElementById('pembayaran-customer-tab');

            // Hapus class 'disabled'
            pembayaranTab.classList.remove('disabled');

            // Hapus atribut 'disabled'
            pembayaranTab.removeAttribute('disabled');

            // Simulasikan klik
            pembayaranTab.click();
        }

        function previewImage() {
            var fileInput = document.getElementById('uploadFoto');
            var file = fileInput.files[0]; // Dapatkan file yang dipilih

            if (file) {
                var reader = new FileReader();

                // Ketika file sudah dibaca
                reader.onload = function(e) {
                    var imagePreview = document.getElementById('imagePreview');
                    imagePreview.src = e.target.result; // Atur sumber gambar dari hasil pembacaan file
                    imagePreview.style.display = 'block'; // Tampilkan elemen gambar
                }

                reader.readAsDataURL(file); // Baca file sebagai Data URL
            }
        }

        function selectPayment(element, metode) {
            // Reset semua tombol menjadi btn-outline-primary
            document.querySelectorAll('.btn').forEach(function(btn) {
                btn.classList.remove('btn-primary');
                btn.classList.add('btn-outline-primary');
            });

            // Ubah tombol yang diklik menjadi btn-primary
            element.classList.remove('btn-outline-primary');
            element.classList.add('btn-primary');

            // Simpan metode pembayaran ke dalam hidden input
            document.getElementById('metodepembayaran').value = metode;
        }


        function pesanSekarang() {
            // Ambil nilai dari form pengiriman
            const namaPenerima = document.getElementById('namapenerima').value;
            const noHP = document.getElementById('nohp').value;
            const email = document.getElementById('email').value;
            const negara = document.getElementById('negara').value;
            const kotaKab = document.getElementById('kotakab').value;
            const alamatLengkap = document.getElementById('alamat_lengkap').value;


            // Validasi form
            if (!namaPenerima || !noHP || !email || !kotaKab || !alamatLengkap) {
                alert('Semua field bertanda * wajib diisi');
                return;
            }

            // Ambil metode pembayaran
            const totalHarga = document.getElementById('totalHarga').value
            totalHarga = totalHarga.innerText.replace(/[^0-9]/g, '');;

            // Ambil metode pembayaran
            const metodePembayaran = document.getElementById('metodepembayaran').value;
            if (!metodePembayaran) {
                alert('Pilih metode pembayaran');
                return;
            }

            // Ambil file bukti pembayaran
            const buktiPembayaran = document.getElementById('buktiPembayaran').files[0];
            if (!buktiPembayaran) {
                alert('Upload bukti pembayaran');
                return;
            }

            // Ambil semua item pesanan
            const items = [];
            document.querySelectorAll('.belanjaan').forEach(item => {
                const id = item.getAttribute('data-id');
                const qty = item.querySelector('.belanjaan-qty').value;
                const price = item.querySelector('.belanjaan-price').innerText.replace(/[^0-9]/g, '');

                items.push({
                    id,
                    qty,
                    price
                });
            });

            // Validasi pesanan

            if (items.length === 0) {
                alert('Belum ada pesanan yang dipilih');
                return;
            }

            // Buat objek FormData untuk dikirim ke Laravel
            let formData = new FormData();
            formData.append('nama_penerima', namaPenerima);
            formData.append('no_hp', noHP);
            formData.append('email', email);
            formData.append('negara', negara);
            formData.append('kota_kabupaten', kotaKab);
            formData.append('alamat_lengkap', alamatLengkap);
            formData.append('total_harga', totalHarga);
            formData.append('metode_pembayaran', metodePembayaran);
            formData.append('bukti_pembayaran', buktiPembayaran); // Lampirkan file

            // Lampirkan semua pesanan
            formData.append('pesanan', JSON.stringify(items));

            // Kirimkan data ke server melalui AJAX
            fetch('/pesanan', {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Pesanan berhasil dikirim');
                    } else {
                        alert('Terjadi kesalahan: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }
    </script>
</body>

</html>