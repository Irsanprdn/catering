@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8" style="margin-top: 2%">
                <div class="card" style="width: 40rem;">
                    <div class="card-body">
                        <h4 class="card-title">Verifikasi Email</h4>
                        @if (session('resent'))
                            <p class="alert alert-success" role="alert"> link Verifikasi terbaru sudah dikirim ke email andah
                               </p>
                        @endif
                        <p class="card-text">Sebelum Lanjut, Cek dahulu apakah link verifikasi sudah masuk ke email anda.
                            Jika anda belum menerima link verifikasi,</p>
                        <a href="{{ route('verification.resend') }}">Klik Di sini untuk kirim ulang</a>.
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection