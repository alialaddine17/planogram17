<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserRole extends Model
{
	use SoftDeletes;

    protected $table    = 'user_roles';

    public $timestamps = true;
    
    protected $guarded = [];


    public function role(){
        return $this->hasMany('App\Role','id','role_id');
    }
}
