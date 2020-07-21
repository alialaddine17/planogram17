<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Redbull_settings extends Model {

    use SoftDeletes;

    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected $dates = ['deleted_at'];

    protected $table    = 'redbull_settings';
    
    public $timestamps = true;

    protected $guarded = [];
    

    public static function boot()
    {
        parent::boot();

    }
  
}
