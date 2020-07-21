<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Validator;
use Carbon\Carbon;
use Config;
use Vip_categories;
use Vip_details;

class VipController extends Controller {
    
    public $paginate=10;

    public function __construct() {
        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = (array) null;
        $http_code = 200;
    }

    /**
     * Function to get VIP Categories Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getVipData(Request $request) 
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

            //Get Categories Streaming Details
            $vipCategoriesData = $this->getVipCategoriesData('',$paginate,$searchString);
            
            
            if(isset($vipCategoriesData) && !empty($vipCategoriesData))
            {   
                $vipCategoriesData = $vipCategoriesData->toArray();

                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($vipCategoriesData, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($vipCategoriesData), $perPage, $page);
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
                $this->msg['message'] = trans('messages.vipcat_sent_success');
                
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
     * Function to get VIP Categories Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getVipDetails(Request $request) 
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

            $catId = $request->catId;

            //Get Categories Streaming Details
            $vipDetailsData = $this->getVipDetailsData('',$paginate,$searchString,$catId);
            
            
            if(isset($vipDetailsData) && !empty($vipDetailsData))
            {   
                $vipDetailsData = $vipDetailsData->toArray();
                
                foreach($vipDetailsData as $vk=>$vv)
                {
                    if($vv->vipImg!='')
                    {
                        $vipDetailsData[$vk]->vipImg = config::get('constant.VIPIMG_PATH').$vv->vipImg;
                    }

                    if($vv->detailTitle_en == '<none>' || $vv->detailTitle_en == '')
                    {
                        $vipDetailsData[$vk]->detailTitle_en = '';
                    }
                    else
                    {
                        $vipDetailsData[$vk]->detailTitle_en = $vv->detailTitle_en;
                    }

                    if($vv->detailTitle_ur == '<none>' || $vv->detailTitle_ur == '')
                    {
                        $vipDetailsData[$vk]->detailTitle_ur = '';
                    }
                    else
                    {
                        $vipDetailsData[$vk]->detailTitle_ur = $vv->detailTitle_ur;
                    }

                    if($vv->description_en == '<p>no desc</p>' || $vv->description_en == '')
                    {
                        $vipDetailsData[$vk]->description_en = '';
                    }
                    else
                    {
                        $vipDetailsData[$vk]->description_en = $vv->description_en;
                    }

                    if($vv->description_ur == '<p>no desc</p>' || $vv->description_ur == '')
                    {
                        $vipDetailsData[$vk]->description_ur = '';
                    }
                    else
                    {
                        $vipDetailsData[$vk]->description_ur = $vv->description_ur;
                    }
                    
                }

                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($vipDetailsData, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($vipDetailsData), $perPage, $page);
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
                $this->msg['message'] = trans('messages.vipcat_details_sent_success');
                
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
     * Below function is used to get Sub Categories Data
     */
    public function getVipCategoriesData($id='',$paginate='',$searchStr='')
    {
        $vipCategories = '';
     
        if($id=='')
        {
            if($searchStr!='')
            {
                $vipCategories = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.description_en','vip_categories.description_ur','vip_categories.status','vip_categories.created_at')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1'))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('vip_categories.title_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('vip_categories.title_ur','LIKE','%'.$searchStr.'%');
                })->get();
            }
            else
            {
                $vipCategories = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.description_en','vip_categories.description_ur','vip_categories.status','vip_categories.created_at')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1'))->get();
            }
        }
        else
        {
            $vipCategories = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.description_en','vip_categories.description_ur','vip_categories.status','vip_categories.created_at')
            ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1'))->first();
        }

        return $vipCategories;
    }

    /**
     * Below function is used to get Sub Categories Data
     */
    public function getVipDetailsData($id='',$paginate='',$searchStr='',$catId='')
    {
        $vipDetails = '';
     
        if($id=='')
        {
            if($searchStr!='')
            {
                $vipDetails = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.status','vip_categories.created_at','vip_details.detailTitle_en','vip_details.detailTitle_ur','vip_details.subTitle_en','vip_details.subTitle_ur','vip_details.vipImg','vip_details.description_en','vip_details.description_ur','vip_details.id as detailId')
                ->leftJoin('vip_details', 'vip_details.vipId', '=', 'vip_categories.id')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1','vip_categories.id'=>$catId,'vip_details.deleted_at'=>NULL))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('vip_categories.title_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('vip_categories.title_ur','LIKE','%'.$searchStr.'%');
                })->get();
            }
            else
            {
                $vipDetails = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.status','vip_categories.created_at','vip_details.detailTitle_en','vip_details.detailTitle_ur','vip_details.subTitle_en','vip_details.subTitle_ur','vip_details.vipImg','vip_details.description_en','vip_details.description_ur','vip_details.id as detailId')
                ->leftJoin('vip_details', 'vip_details.vipId', '=', 'vip_categories.id')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_details.deleted_at'=>NULL,'vip_categories.status'=>'1','vip_categories.id'=>$catId))->get();
            }
        }
        else
        {
            $vipDetails = DB::table('vip_categories')->select('vip_categories.id','vip_categories.title_en','vip_categories.title_ur','vip_categories.status','vip_categories.created_at','vip_details.detailTitle_en','vip_details.detailTitle_ur','vip_details.subTitle_en','vip_details.subTitle_ur','vip_details.vipImg','vip_details.description_en','vip_details.description_ur','vip_details.id as detailId')
            ->leftJoin('vip_details', 'vip_details.vipId', '=', 'vip_categories.id')
            ->where(array('vip_categories.deleted_at'=>NULL,'vip_details.deleted_at'=>NULL,'vip_categories.status'=>'1','vip_categories.id'=>$catId))->first();
        }

        return $vipDetails;
    }
}
