<?php

namespace App\Http\Controllers\Api\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\EmailTemplate;
use App\Mail\EmailVerification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Storage;

use Response;
use Validator;
use DB;
use File;
use App\User;
use App\Module;
use App\Settings;
use App\UserRole;
use App\Role;
use App\RolePermission;
use App\Permission;
use App\Customer;
use App\Channel;


class LogsController extends Controller {

    public function __construct() {

        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = array();
        $http_code = 200;
    }

    /**
     * Function to get API logs 
     * Method: GET
     * Request URL: 
     * */
    public function getApiLogs(Request $request) {

        $filesInFolder = \File::files(public_path('apilogs')); 
        $mainArray = array();   
        $temp = array();
        foreach($filesInFolder as $path) { 
          $file = pathinfo($path);
          $temp['date'] = date('d F Y');
          $temp['file_name'] = $file['basename'];
          $tmp = explode("_", $file['basename']);
          $date = strstr($tmp['2'],".",true);
          $temp['date'] = date('d F Y',strtotime($date));
          $temp['file_url'] = asset('public/apilogs/'.$file['basename']);
          array_push($mainArray,$temp);
        } 

        $this->msg['status'] = 1;
        $this->msg['message'] = trans('messages.success');
        $this->msg['recordsTotal'] = count($filesInFolder);
        $this->msg['data'] = $mainArray;
        $http_code = 200;

        return response()->json($this->msg, $http_code);

    }

   
}
