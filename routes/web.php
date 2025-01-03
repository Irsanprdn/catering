<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

Route::get('/', function () {
    return view('auth.login');
})->middleware('guest');


Route::get('/catering', 'HomeController@front')->name('front');
Route::get('/catering/order/{product}', 'HomeController@frontOrder')->name('front.order');
Route::post('/order', 'HomeController@order')->name('order');

Auth::routes(['register' => false]);

// Route::prefix('admin')->group(function () {
    Route::group(['middleware' => 'auth'], function () {
        Route::get('/home', 'HomeController@index')
            ->name('home');

        Route::get('/sales-purchases/chart-data', 'HomeController@salesPurchasesChart')
            ->name('sales-purchases.chart');

        Route::get('/current-month/chart-data', 'HomeController@currentMonthChart')
            ->name('current-month.chart');

        Route::get('/payment-flow/chart-data', 'HomeController@paymentChart')
            ->name('payment-flow.chart');
    });
// });
