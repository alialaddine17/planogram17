<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Validator;
use Carbon\Carbon;
use Config;
use App\Redbull_settings;

class SettingsController extends Controller {
    
    public $paginate=10;

    public function __construct() {
        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = (array) null;
        $http_code = 200;
    }

    /**
     * Get general settings for redbull
     */
    public function getSettings()
    {
        try {
            // Fetching settings data
            $settingsData = Redbull_settings::whereNull('deleted_at')->select('name', 'value', 'id')->get()->toArray();
            if(!empty($settingsData))
            {
                //$this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.settings_sent');
                $this->msg['data'] = $settingsData;
                $http_code = '200';
            }
            else
            {
                //$this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data'] = (object)null;
                $http_code = '200';   
            }
        } catch (Exception $e) {
            // Something went wrong while getting cms content
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }
}
