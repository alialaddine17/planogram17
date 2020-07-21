<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Validator;
use Carbon\Carbon;
use Config;
use App\Anouncement;

class AnnouncementController extends Controller {
    
    public $paginate=10;

    public function __construct() {
        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = (array) null;
        $http_code = 200;
    }

    /**
     * Function to get Announcement Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getAnnouncement(Request $request) 
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

            //Get Announcement Details
            $announcementData = $this->getAnnouncementData('',$paginate,$searchString);
            
            if(isset($announcementData) && !empty($announcementData))
            {   
                $announcementData = $announcementData->toArray();
                
                foreach($announcementData as $ak=>$av)
                {
                    if($av->anouncementImg!='')
                    {
                        $announcementData[$ak]->anouncementImg = config::get('constant.ANNOUNCEMENTIMG_PATH').$av->anouncementImg;
                    }

                    if($av->pdf!='')
                    {
                        $announcementData[$ak]->pdf = config::get('constant.ANNOUNCEMENTPDF_PATH').$av->pdf;
                    }
                    else
                    {
                        $announcementData[$ak]->pdf = $av->anouncement_pdf_url;
                    }
                    
                }

                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($announcementData, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($announcementData), $perPage, $page);
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
                $this->msg['message'] = trans('messages.announcement_sent_success');
                
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
     * Below function is used to get Announcement Data
     */
    public function getAnnouncementData($id='',$paginate='',$searchStr='')
    {
        $announcement = '';
     
        if($id=='')
        {
            if($searchStr!='')
            {
                $announcement = DB::table('anouncement')->select('anouncement.id','anouncement.anouncementTitle_en','anouncement.anouncementTitle_ur','anouncement.anouncementImg','anouncement.description_en','anouncement.description_ur','anouncement.anouncement_pdf_url','anouncement.downloadBtnTxt','pdf','anouncement.status','anouncement.created_at')
                ->where(array('vip_categories.deleted_at'=>NULL,'vip_categories.status'=>'1'))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('.anouncementTitle_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('anouncement.anouncementTitle_ur','LIKE','%'.$searchStr.'%');
                })->orderBy('anouncement.id','desc')->get();
            }
            else
            {
                $announcement = DB::table('anouncement')->select('anouncement.id','anouncement.anouncementTitle_en','anouncement.anouncementTitle_ur','anouncement.anouncementImg','anouncement.description_en','anouncement.description_ur','anouncement.anouncement_pdf_url','anouncement.downloadBtnTxt','pdf','anouncement.status','anouncement.created_at')
                ->where(array('anouncement.deleted_at'=>NULL,'anouncement.status'=>'1'))->orderBy('anouncement.id','desc')->get();
            }
        }
        else
        {
            $announcement = DB::table('anouncement')->select('anouncement.id','anouncement.anouncementTitle_en','anouncement.anouncementTitle_ur','anouncement.anouncementImg','anouncement.description_en','anouncement.description_ur','pdf','anouncement.downloadBtnTxt','anouncement.anouncement_pdf_url','anouncement.status','anouncement.created_at')
            ->where(array('anouncement.deleted_at'=>NULL,'anouncement.status'=>'1'))->orderBy('anouncement.id','desc')->first();
        }

        return $announcement;
    }
}
