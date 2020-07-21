<?php

namespace App\Http\Controllers\Api\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Validator;
use DB;
use App\Categorie;
use Response;
use Carbon\Carbon;
use File;
use App\Helpers\Helper;
use App\SubCategory;
use Config;

class CategoriesController extends Controller
{
    public function __constructor(){

    }

    /**
     * Below function is used for listing categories
     */
    public function listCategories(Request $request){
        
        //count record for total record
        $categoriesCount  = DB::table('categories')->whereNull('deleted_at')->where('parentid','0')->count();

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

        $categories = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $categories = Categorie::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $categories = Categorie::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $categories = Categorie::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $categories = Categorie::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    $categories = Categorie::query();

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        
                        $searchStr = $request->search;

                        $categories->where(function ($query) use ($searchStr){
                            $query->orWhere('title_en','LIKE','%'.$searchStr.'%')
                                  ->orWhere('title_ur','LIKE','%'.$searchStr.'%');
                        });
                        
                        $categoriesCount= $categories->whereNull('deleted_at')->where('parentid','0')->count();
                    }
                    
                    $categories= $categories->where('parentid','0');

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
                        $categories= $categories->where('parentid','0')->whereNull('deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $categories= $categories->where('parentid','0')->whereNull('deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }
            $categories =$categories->toArray();
            
            //If note is not empty
            if (!empty($categories)) 
            {
                foreach($categories as $ck=>$cv)
                {
                    if($cv['catImg']!='' && $cv['catImg']!='-')
                    {
                        $categories[$ck]['catImg'] = config::get('constant.CATEGORIES_IMG').$cv['catImg'];
                    }
                    else
                    {
                        $categories[$ck]['catImg'] = '-';
                    }
                }

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['categories'] = $categories;
                $this->msg['data']['recordsTotal'] = $categoriesCount;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['categories'] = (object) null;
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
     * Below function is used for adding categories
     */
    public function addCategories(Request $request){

        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'title_en' => 'required',
                    'title_ur' => 'required'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            try {
                $catImg='';

                //Store bully request data with video
                if ($request->hasFile('catImg'))
                {
                    if ($request->file('catImg')->isValid()) {

                        $categoryImgName = time().'.'.request()->file('catImg')->getClientOriginalExtension();
                        request()->file('catImg')->move(public_path('uploads/categories'), $categoryImgName);

                        if($categoryImgName)
                        {
                            $catImg=$categoryImgName;
                        }
                    }
                }

                if(isset($request->catSortOrder) && $request->catSortOrder!='')
                {
                    $catSortOrder = $request->catSortOrder;
                }
                else
                {
                    $catSortOrder = '';
                }

                //Create Categorie 
                $categorie = Categorie::create([
                            'title_en'=>$request->title_en,
                            'title_ur'=>$request->title_ur,
                            'catImg'=>$catImg,
                            'catSortOrder'=>$catSortOrder,
                            'parentid'=>'0',
                            'created_at' => date('Y-m-d H:i:s'),
                            'updated_at' => date('Y-m-d H:i:s'),
                ]);

                //if Categorie added successfully
                if (!empty($categorie)) {
                    $this->msg['message'] = trans('messages.categorie_create_successful');
                    $this->msg['data'] = $categorie;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.categorie_create_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (Exception $e) {
                // if exception occurs during adding Categorie
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
     * Below function is used for updating categories
     */
    public function updateCategories(Request $request){

        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'title_en' => 'required',
                    'title_ur' => 'required'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            try {

                $catImg='';

                if ($request->hasFile('catImg'))
                {
                    if ($request->file('catImg')->isValid()) 
                    {
                        $catImgName = time().'.'.request()->file('catImg')->getClientOriginalExtension();
                        request()->file('catImg')->move(public_path('uploads/categories'), $catImgName);

                        if($catImgName)
                        {
                            $catImg=$catImgName;
                        }
                    }
                }
                else
                {
                    $catImg = $request->oldCatImg;
                }

                if(isset($request->catSortOrder) && $request->catSortOrder!='')
                {
                    $catSortOrder = $request->catSortOrder;
                }
                else
                {
                    $catSortOrder = '';
                }

                // Find Categorie
                $categories = Categorie::findOrFail($request->categories_id);

                //Update Categorie 
                $categories->title_en = $request->title_en;
                $categories->title_ur = $request->title_ur;
		        $categories->subTitle_en = $request->subTitle_en;
		        $categories->subTitle_ur = $request->subTitle_ur;
                $categories->parentid = '0';
                $categories->catImg = $catImg;
                $categories->catSortOrder = $catSortOrder;
                $categories->updated_at = date('Y-m-d H:i:s');

                //if Categorie updated
                if ($categories->save()) {
                    $this->msg['message'] = trans('messages.categories_update_success');
                    $this->msg['data'] = $categories;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.categories_update_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.categories_not_exist');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            } catch (Exception $e) {
                // if exception occurs during adding Categorie
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
     * Below function is used for deleting categories
     */
    public function deleteCategories(Request $request){
        try {
            
            //Find categories
            $categories = Categorie::findOrFail($request->categories_id);

            //if categories updated successfully
            if ($categories->delete()) 
            {
                //Delete sub categories as well
                DB::table('categories')
                ->where('parentid', $request->categories_id)
                ->update(['deleted_at' => Carbon::now()]);

                $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('Category')));
                $this->msg['data'] = (object) null;
                $http_code = '200';
            } 
            else 
            {
                $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('Category')));
                $this->msg['data'] = (object) null;
                $http_code = '400';
            }
        } catch (ModelNotFoundException $e) {
            // if exception occurs during adding categories
            $this->msg['message'] = trans('messages.categories_not_exist');
            $this->msg['data'] = (object) null;
            $http_code = '500';
        } catch (Exception $e) {
            // if exception occurs during adding categories
            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (object) null;
            $http_code = '500';
        }
        // IF all good so return json response
        return response()->json($this->msg, $http_code);
    }

    /**
     * Below function is used for status change of categories
     */
    public function multiAction(Request $request) {
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request, Categorie::class, 'Categorie', $request->ids);

        //Returns response json
        return response()->json($this->msg);
    }
}
