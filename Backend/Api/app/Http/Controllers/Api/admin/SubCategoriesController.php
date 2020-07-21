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
use App\SubCategory;
use Response;
use Carbon\Carbon;
use File;
use App\Helpers\Helper;

class SubCategoriesController extends Controller
{
    public function __constructor(){

    }

    public function listSubCategories(Request $request){
        
        //count record for total record
        $subCategoriesCount  = DB::table('categories')->whereNull('deleted_at')->where('parentid','<>','0')->count();

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
                    $subCategories = SubCategory::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $subCategories = SubCategory::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $subCategories = SubCategory::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $subCategories = SubCategory::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    $subcategories = SubCategory::query();

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $searchStr = $request->search;
                        
                        $subcategories->where(function ($query) use ($searchStr){
                            $query->orWhere('title_en','LIKE','%'.$searchStr.'%')
                                   ->orWhere('title_ur','LIKE','%'.$searchStr.'%');
                        });                        

                        $subCategoriesCount= $subcategories->whereNull('deleted_at')->where('parentid','<>','0')->count();
                    }
                    
                    $subcategories= $subcategories->where('parentid','<>','0');

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
                        $subcategories= $subcategories->where('parentid','<>','0')->whereNull('deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $subcategories= $subcategories->where('parentid','<>','0')->whereNull('deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    break;
            }

            $subcategories =$subcategories->toArray();
            
            //If note is not empty
            if (!empty($subcategories)) 
            {
                foreach($subcategories as $sk=>$sv)
                {
                    $mainCatid = DB::table('categories')->select('parentid')->where('parentid',$sv['parentid'])->where('deleted_at',null)->first();
                    
                    if(isset($mainCatid) && !empty($mainCatid))
                    {
                        $mainCatName = DB::table('categories')->select('title_en as mainCatTitle')->where('id',$mainCatid->parentid)->where('deleted_at',null)->first();

                        $subcategories[$sk]['mainCat'] = $mainCatName->mainCatTitle;
                    }
                }

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['subcategories'] = $subcategories;
                $this->msg['data']['recordsTotal'] = $subCategoriesCount;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['subcategories'] = [];
                $http_code = 200;
            }
        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }

    public function addSubCategories(Request $request){

        $sortOrder = '';
        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        
        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'title_en' => 'required',
                    'title_ur' => 'required',
                    'parentid' => 'required',
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {

            if(isset($request->catSortOrder) && $request->catSortOrder!='')
            {
                $sortOrder = $request->catSortOrder;
            }

            if(isset($request->subTitle_en) && $request->subTitle_en!='')
            {
                $subTitle_en = $request->subTitle_en;
            }
            else
            {
                $subTitle_en = '';
            }

            if(isset($request->subTitle_ur) && $request->subTitle_ur!='')
            {
                $subTitle_ur = $request->subTitle_ur;
            }
            else
            {
                $subTitle_ur = '';
            }

            try {
                //Create Sub Categories
                $subcategorie = SubCategory::create([
                            'title_en'=>$request->title_en,
                            'title_ur'=>$request->title_ur,
                            'parentid'=>$request->parentid,
                            'catSortOrder'=>$sortOrder,
                            'subTitle_en'=>$subTitle_en,
                            'subTitle_ur'=>$subTitle_ur,
                            'created_at' => date('Y-m-d H:i:s'),
                            'updated_at' => date('Y-m-d H:i:s'),
                ]);

                //if Sub Category added successfully
                if (!empty($subcategorie)) {
                    $this->msg['message'] = trans('messages.subcategorie_create_successful');
                    $this->msg['data'] = $subcategorie;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.subcategorie_create_failed');
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

    public function updateSubCategories(Request $request){

        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'title_en' => 'required',
                    'title_ur' => 'required',
                    'parentid' => 'required',
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            try {

                if(isset($request->subTitle_en) && $request->subTitle_en!='')
                {
                    $subTitle_en = $request->subTitle_en;
                }
                else
                {
                    $subTitle_en = '';
                }
    
                if(isset($request->subTitle_ur) && $request->subTitle_ur!='')
                {
                    $subTitle_ur = $request->subTitle_ur;
                }
                else
                {
                    $subTitle_ur = '';
                }

                if(isset($request->catSortOrder) && $request->catSortOrder!='')
                {
                    $sortOrder = $request->catSortOrder;
                }

                // Find Categorie
                $subcategories = SubCategory::findOrFail($request->subcategories_id);

                //Update Categorie 
                $subcategories->title_en = $request->title_en;
                $subcategories->title_ur = $request->title_ur;
                $subcategories->parentid = $request->parentid;
                $subcategories->subTitle_en = $request->subTitle_en;
                $subcategories->subTitle_ur = $request->subTitle_ur;
                $subcategories->catSortOrder = $request->catSortOrder;
                $subcategories->updated_at = date('Y-m-d H:i:s');

                //if Categorie updated
                if ($subcategories->save()) {
                    $this->msg['message'] = trans('messages.subcategories_update_success');
                    $this->msg['data'] = $subcategories;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.subcategories_not_exist');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.subcategories_not_exist');
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

    public function deleteSubCategories(Request $request){
        try {
            
            //Find categories
            $categories = SubCategory::findOrFail($request->subcategories_id);

            //if categories updated successfully
            if ($categories->delete()) {
                $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('SubCategory')));
                $this->msg['data'] = (object) null;
                $http_code = '200';
            } else {
                $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('SubCategory')));
                $this->msg['data'] = (object) null;
                $http_code = '400';
            }
        } catch (ModelNotFoundException $e) {
            // if exception occurs during adding categories
            $this->msg['message'] = trans('messages.subcategories_not_exist');
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

    public function categoriesdropdown(Request $request) {
        
        $categories = array();
        try {
            $categories = Categorie::whereNull('deleted_at')->where('parentid','0')->orderby('title_en', 'ASC')->get()->toArray();
            

            //If note is not empty
            if (!empty($categories)) {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['categories'] = $categories;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['categories'] = null;
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
     * Function to update categories from admin active, inactive, delete and undelete
     * Method: PUT
     * Request URL: http://your-domain.com/api/channel
     * User will update user profile in system using this api
     * Request Data: user data in json    
     * */

    public function multiAction(Request $request) {
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request, Categorie::class, 'SubCategory', $request->ids);

        //Returns response json
        return response()->json($this->msg);
    }
}
