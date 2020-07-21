<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Role extends Model
{
    use SoftDeletes;
    
    protected $dates = ['deleted_at'];
    protected $guarded = [];
    protected $table    = 'roles';
    public $timestamps = true;

    public function role_permissions(){
    	return $this->belongsToMany('App\Permission', 'role_permissions');
    }

}
