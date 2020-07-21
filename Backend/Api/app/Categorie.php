<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Categorie extends Model
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
	      'subTitle_en',
          'title_ur',
          'subTitle_ur',
          'catImg',
          'catSortOrder',
          'status',
          'created_at',
          'updated_at',
    ];

}
