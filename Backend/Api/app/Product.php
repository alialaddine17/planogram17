<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;

    protected $dates = [
        'deleted_at',
        'created_at',
        'updated_at',
    ];

    protected $table    = 'products';

    public $timestamps = true;
  
    protected $fillable = [
          'catId',
          'subCatId',
          'title_en',
          'title_ur',
          'productImg',
          'trafficFlow',
          'label',
          'sortOrder',
          'productDesc_en',
          'productDesc_ur',
          'status',
          'created_at',
          'updated_at',
    ];
}
