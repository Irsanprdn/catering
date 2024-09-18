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
            $table->text("payment_status")->nullable();

        });
        Schema::table('purchases', function (Blueprint $table) {
            $table->text("payment_evidence")->nullable();
            $table->text("payment_status")->nullable();

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
            $table->dropColumn("payment_status");

        });
        Schema::table('purchases', function (Blueprint $table) {
            $table->dropColumn("payment_evidence");
            $table->dropColumn("payment_status");

        });
    }
};
