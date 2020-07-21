<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Validator;
use Carbon\Carbon;
use Config;
use App\Vip_setting;

class VipSettingController extends Controller {
    
    public $paginate=10;

    public function __construct() {
        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = (array) null;
        $http_code = 200;
    }

    /**
     * Function to get vip setting Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getVipSetting(Request $request) 
    {
        try 
        {
            $paginate = isset($request->per_page) ? $request->per_page : '100';

            //Check if any search filter is passed from mobile
            if(isset($request->searchString) && $request->searchString!='')
            {
                $searchString = $request->searchString;
            }
            else
            {
                $searchString = '';
            }

            //Check if any search filter is passed from mobile
            if(isset($request->orderBy) && $request->orderBy!='')
            {
                $orderBy = $request->orderBy;
            }
            else
            {
                $orderBy=0;
            }

            //Get Vip setting Details
            $vipSettingData = $this->getVipSettingData('',$paginate,$searchString);
            
            if(isset($vipSettingData) && !empty($vipSettingData))
            {   
                $vipSettingData = $vipSettingData->toArray();
                
                foreach($vipSettingData as $ak=>$av)
                {
                    if($av->vipImg!='')
                    {
                        $vipSettingData[$ak]->vipImg = config::get('constant.VIP_SETTING_PATH').$av->vipImg;
                    }
                }
                
                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($vipSettingData, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($vipSettingData), $perPage, $page);
                $result = $result->toArray();
                
                $finalData = [];
                
                if(isset($result) && !empty($result))
                {
                    $finalData['current_page'] = $result['current_page'];
                    $finalData['content'] = $result['data'];
                    $finalData['from'] = $result['from'];
                    $finalData['last_page'] = $result['last_page'];
                    $finalData['next_page_url'] = $result['next_page_url'];
                    $finalData['path'] = $result['path'];
                    $finalData['per_page'] = $result['per_page'];
                    $finalData['prev_page_url'] = $result['prev_page_url'];
                    $finalData['to'] = $result['to'];
                    $finalData['total'] = $result['total'];
                }
                
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.vipsetting_sent_success');
                
                if(count($finalData) >0)
                {
                    $this->msg['data'] = $finalData;
                }
                else
                {
                    $this->msg['data'] = (object) $finalData;
                }
                
                $http_code = 200;
            }
        } catch (Exception $e) {
            // if exception occurs during listing
            $this->msg['status'] = 0;
            

            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (array) null;
            $http_code = '500';
        }
         
        
        return response()->json($this->msg, $http_code);
    }

    /**
     * Below function is used to get vipSetting Data
     */
    public function getVipSettingData($id='',$paginate='',$searchStr='')
    {
        $vipSetting = '';
     
        if($id=='')
        {
            if($searchStr!='')
            {
                $vipSetting = DB::table('vip_setting')->select('vip_setting.id','vip_setting.vipImg','vip_setting.description_en','vip_setting.description_ur','vip_setting.status','vip_setting.created_at')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1'))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('.vip_setting.description_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('vip_setting.description_ur','LIKE','%'.$searchStr.'%');
                })->get();
            }
            else
            {
                $vipSetting = DB::table('vip_setting')->select('vip_setting.id','vip_setting.vipImg','vip_setting.description_en','vip_setting.description_ur','vip_setting.status','vip_setting.created_at')
                ->where(array('vip_setting.deleted_at'=>NULL,'vip_setting.status'=>'1'))->get();
            }
        }
        else
        {
            $vipSetting = DB::table('vip_setting')->select('vip_setting.id','vip_setting.vipImg','vip_setting.description_en','vip_setting.description_ur','vip_setting.status','vip_setting.created_at')
            ->where(array('vip_setting.deleted_at'=>NULL,'vip_setting.status'=>'1'))->first();
        }

        return $vipSetting;
    }
}
