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
use App\Vip_categories;
use App\Vip_details;
use Config;

class VipController extends Controller
{
    public function __constructor(){

    }

    public function listDetailVip(Request $request)
    {
        //count record for total record
        //Check for the filter of category
        if(isset($request->vipId) && $request->vipId != '')
        {
            $vipDetailCount  = DB::table('vip_details')->whereNull('deleted_at')->where('vipId',$request->vipId)->count();
        }
        else
        {
            $vipDetailCount  = DB::table('vip_details')->whereNull('deleted_at')->count();
        }
        

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
        $vipDetailCategories = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $vipDetailCategories = Vip_details::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $vipDetailCategories = Vip_details::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $vipDetailCategories = Vip_details::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $vipDetailCategories = Vip_details::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    //$vipCategories = Vip_categories::query();

                    $vipDetailCategories = DB::table('vip_details')->select('vip_categories.title_en','vip_categories.title_ur','vip_details.status','vip_categories.deleted_at','vip_categories.created_at as createdAt','vip_details.id','vip_details.vipId','vip_details.detailTitle_en','vip_details.detailTitle_ur','vip_details.subTitle_en','vip_details.subTitle_ur','vip_details.vipImg','vip_details.description_en','vip_details.description_ur')->leftJoin('vip_categories', 'vip_details.vipId', '=', 'vip_categories.id')->where('vip_details.detailTitle_en','!=','');

                    //Check for the filter of category
                    if(isset($request->vipId) && $request->vipId != '')
                    {
                        $vipDetailCategories = $vipDetailCategories->where('vipId',$request->vipId);
                    }

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $searchStr=$request->search;

                        $vipDetailCategories= $vipDetailCategories->orWhere('vip_details.title_en','LIKE','%'.$searchStr.'%');
                        $vipDetailCategories= $vipDetailCategories->orWhere('vip_details.title_ur','LIKE','%'.$searchStr.'%');


                        if(isset($request->vipId) && $request->vipId != '')
                        {
                            $vipDetailCount= $vipDetailCount->whereNull('vip_details.deleted_at')->where('vipId',$request->vipId)->count();
                        }
                        else
                        {
                            $vipDetailCount= $vipDetailCount->whereNull('vip_details.deleted_at')->count();
                        }

                        
                    }

                    //check for order column value get from api or not
                    if($request->orderCol !='' || $request->orderCol !=NULL)
                    {
                        $request->orderCol = 'vip_details.id';
                        $orderCol=$request->orderCol;
                    }
                    else
                    {
                        $orderCol='vip_details.id';
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
                        $vipDetailCategories= $vipDetailCategories->whereNull('vip_details.deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $vipDetailCategories= $vipDetailCategories->whereNull('vip_details.deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }

            $vipDetailCategories =$vipDetailCategories->toArray();
            
            //If note is not empty
            if (!empty($vipDetailCategories)) 
            {
                foreach($vipDetailCategories as $vk=>$vv)
                {
                    
                    if($vv->vipImg !='')
                    {
                        $vipDetailCategories[$vk]->vipImg = config::get('constant.VIPIMG_PATH').$vv->vipImg;
                    }
                    else
                    {
                        $vipDetailCategories[$vk]->vipImg = '-';
                    }

            
                }


                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipDetailCategories'] = $vipDetailCategories;
                $this->msg['data']['recordsTotal'] = $vipDetailCount;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipDetailCategories'] = [];
                $http_code = 200;
            }
        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }

    public function listVip(Request $request)
    {
        
        //count record for total record
        $vipCount  = DB::table('vip_categories')->whereNull('deleted_at')->count();

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
        $vipCategories = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $vipCategories = Vip_categories::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $vipCategories = Vip_categories::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $vipCategories = Vip_categories::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $vipCategories = Vip_categories::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    //$vipCategories = Vip_categories::query();

                    $vipCategories = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.description_en','vip_categories.description_ur','vip_categories.status','vip_categories.deleted_at','vip_categories.created_at as createdAt');

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $searchStr=$request->search;

                        $vipCategories= $vipCategories->orWhere('Vip_details.title_en','LIKE','%'.$searchStr.'%');
                        $vipCategories= $vipCategories->orWhere('Vip_details.title_ur','LIKE','%'.$searchStr.'%');

                        $vipCount= $vipCategories->whereNull('Vip_details.deleted_at')->count();
                    }

                    //check for order column value get from api or not
                    if($request->orderCol !='' || $request->orderCol !=NULL)
                    {
                        $request->orderCol = 'vip_categories.id';
                        $orderCol=$request->orderCol;
                    }
                    else
                    {
                        $orderCol='vip_categories.id';
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
                        $vipCategories= $vipCategories->whereNull('vip_categories.deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $vipCategories= $vipCategories->whereNull('vip_categories.deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }

            $vipCategories =$vipCategories->toArray();
            
            //If note is not empty
            if (!empty($vipCategories)) 
            {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipCategories'] = $vipCategories;
                $this->msg['data']['recordsTotal'] = $vipCount;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['vipCategories'] = [];
                $http_code = 200;
            }
        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }

    public function addVip(Request $request){

        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        
        $vipImg='';

        try {
                //add vip details added successfully
                if (isset($request->vipId) && $request->vipId!='') 
                {
                    if ($request->hasFile('vipImg'))
                    {
                        if ($request->file('vipImg')->isValid()) {

                            $vipImgName = time().'.'.request()->file('vipImg')->getClientOriginalExtension();
                            request()->file('vipImg')->move(public_path('uploads/vip'), $vipImgName);

                            if($vipImgName)
                            {
                                $vipImg=$vipImgName;
                            }
                        }
                    }

                    //Insert into details
                    $vipCategoriesDetails = Vip_details::create([
                        'vipId'=>$request->vipId,
                        'detailTitle_en'=>$request->detailTitle_en,
                        'detailTitle_ur'=>$request->detailTitle_ur,
                        'subTitle_en'=>$request->subTitle_en,
                        'subTitle_ur'=>$request->subTitle_ur,
                        'vipImg'=>$vipImg,
                        'description_en'=>$request->description_en,
                        'description_ur'=>$request->description_ur,
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                        ]);


                    $this->msg['message'] = trans('messages.vip_create_successful');
                    $this->msg['data'] = $vipCategoriesDetails;
                    $http_code = '200';
                } 
                else 
                {
                    //Create VIp
                    $vipCategories = Vip_categories::create([
                        'title_en'=>$request->title_en,
                        'title_ur'=>$request->title_ur,
                        'created_at' => date('Y-m-d H:i:s'),
                        'updated_at' => date('Y-m-d H:i:s'),
                    ]);

                    $this->msg['message'] = trans('messages.vip_create_successful');
                    $this->msg['data'] = $vipCategories;
                    $http_code = '200';
                }
        } catch (Exception $e) {
            // if exception occurs during adding vip
            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (object) null;
            $http_code = '500';
        }
        
        // IF all good so return json response
        return response()->json($this->msg, $http_code);
    }


    public function updateVip(Request $request){

        if($request->module=='vip'){
            //Checking validation 
            $validator = Validator::make($request->all(), [
                'title_en'=>'required',
                'title_ur'=>'required',
                'description_en'=>'required',
                'description_ur'=>'required',
            ]);
        }else if($request->module=='vip_detail'){
            //Checking validation 
            $validator = Validator::make($request->all(), [
                'detailTitle_en' => 'required',
                'detailTitle_ur' => 'required',
                'subTitle_en' => 'required',
                'subTitle_ur' => 'required'
            ]);
        }

        //If validation is working fine with provided information
        if (!$validator->fails()) 
        {
            $vipImg='';

            try {

                if ($request->hasFile('vipImg'))
                {
                    if ($request->file('vipImg')->isValid()) {

                        $vipImgName = time().'.'.request()->file('vipImg')->getClientOriginalExtension();

                        request()->file('vipImg')->move(public_path('uploads/vip'), $vipImgName);

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

                if($request->module=='vip'){
                    // Find Vip
                    $vip = Vip_categories::findOrFail($request->id);

                    //Update Vip
                    $vip->title_en = $request->title_en;
                    $vip->title_ur = $request->title_ur;
                    $vip->description_en = $request->description_en;
                    $vip->description_ur = $request->description_ur;
                    $vip->updated_at = date('Y-m-d H:i:s');

                    if ($vip->save()) 
                    {
                        $this->msg['message'] = trans('messages.vip_update_success');
                        $this->msg['data'] = $vip;
                        $http_code = '200';
                    } 
                    else 
                    {
                        $this->msg['message'] = trans('messages.vip_update_failed');
                        $this->msg['data'] = (object) null;
                        $http_code = '400';
                    }

                }else if($request->module=='vip_detail'){
                     // Find Vip
                     $vip = Vip_details::findOrFail($request->id);

                     //Update Vip
                     $vip->vipId = $request->vipId;
                     $vip->detailTitle_en = $request->detailTitle_en;
                     $vip->detailTitle_ur = $request->detailTitle_ur;
                     $vip->subTitle_en = $request->subTitle_en;
                     $vip->subTitle_ur = $request->subTitle_ur;
                     $vip->vipImg = $vipImg;
                     $vip->description_en = $request->description_en;
                     $vip->description_ur = $request->description_ur;
                     $vip->updated_at = date('Y-m-d H:i:s');
 
                     if ($vip->save()) 
                     {
                         $this->msg['message'] = trans('messages.vip_update_success');
                         $this->msg['data'] = $vip;
                         $http_code = '200';
                     } 
                     else 
                     {
                         $this->msg['message'] = trans('messages.vip_update_failed');
                         $this->msg['data'] = (object) null;
                         $http_code = '400';
                     }
                }

            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.vip_not_exist');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            } catch (Exception $e) {
                // if exception occurs during adding vip
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
    public function deleteVip(Request $request){
        try {

            if(isset($request->module) && $request->module=='vip'){
                 //Find vip
                $vip = Vip_categories::findOrFail($request->id);

                //if vip delete successfully
                if ($vip->delete()) 
                {
                    //Delete the details
                    DB::table('vip_details')
                    ->where('vipId', $vip->id)
                    ->update(['deleted_at' => Carbon::now()]);

                    $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('Vip')));
                    $this->msg['data'] = (object) null;
                    $http_code = '200';
                } 
                else 
                {
                    $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('Vip')));
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            }else if(isset($request->module) && $request->module=='vip_detail'){
                //Find vip
               $vip = Vip_details::findOrFail($request->id);

               //if vip delete successfully
               if ($vip->delete()) 
               {

                   $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('Vip')));
                   $this->msg['data'] = (object) null;
                   $http_code = '200';
               } 
               else 
               {
                   $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('Vip')));
                   $this->msg['data'] = (object) null;
                   $http_code = '400';
               }
           }

        } catch (ModelNotFoundException $e) {
            // if exception occurs during adding vip
            $this->msg['message'] = trans('messages.vip_not_exist');
            $this->msg['data'] = (object) null;
            $http_code = '500';
        } catch (Exception $e) {
            // if exception occurs during adding vip
            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (object) null;
            $http_code = '500';
        }
        // IF all good so return json response
        return response()->json($this->msg, $http_code);
    }

    /**
     * Function to update vip from admin active, inactive, delete and undelete
     * Method: PUT
     * Request URL: http://your-domain.com/api/channel
     * User will update user profile in system using this api
     * Request Data: user data in json    
     * */

    public function multiAction(Request $request) 
    {

        //Pass request, model and ids in helper function 
        if($request->module=='vip'){
            $this->msg = Helper::multiAction($request, Vip_categories::class, $request->module, $request->id);
        }else if($request->module=='vip_detail'){
            $this->msg = Helper::multiAction($request, Vip_details::class, $request->module, $request->id);
        }else{
            $msg['status'] = 0;
            $msg['message'] = 'Select Module.';
            $msg['http_code'] = 400;
            $this->msg = $msg;
        }

        //Returns response json
        return response()->json($this->msg);
    }

    /**
     * Below function is used for listing products for dropdown
     */
    public function listVipCategories(Request $request) {
        
        $subcategories = array();
        try {
            
            $vipCategories = Vip_categories::whereNull('deleted_at')->orderby('title_en', 'ASC')->get()->toArray();

            //If note is not empty
            if (!empty($vipCategories)) {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['vipCategories'] = $vipCategories;
                
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['vipCategories'] = null;
                $http_code = 200;
            }
        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }
}
