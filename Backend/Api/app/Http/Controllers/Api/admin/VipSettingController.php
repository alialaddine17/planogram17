<?php

namespace App\Http\Controllers\Api\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Validator;
use DB;
use Response;
use Carbon\Carbon;
use File;
use App\Helpers\Helper;
use App\Vip_setting;
use Config;

class VipSettingController extends Controller
{
    public function __constructor(){

    }

    public function listVipSetting(Request $request)
    {
        //count record for total record
        $vipSettingCount  = DB::table('vip_setting')->whereNull('deleted_at')->count();

        //Get value of offset and limit from url or set default value
        $start = (isset($request->start))?$request->start:'';
        $limit =(isset($request->limit))?$request->limit:'';
        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        $type = 'all';
        // getting type of filter requested
        if ($request->filter != '') {
            $data = json_decode($request->filter);

            if (!empty($data)) {
                $type = $data->filter_by;
            }
        }
        //If pass site id than return notes related to site else return all notes

        $vipSetting = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $vipSetting = Vip_setting::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $vipSetting = Vip_setting::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $vipSetting = Vip_setting::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $vipSetting = Vip_setting::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    $vipSetting = Vip_setting::query();

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $search_field_fname=$request->search;
                        $vipSetting= $vipSetting->orWhere('description_en','LIKE','%'.$search_field_fname.'%');
                        $vipSetting= $vipSetting->orWhere('description_ur','LIKE','%'.$search_field_fname.'%');

                        $vipSettingCount= $vipSetting->whereNull('deleted_at')->count();
                    }

                    //check for order column value get from api or not
                    if($request->orderCol !='' || $request->orderCol !=NULL)
                    {
                        $orderCol=$request->orderCol;
                    }
                    else
                    {
                        $orderCol='id';
                    }

                    //check for order by value get from api or not
                    if($request->orderby !='' || $request->orderby !=NULL)
                    {
                        $orderby=$request->orderby;
                    }
                    else
                    {
                        $orderby='desc';
                    }

                    if($start == '' && $limit == '')
                    {
                        $vipSetting= $vipSetting->whereNull('deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $vipSetting= $vipSetting->whereNull('deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }
            $vipSetting =$vipSetting->toArray();
            
            //If note is not empty
            if (!empty($vipSetting)) 
            {
                foreach($vipSetting as $pk=>$pv)
                {
                    if($pv['vipImg']!='')
                    {
                        $vipSetting[$pk]['vipImg'] = config::get('constant.VIP_SETTING_PATH').$pv['vipImg'];
                    }
                    else
                    {
                        $vipSetting[$pk]['vipImg'] = '-';
                    }

                }

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipSetting'] = $vipSetting;
                $this->msg['data']['recordsTotal'] = $vipSettingCount;
                $http_code = 200;
            } 
            else 
            {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipSetting'] = [];
                $http_code = 200;
            }
        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }

    /**
     * Below function is used for adding vipsetting
     */
    public function addVipSetting(Request $request)
    {
        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        
        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'description_en' => 'required',
                    'description_ur' => 'required',
                    'vipImg' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {

            $vipImg='';

            try {

                if ($request->hasFile('vipImg'))
                {
                    if ($request->file('vipImg')->isValid()) {

                        $vipImgName = time().'.'.request()->file('vipImg')->getClientOriginalExtension();
                        request()->file('vipImg')->move(public_path('uploads/vip_setting'), $vipImgName);

                        if($vipImgName)
                        {
                            $vipImg=$vipImgName;
                        }
                    }
                }


                if(isset($request->description_en) && $request->description_en!='')
                {
                    $description_en = $request->description_en;
                }

                if(isset($request->description_ur) && $request->description_ur!='')
                {
                    $description_ur = $request->description_ur;
                }

                //Create vipsetting
                $vipsetting = Vip_setting::create([
                            'vipImg'=>$vipImg,
                            'description_en'=>$description_en,
                            'description_ur'=>$description_ur,
                            'created_at' => date('Y-m-d H:i:s'),
                            'updated_at' => date('Y-m-d H:i:s'),
                ]);

                //if vipsetting added successfully
                if (!empty($vipsetting)) {
                    $this->msg['message'] = trans('messages.vipsetting_create_successful');
                    $this->msg['data'] = $vipsetting;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.vipsetting_create_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (Exception $e) {
                // if exception occurs during adding Product
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
        } else {
            //If Validation Fails than return message
            $error_message = $validator->messages()->first();
            $this->msg['message'] = $error_message;
            $this->msg['data'] = (object) null;
            $http_code = '401';
        }
        // IF all good so return json response
        return response()->json($this->msg, $http_code);

    }

    /**
     * Below function is used for updating vipsetting
     */
    public function updateVipSetting(Request $request)
    {
         //Checking validation 
         $validator = Validator::make($request->all(), [
            'description_en' => 'required',
            'description_ur' => 'required',
            'vipImg' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            
            $vipImg='';


            try {

                if ($request->hasFile('vipImg'))
                {
                    if ($request->file('vipImg')->isValid()) 
                    {
                        $vipImgName = time().'.'.request()->file('vipImg')->getClientOriginalExtension();
                        request()->file('vipImg')->move(public_path('uploads/vip_setting'), $vipImgName);

                        if($vipImgName)
                        {
                            $vipImg=$vipImgName;
                        }
                    }
                }
                else
                {
                    $vipImg = $request->oldVipImg;
                }


                // Find vipsetting
                $vipsetting = Vip_setting::findOrFail($request->id);

                if(isset($request->description_en) && $request->description_en!='')
                {
                    $vipsetting->description_en = $request->description_en;
                }

                if(isset($request->description_ur) && $request->description_ur!='')
                {
                    $vipsetting->description_ur = $request->description_ur;
                }

                //Update vipsetting
                $vipsetting->vipImg = $vipImg;
                $vipsetting->updated_at = date('Y-m-d H:i:s');

                //if vipsetting updated
                if ($vipsetting->save()) 
                {
                    $this->msg['message'] = trans('messages.vipsetting_update_success');
                    $this->msg['data'] = $vipsetting;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.vipsetting_update_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.vipsetting_not_exist');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            } catch (Exception $e) {
                // if exception occurs during adding vipsetting
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
        } else {
            //If Validation Fails than return message
            $error_message = $validator->messages()->first();
            $this->msg['message'] = $error_message;
            $this->msg['data'] = (object) null;
            $http_code = '401';
        }
        // IF all good so return json response
        return response()->json($this->msg, $http_code);

    }
  
    /**
     * Function to update vipsetting from admin active, inactive, delete and undelete
     * Method: PUT
     * Request URL: http://your-domain.com/api/channel
     * User will update user profile in system using this api
     * Request Data: user data in json    
     * */

    /**
     * Below function is used for status change of vipsetting
     */
    public function multiAction(Request $request) {
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request, Vip_setting::class, 'Vip_setting', $request->ids);

        //Returns response json
        return response()->json($this->msg);
    }

   
}
