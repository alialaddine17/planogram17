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
use App\Anouncement;
use Config;

class AnouncementController extends Controller
{
    public function __constructor(){

    }

     /**
     * Below function is used for listing announcement
     */
    public function listAnouncement(Request $request)
    {
        
        //count record for total record
        $anouncementCount  = DB::table('anouncement')->whereNull('deleted_at')->count();

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

        $anouncement = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $anouncement = Anouncement::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $anouncement = Anouncement::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $anouncement = Anouncement::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $anouncement = Anouncement::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    $anouncement = Anouncement::query();

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $search_field_fname=$request->search;
                        $anouncement= $anouncement->orWhere('anouncementTitle_en','LIKE','%'.$search_field_fname.'%');
                        $anouncement= $anouncement->orWhere('anouncementTitle_ur','LIKE','%'.$search_field_fname.'%');

                        $anouncementCount= $anouncement->whereNull('deleted_at')->count();
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
                        $anouncement= $anouncement->whereNull('deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $anouncement= $anouncement->whereNull('deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }
            $anouncement =$anouncement->toArray();
            
            //If note is not empty
            if (!empty($anouncement)) 
            {
                foreach($anouncement as $pk=>$pv)
                {
                    if($pv['anouncementImg']!='')
                    {
                        $anouncement[$pk]['anouncementImg'] = config::get('constant.ANNOUNCEMENTIMG_PATH').$pv['anouncementImg'];
                    }
                    else
                    {
                        $anouncement[$pk]['anouncementImg'] = '-';
                    }

                    if($pv['pdf']!='')
                    {
                        $anouncement[$pk]['pdf'] = config::get('constant.ANNOUNCEMENTPDF_PATH').$pv['pdf'];
                    }
                    else
                    {
                        $anouncement[$pk]['pdf'] = '-';
                    }

                }

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['anouncement'] = $anouncement;
                $this->msg['data']['recordsTotal'] = $anouncementCount;
                $http_code = 200;
            } 
            else 
            {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['anouncement'] = [];
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
     * Below function is used for adding announcement
     */
    public function addAnnouncement(Request $request)
    {
        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        
        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'anouncementTitle_en' => 'required',
                    'anouncementTitle_ur' => 'required',
                    'anouncementImg' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {

            $announcementImg='';
            $anouncementPdf='';
            $anouncement_pdf_url= '';
            $downloadBtnTxt = '';

            try {

                if ($request->hasFile('anouncementImg'))
                {
                    if ($request->file('anouncementImg')->isValid()) {

                        $anouncementImgName = time().'.'.request()->file('anouncementImg')->getClientOriginalExtension();
                        request()->file('anouncementImg')->move(public_path('uploads/anouncement'), $anouncementImgName);

                        if($anouncementImgName)
                        {
                            $anouncementImg=$anouncementImgName;
                        }
                    }
                }

                if ($request->hasFile('pdf'))
                {
                    if ($request->file('pdf')->isValid()) {

                        $anouncementPdfName = time().'.'.request()->file('pdf')->getClientOriginalExtension();
                        request()->file('pdf')->move(public_path('uploads/anouncementPdf'), $anouncementPdfName);

                        if($anouncementPdfName)
                        {
                            $anouncementPdf=$anouncementPdfName;
                        }
                    }
                }
                
                if(isset($request->anouncement_pdf_url) && $request->anouncement_pdf_url!='')
                {
                    $anouncement_pdf_url = $request->anouncement_pdf_url;
                }
                
                if(isset($request->description_en) && $request->description_en!='')
                {
                    $description_en = $request->description_en;
                }

                if(isset($request->description_ur) && $request->description_ur!='')
                {
                    $description_ur = $request->description_ur;
                }

                if(isset($request->downloadBtnTxt) && $request->downloadBtnTxt!='')
                {
                    $downloadBtnTxt = $request->downloadBtnTxt;
                }
                else
                {
                    $downloadBtnTxt = 'Download PDF';
                }

                //Create Announcement
                $announcement = Anouncement::create([
                            'anouncementTitle_en'=>$request->anouncementTitle_en,
                            'anouncementTitle_ur'=>$request->anouncementTitle_ur,
                            'anouncementImg'=>$anouncementImg,
                            'description_en'=>$description_en,
                            'description_ur'=>$description_ur,
                            'downloadBtnTxt'=>$downloadBtnTxt,
                            'anouncement_pdf_url'=>$anouncement_pdf_url,
                            'pdf'=>$anouncementPdf,
                            'created_at' => date('Y-m-d H:i:s'),
                            'updated_at' => date('Y-m-d H:i:s'),
                ]);

                //if Announcement added successfully
                if (!empty($announcement)) {
                    $this->msg['message'] = trans('messages.announcement_create_successful');
                    $this->msg['data'] = $announcement;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.announcement_create_failed');
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
     * Below function is used for updating announcement
     */
    public function updateAnnouncement(Request $request)
    {
         //Checking validation 
         $validator = Validator::make($request->all(), [
            'anouncementTitle_en' => 'required',
            'anouncementTitle_ur' => 'required',
            'anouncementImg' => 'mimes:jpeg,jpg,png,gif|max:10000'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            
            $announcementImg='';
            $announcementPdf = '';
            $downloadBtnTxt = '';

            try {

                if ($request->hasFile('anouncementImg'))
                {
                    if ($request->file('anouncementImg')->isValid()) 
                    {
                        $announcementImgName = time().'.'.request()->file('anouncementImg')->getClientOriginalExtension();
                        request()->file('anouncementImg')->move(public_path('uploads/anouncement'), $announcementImgName);

                        if($announcementImgName)
                        {
                            $announcementImg=$announcementImgName;
                        }
                    }
                }
                else
                {
                    $announcementImg = $request->oldAnnouncementImg;
                }

                if ($request->hasFile('pdf'))
                {
                    if ($request->file('pdf')->isValid()) 
                    {
                        $announcementPdfName = time().'.'.request()->file('pdf')->getClientOriginalExtension();
                        request()->file('pdf')->move(public_path('uploads/anouncementPdf'), $announcementPdfName);

                        if($announcementPdfName)
                        {
                            $announcementPdf=$announcementPdfName;
                        }
                    }
                }
                else
                {
                    $announcementPdf = $request->oldAnnouncementPdf;
                }

                // Find Announcement
                $announcement = Anouncement::findOrFail($request->anouncement_id);
                
                if(isset($request->anouncement_pdf_url) && $request->anouncement_pdf_url!='')
                {
                    $announcement->anouncement_pdf_url = $request->anouncement_pdf_url;
                }

                if(isset($request->description_en) && $request->description_en!='')
                {
                    $announcement->description_en = $request->description_en;
                }

                if(isset($request->description_ur) && $request->description_ur!='')
                {
                    $announcement->description_ur = $request->description_ur;
                }

                if(isset($request->downloadBtnTxt) && $request->downloadBtnTxt!='')
                {
                    $announcement->downloadBtnTxt = $request->downloadBtnTxt;
                }

                //Update Announcement
                $announcement->anouncementTitle_en = $request->anouncementTitle_en;
                $announcement->anouncementTitle_ur = $request->anouncementTitle_ur;
                $announcement->anouncementImg = $announcementImg;
                $announcement->pdf = $announcementPdf;
                $announcement->updated_at = date('Y-m-d H:i:s');

                //if announcement updated
                if ($announcement->save()) 
                {
                    $this->msg['message'] = trans('messages.announcement_update_success');
                    $this->msg['data'] = $announcement;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.announcement_update_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.announcement_not_exist');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            } catch (Exception $e) {
                // if exception occurs during adding announcement
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
     * Below function is used for deleting announcement
     */
    public function deleteAnnouncement(Request $request){
        try {
            
            //Find announcement
            $announcement = Anouncement::findOrFail($request->anouncement_id);

            //if product delete successfully
            if ($announcement->delete()) {
                $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('Announcement')));
                $this->msg['data'] = (object) null;
                $http_code = '200';
            } else {
                $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('Announcement')));
                $this->msg['data'] = (object) null;
                $http_code = '400';
            }
        } catch (ModelNotFoundException $e) {
            // if exception occurs during adding products
            $this->msg['message'] = trans('messages.products_not_exist');
            $this->msg['data'] = (object) null;
            $http_code = '500';
        } catch (Exception $e) {
            // if exception occurs during adding products
            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (object) null;
            $http_code = '500';
        }
        // IF all good so return json response
        return response()->json($this->msg, $http_code);
    }

    /**
     * Below function is used for status change of announcement
     */
    public function multiAction(Request $request) {
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request, Anouncement::class, 'Anouncement', $request->ids);

        //Returns response json
        return response()->json($this->msg);
    }
}
