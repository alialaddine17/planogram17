<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEmailtemplate extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('emailtemplate', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('template_title')->collation('utf8_unicode_ci');
            $table->text('short_description')->collation('utf8_unicode_ci')->nullable($value = true);
            $table->text('content')->collation('utf8_unicode_ci');
            $table->string('background_image')->collation('utf8_unicode_ci')->nullable($value = true);
            $table->tinyInteger('status')->default(1)->comment('0-Active 1-Active');
            $table->timestamps();
            $table->softDeletes('deleted_at');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('emailtemplate');
    }
}
