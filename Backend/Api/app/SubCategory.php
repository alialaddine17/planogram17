<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class SubCategory extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'categories';

    public $timestamps = true;
  
    protected $fillable = [
          'parentid',
          'title_en',
          'title_ur',
          'catSortOrder',
          'status',
          'created_at',
          'updated_at',
    ];

}
