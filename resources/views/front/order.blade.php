<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Rosani Catering</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

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
        <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Alamat</a></li>
                <li class="breadcrumb-item active" aria-current="page">Metode Pembayaran</li>
            </ol>
        </nav>
    </section>

    <section id="pricing" class="pricing hero section light-background">

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
                            <div class="text-center"><a href="#" class="buy-btn">Pesan sekarang</a></div>
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

</body>

</html>