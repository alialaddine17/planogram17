<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vip_details extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'vip_details';

    public $timestamps = true;
  
    protected $fillable = [
          'vipId',
          'detailTitle_en',
          'detailTitle_ur',
          'subTitle_en',
          'subTitle_ur',
          'vipImg',
          'description_en',
          'description_ur',
          'status',
          'created_at',
          'updated_at',
    ];

}
