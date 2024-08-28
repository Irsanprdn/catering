<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('quotations', function (Blueprint $table) {
            $table->text("payment_evidence")->nullable();

        });
        Schema::table('purchases', function (Blueprint $table) {
            $table->text("payment_evidence")->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('quotations', function (Blueprint $table) {
            $table->dropColumn("payment_evidence");

        });
        Schema::table('purchases', function (Blueprint $table) {
            $table->dropColumn("payment_evidence");

        });
    }
};
