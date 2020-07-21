<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vip_categories extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'vip_categories';

    public $timestamps = true;
  
    protected $fillable = [
          'parentid',
          'title_en',
          'title_ur',
          'description_en',
          'description_ur',
          'status',
          'created_at',
          'updated_at',
    ];

}
