<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Anouncement extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'anouncement';

    public $timestamps = true;
  
    protected $fillable = [
          'anouncementTitle_en',
          'anouncementTitle_ur',
          'anouncementImg',
          'description_en',
          'description_ur',
          'anouncement_pdf_url',
          'downloadBtnTxt',
          'pdf',
          'status',
          'created_at',
          'updated_at',
    ];
}
