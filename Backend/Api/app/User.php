<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;


class User extends Authenticatable
{
    use Notifiable, HasApiTokens, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    use SoftDeletes;


    protected $guarded = [];

    protected $dates = ['deleted_at'];

    public $timestamps = true;

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','email_token'
    ];


    public function verified()
    {
        $this->verified = 1;
        $this->email_token = null;
        $this->save();
    }


     public static function status($email){
        return User::withTrashed()->where('email',$email)->select('status','deleted_at')->get()->toArray();
     }

}
