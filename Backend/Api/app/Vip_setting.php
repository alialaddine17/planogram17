<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vip_setting extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'vip_setting';

    public $timestamps = true;
  
    protected $fillable = [
          'vipImg',
          'description_en',
          'description_ur',
          'status',
          'created_at',
          'updated_at',
    ];

}
