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

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

      <img src="{{ asset('images/catering lunch box.jpg') }}" alt="" data-aos="fade-in" class="">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-out">
          <div class="col-xl-7 col-lg-9 text-center">
            <h1>Lezatnya Nasi Box, Nikmati di Setiap Gigitan</h1>
            <p>Pilihan hidangan lezat siap antar, kapan saja, dimana saja</p>
          </div>
        </div>
        <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
          <a href="#about" class="btn-get-started">Mulai Pilih Menu</a>
        </div>


      </div>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Tentang Kami<br></h2>
        <p>Rosani Catering adalah lebih dari sekadar penyedia makanan. Kami adalah perpaduan antara cinta akan kuliner dan keinginan untuk membuat setiap acara Anda istimewa.</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
            <p>
              Didirikan pada tahun 2010, Rosani Catering memiliki visi untuk menghadirkan hidangan yang tidak hanya lezat, tetapi juga penuh makna. Setiap hidangan yang kami sajikan adalah hasil dari pemilihan bahan-bahan berkualitas terbaik dan sentuhan kreativitas dari tim kami.
            </p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span> <b>Kualitas:</b> Kami berkomitmen untuk menyajikan hidangan dengan kualitas terbaik.</span></li>
              <li><i class="bi bi-check2-circle"></i> <span><b>Pelayanan:</b> Kepuasan pelanggan adalah prioritas utama kami.</span></li>
              <li><i class="bi bi-check2-circle"></i> <span><b>Chef berpengalaman:</b> Tim chef kami memiliki pengalaman bertahun-tahun dalam menciptakan hidangan yang menggugah selera</span></li>
            </ul>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <p>Rosani Catering telah dipercaya oleh banyak klien untuk berbagai acara, mulai dari pernikahan hingga acara perusahaan. Kami memahami bahwa setiap acara memiliki keunikan tersendiri, oleh karena itu kami selalu siap untuk berkolaborasi dengan Anda untuk menciptakan pengalaman kuliner yang tak terlupakan.</p>
            <a href="#testimonials" class="read-more"><span>Lihat testimoni</span><i class="bi bi-arrow-right"></i></a>
          </div>

        </div>

      </div>

    </section><!-- /About Section -->


    <!-- Services Section -->
    <section id="services" class="services hero section light-background">

      <!-- Section Title -->
      <div class="container ">
        <div class="container section-title" data-aos="fade-up">
          <h2>Pelayanan Kami</h2>
          <p>Mengutamakan kepuasan pelanggan adalah moto kami dalam berkerja</p>
        </div><!-- End Section Title -->

        <div class="row gy-4">
          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-card-list"></i></div>
              <h4 class="title"><a href="">Varian Menu Lengkap</a></h4>
              <p class="description">Pilih dari berbagai menu paket nasi box yang dirancang khusus untuk memenuhi semua selera. Mulai dari makanan tradisional hingga modern, semua tersedia</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-award"></i></div>
              <h4 class="title"><a href="">Bahan Berkualitas</a></h4>
              <p class="description">Kami hanya menggunakan bahan-bahan segar dan berkualitas tinggi untuk memastikan setiap gigitan penuh dengan rasa dan kebaikan</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-cash-stack"></i></div>
              <h4 class="title"><a href="">Harga Terjangkau</a></h4>
              <p class="description">Nikmati berbagai pilihan nasi box dengan harga yang bersahabat tanpa mengorbankan kualitas. Cocok untuk semua acara dan kebutuhan</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-truck"></i></div>
              <h4 class="title"><a href="">Pengiriman Cepat</a></h4>
              <p class="description">Pesanan Anda akan diantar dengan cepat dan aman. Pastikan makanan Anda sampai dalam kondisi terbaik, tepat waktu setiap saat.</p>
            </div>
          </div><!--End Icon Box -->

        </div>


      </div>

    </section><!-- /Services Section -->

    <section id="pricing" class="pricing hero section light-background">

      <!-- Section Title -->
      <div class="container">
        <div class="container section-title" data-aos="fade-up">
          <h2>Produk Kami</h2>
          <p>Produk andalan kami dan bisa juga custom sesuai dengan keinginan pelanggan</p>
        </div><!-- End Section Title -->

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
                    <img src="{{ $media->getUrl() }}" alt="Product Image"  class=" w-auto position-relative img-fluid img-thumbnail mb-2">
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

    <!-- Call To Action Section -->
    <section id="call-to-action" class="call-to-action section accent-background">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-xl-10">
            <div class="text-center">
              <h3>Pesan Sekarang</h3>
              <p>Untuk melakukan pesanan langsung atau ingin bertanya tanya mengenai menu yang lain, bisa hubungi kami dibawah ini</p>
              <a class="cta-btn" target="_blank" href="https://api.whatsapp.com/send/?phone=6287886868434&text&type=phone_number&app_absent=0">Hubungi Rosani Catering</a>
            </div>
          </div>
        </div>
      </div>

    </section><!-- /Call To Action Section -->

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Testimoni</h2>
        <p>Ingin tau cerita pelanggan kami yang sudah merasakan masakan kami</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper" data-speed="600" data-delay="5000" data-breakpoints="{ &quot;320&quot;: { &quot;slidesPerView&quot;: 1, &quot;spaceBetween&quot;: 40 }, &quot;1200&quot;: { &quot;slidesPerView&quot;: 3, &quot;spaceBetween&quot;: 40 } }">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "1200": {
                  "slidesPerView": 3,
                  "spaceBetween": 20
                }
              }
            }
          </script>
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class=" bi bi-quote quote-icon-left"></i>
                  <span>Masakannya enak banget! Semua tamu puas dan pada nanya cateringnya dari mana.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <h3>Ibu Ani</h3>
                <h4>Acara pernikahan</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Cateringnya sangat membantu kelancaran acara kami. Makanan datang tepat waktu dan rasanya sesuai dengan yang kami harapkan.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <h3>Bapak Budi</h3>
                <h4>Acara perusahaan</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Rasanya seperti buatan rumah sendiri, sangat otentik dan penuh dengan rempah-rempah.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <h3>Nyonya Cici</h3>
                <h4>Acara arisan</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Harga yang ditawarkan sangat terjangkau untuk kualitas makanan yang didapatkan.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <h3>Kakak Putri</h3>
                <h4>Acara lamaran</h4>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Saya sangat terkesan dengan layanan catering Rosani Catering. Mereka sangat fleksibel dalam menyesuaikan menu dengan tema acara saya. Makanan yang disajikan juga sangat segar dan berkualitas.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
                <h3>Ibu Intan</h3>
                <h4>Acara ulang tahun anak</h4>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Kontak</h2>
        <p>Temukan & hubungi kami</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">



        <div class="row gy-4">

          <div class="col-lg-4">
            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
              <i class="bi bi-geo-alt flex-shrink-0"></i>
              <div>
                <h3>Address</h3>
                <p>A108 Adam Street, New York, NY 535022</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
              <i class="bi bi-telephone flex-shrink-0"></i>
              <div>
                <h3>Call Us</h3>
                <p>+1 5589 55488 55</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
              <i class="bi bi-envelope flex-shrink-0"></i>
              <div>
                <h3>Email Us</h3>
                <p>info@example.com</p>
              </div>
            </div><!-- End Info Item -->

          </div>

          <div class="col-lg-8">
            <div class="mb-4" data-aos="fade-up" data-aos-delay="200">
              <iframe style="border:0; width: 100%; height: 270px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div><!-- End Google Maps -->
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section><!-- /Contact Section -->

  </main>

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