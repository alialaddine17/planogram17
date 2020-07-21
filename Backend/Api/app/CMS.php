<?php

namespace App;

use Illuminate\Database\Eloquent\Model as Base_Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class CMS extends Base_Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'cms';

    public $timestamps = true;
  
    protected $fillable = [
          'page_name',
          'slug',
          'description',
          'content',
          'page_title'
    ];
    

    public static function boot()
    {
        parent::boot();  
    }
}
