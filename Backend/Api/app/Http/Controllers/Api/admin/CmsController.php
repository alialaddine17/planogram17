<?php

namespace App\Http\Controllers\Api\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\User;
use App\CMS;
use App\UserRole;
use App\Role;
use App\Module;
use App\Menu;
use App\RolePermission;
use App\Helpers\Helper;
use Response;
use Validator;
use DB;
use Carbon\Carbon;

class CmsController extends Controller {

	/**
	* Default class constructor
	*
	*/
	public function __construct(){
	
	}

	 /**
    * API for listing of CMS pages
    * Method: GET  
    * @param
    * @return 
    */ 
    public function getCms(Request $request){

        $filter = '';
      
        $moduleFinal = modulePermissions($request->url(),Auth::user()->id);
        
        // getting type of filter requested
        if($request->has('filter') && $request->filter != ''){

            $data = json_decode($request->filter);

            if(!empty($data) && $data->filter_by !=''){
                $filter = $data->filter_by;
            }

        }

         try {

            // filtering data based on requested filter
            switch ($filter) {
                case 'only_active':
                    $query = CMS::where('status',1);
                    break;

                case 'only_inactive':
                    $query = CMS::where('status',0);
                    break;

                case 'only_deleted':

                    $query = CMS::onlyTrashed();
                    break;

                case 'all':

                    $query = CMS::whereNull('deleted_at');
                    break;

                default:
                    $query = CMS::withTrashed();
                    break;
            }

            // getting cms pages
            $pages = $query->select('id','page_name','page_title','slug','description','content','meta_keyword','meta_description','status','created_at','deleted_at')->orderBy('page_title','ASC')->get()->toArray();
            
            if(!empty($pages)){
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data'] = $pages;
                $http_code = 200;
            }
            else{
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
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
    * API for Updating CMS page status
    * Method: PUT  
    * @param
    * @return 
    */ 
    public function updateCmsPageStatus(Request $request,$page_id=''){

        $validator = Validator::make($request->all(),[
            'status' => 'required'
        ]);

        if(!$validator->fails()){

            try {
                            
                $page = CMS::findOrFail($page_id);

                $page->status = $request->status;  

                $saved = $page->save();

                // if page status updated successfully 
                if($saved){
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.page_status_update_success');
                    $http_code = 200;
                }
                else{
                    // if failed to update goal
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.page_status_update_faield');
                    $http_code = 400;   
                }
             

            } catch (ModelNotFoundException $e){
                // handling model not found exception
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = 500;

            } 
            catch (Exception $e) {
                
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = 500;

            }

        }
        else{
            // if validation rules are not satisfied
            $error_message = $validator->messages()->first();

            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = 400;
        }

        return response()->json($this->msg, $http_code); 

    }

     /**
    * API for add CMS page
    * Method: PUT  
    * @param
    * @return 
    */ 
    public function addCmsPage(Request $request){
        $validator = Validator::make($request->all(),[
            'page_name' => 'required',
            'page_title' => 'required',
            'content' => 'required'
        ]);
    	//Checking validation
        if(!$validator->fails()){

            try {
            	//If valiation successfull than create cms 
              	$cms = CMS::create([
                    'page_name'=>$request->page_title,
                    'page_title'=>$request->page_title,
              		'slug'=>$request->page_name,
              		'description'=>$request->page_name,
              		'content'=>$request->content,
              	]);

                 // if page status updated successfully 
                if($cms){
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.page_create_successful');
                    $http_code = 200;
                }
                else{
                    // if failed to update goal
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.page_create_failed');
                    $http_code = 400;   
                }

                
            } catch (Exception $e) {
                
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = 500;
            }

        }
        else{

             // if validation rules are not satisfied
            $error_message = $validator->messages()->first();

            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = 400;

        }

         return response()->json($this->msg, $http_code); 
    }

    
    public function deleteCmsPage($page_id=''){
        try {

        	$page = CMS::findOrFail($page_id);
            // if page status updated successfully 
            if( $page->delete()){
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.page_delete_successful');
                $http_code = 200;
            }
            else{
                // if failed to update goal
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.page_delete_failed');
                $http_code = 400;   
            }

            
        } catch (ModelNotFoundException $e){
            // handling model not found exception
            $this->msg['status'] = 0;
            $this->msg['message'] = trans('messages.page_not_found');
            $http_code = 500;

        } catch (Exception $e) {
            
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;

    	}
        return response()->json($this->msg, $http_code); 
    }

    /**
    * API for Updating CMS page
    * Method: PUT  
    * @param
    * @return 
    */ 
    public function updateCmsPage(Request $request,$page_id=''){

        $validator = Validator::make($request->all(),[
            'page_name' => 'required',
            'page_title' => 'required',
            'content' => 'required'
        ]);

        if(!$validator->fails()){

            try {

                $page = CMS::findOrFail($page_id);

                $page->page_title = $request->page_title;
                $page->page_name = $request->page_title;
                $page->description = $request->description;
                $page->content = $request->content;
                $page->meta_keyword = $request->meta_keyword;
                $page->meta_description = $request->meta_description;

                $saved = $page->save();

                 // if page status updated successfully 
                if($saved){
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.page_update_successful');
                    $http_code = 200;
                }
                else{
                    // if failed to update goal
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.page_update_failed');
                    $http_code = 400;   
                }

                
            } catch (ModelNotFoundException $e){
                // handling model not found exception
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = 500;

            } catch (Exception $e) {
                
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = 500;

            }

        }
        else{

             // if validation rules are not satisfied
            $error_message = $validator->messages()->first();

            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = 400;

        }

         return response()->json($this->msg, $http_code); 
    }

    /* *
     * Function to update users from admin active, inactive, delete and undelete
     * Method: PUT
     * Request URL: 
     * User will update user profile in system using this api
     * Request Data: user data in json    
     * */
     public function multiAction(Request $request,$ids='') 
     {
     	
        $update = 0;
        $message = '';
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request,CMS::class,'CMS',$ids);
        
        //Returns response json
        return response()->json($this->msg); 
     }

}


