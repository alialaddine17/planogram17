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
use App\Product;
use Config;

class ProductsController extends Controller
{
    public function __constructor(){

    }

    /**
     * Below function is used for listing products
     */
    public function listProducts(Request $request){
        //Check for the filter of category
        if(isset($request->catId) && $request->catId != '')
        {
            if(isset($request->subCatId) && $request->subCatId != '')
            {
                $productsCount  = DB::table('products')->whereNull('deleted_at')->where('catId',$request->catId)->where('subCatId',$request->subCatId)->count();    
            }
            else
            {
                $productsCount  = DB::table('products')->whereNull('deleted_at')->where('catId',$request->catId)->count();
            }
            
        }
        else
        {
            $productsCount  = DB::table('products')->whereNull('deleted_at')->count();
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

        $products = array();
        try {

            // filtering data based on requested filter
            switch ($type) {
                case 'only_active':
                    $products = Product::where('status', '1')->skip($start)->take($limit)->get();
                    break;

                case 'only_inactive':
                    $products = Product::where('status', '0')->skip($start)->take($limit)->get();
                    break;

                case 'with_deleted':
                    $products = Product::withTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'only_deleted':
                    $products = Product::onlyTrashed()->skip($start)->take($limit)->get();
                    break;

                case 'all':
                    $products = Product::query();

                    //Check for the filter of category
                    if(isset($request->catId) && $request->catId != '')
                    {
                        $products = $products->where('catId',$request->catId);
                    }

                    //Check for the filter of subcategory
                    if(isset($request->subCatId) && $request->subCatId != '')
                    {
                        $products = $products->where('subCatId',$request->subCatId);
                    }

                    //check for search value pass or not in api
                    if($request->search !='' || $request->search !=NULL)
                    {
                        $search_field_fname=$request->search;

                        if(isset($request->catId) && $request->catId != '')
                        {
                            if(isset($request->subCatId) && $request->subCatId != '')
                            {
                                $productsCount= $products->whereNull('deleted_at')->where('catId',$request->catId)->where('subCatId',$request->subCatId)->count();
                                $products= $products->where('catId',$request->catId)->where('subCatId',$request->subCatId)->orWhere('title_en','LIKE','%'.$search_field_fname.'%');
                                $products= $products->where('catId',$request->catId)->where('subCatId',$request->subCatId)->orWhere('title_ur','LIKE','%'.$search_field_fname.'%');
                                $products= $products->where('catId',$request->catId)->where('subCatId',$request->subCatId)->orWhere('sortOrder','LIKE','%'.$search_field_fname.'%');

                            }
                            else
                            {
                                $products= $products->where('catId',$request->catId)->orWhere('title_en','LIKE','%'.$search_field_fname.'%');
                                $products= $products->where('catId',$request->catId)->orWhere('title_ur','LIKE','%'.$search_field_fname.'%');
                                $products= $products->where('catId',$request->catId)->orWhere('sortOrder','LIKE','%'.$search_field_fname.'%');
                            }
                        }
                        else
                        {
                            $products= $products->orWhere('title_en','LIKE','%'.$search_field_fname.'%');
                            $products= $products->orWhere('title_ur','LIKE','%'.$search_field_fname.'%');
                            $products= $products->orWhere('sortOrder','LIKE','%'.$search_field_fname.'%');
                        }

                        //Check for the filter of category
                        if(isset($request->catId) && $request->catId != '')
                        {
                            if(isset($request->subCatId) && $request->subCatId != '')
                            {
                                $productsCount= $products->whereNull('deleted_at')->where('catId',$request->catId)->where('subCatId',$request->subCatId)->count();

                            }
                            else
                            {
                                $productsCount= $products->whereNull('deleted_at')->where('catId',$request->catId)->count();
                            }
                            
                        }
                        else
                        {
                            $productsCount  = $products->whereNull('deleted_at')->count();
                        }

                       
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
                        $products= $products->whereNull('deleted_at')->orderBy($orderCol, $orderby)->get();
                    }
                    else
                    {
                        $products= $products->whereNull('deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get();
                    }
                    
                    break;
            }
            $products =$products->toArray();
            
            //If note is not empty
            if (!empty($products)) 
            {
                foreach($products as $pk=>$pv)
                {
                    if($pv['productImg']!='')
                    {
                        $products[$pk]['productImg'] = config::get('constant.PRODUCTIMG_PATH').$pv['productImg'];
                    }
                    else
                    {
                        $products[$pk]['productImg'] = '-';
                    }

                    if($pv['label']!='' && $pv['label']!='-')
                    {
                        $products[$pk]['label'] = config::get('constant.LABEL_PATH').$pv['label'];
                    }
                    else
                    {
                        $products[$pk]['label'] = '-';
                    }

                    $mainCat = DB::table('categories')->select('title_en as mainCatTitle')->where('id',$pv['catId'])->first();
                    $subCat = DB::table('categories')->select('title_en as subCatTitle')->where('id',$pv['subCatId'])->first();

                    $products[$pk]['mainCat'] = $mainCat->mainCatTitle;
                    $products[$pk]['subCat'] = $subCat->subCatTitle;
                }

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['products'] = $products;
                $this->msg['data']['recordsTotal'] = $productsCount;
                $http_code = 200;
            } 
            else 
            {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['permission'] = $moduleFinal;
                $this->msg['data']['products'] = [];
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
     * Below function is used for adding products
     */
    public function addProducts(Request $request){

        $moduleFinal = modulePermissions($request->url(), Auth::user()->id);
        $sortOrder = '';
        $productDesc_en = '';
        $productDesc_ur = '';
        
        //Checking validation 
        $validator = Validator::make($request->all(), [
                    'catId'=>'required',
                    'subCatId'=>'required',
                    'title_en' => 'required',
                    'title_ur' => 'required',
                    'productImg' => 'mimes:jpeg,jpg,png,gif|required|max:10000'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {

            $productImg='';
            $labelImg='';
            

            try {
                    //Store bully request data with video
                    if ($request->hasFile('productImg'))
                    {
                        if ($request->file('productImg')->isValid()) {

                            $productImgName = time().'.'.request()->file('productImg')->getClientOriginalExtension();
                            request()->file('productImg')->move(public_path('uploads/product'), $productImgName);

                            if($productImgName)
                            {
                                $productImg=$productImgName;
                            }
                        }
                    }

                     //Store bully request data with video
                     if ($request->hasFile('label'))
                     {
                         if ($request->file('label')->isValid()) {
 
                             $labelImgName = time().'.'.request()->file('label')->getClientOriginalExtension();
                             request()->file('label')->move(public_path('uploads/label'), $labelImgName);
 
                             if($labelImgName)
                             {
                                 $labelImg=$labelImgName;
                             }
                         }
                     }

                    //Check for sort order
                    if(isset($request->sortOrder) && $request->sortOrder!='')
                    {
                        $sortOrder = $request->sortOrder;
                    }

                    //Check for Product Desc in English
                    if(isset($request->productDesc_en) && $request->productDesc_en!='')
                    {
                        $productDesc_en = $request->productDesc_en;
                    }

                    //Check for Product Desc in urdu
                    if(isset($request->productDesc_ur) && $request->productDesc_ur!='')
                    {
                        $productDesc_ur = $request->productDesc_ur;
                    }

                    //Create Products
                    $products = Product::create([
                                'catId'=>$request->catId,
                                'subCatId'=>$request->subCatId,
                                'title_en'=>$request->title_en,
                                'title_ur'=>$request->title_ur,
                                'productImg'=>$productImg,
                                'trafficFlow'=>$request->trafficFlow,
                                'label'=>$labelImg,
                                'sortOrder'=>$sortOrder,
                                'productDesc_en'=>$productDesc_en,
                                'productDesc_ur'=>$productDesc_ur,
                                'created_at' => date('Y-m-d H:i:s'),
                                'updated_at' => date('Y-m-d H:i:s'),
                    ]);

                    //if Product added successfully
                    if (!empty($products)) {
                        $this->msg['message'] = trans('messages.products_create_successful');
                        $this->msg['data'] = $products;
                        $http_code = '200';
                    } else {
                        $this->msg['message'] = trans('messages.products_create_failed');
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
     * Below function is used for updating products
     */
    public function updateProducts(Request $request){

         //Checking validation 
         $validator = Validator::make($request->all(), [
            'catId'=>'required',
            'subCatId'=>'required',
            'title_en' => 'required',
            'title_ur' => 'required'
        ]);

        //If validation is working fine with provided information
        if (!$validator->fails()) {
            
            $productImg='';
            $labelImg = '';
            $sortOrder = '';
            $productDesc_en = '';
            $productDesc_ur = '';

            try {

                if ($request->hasFile('productImg'))
                {
                    if ($request->file('productImg')->isValid()) 
                    {
                        $productImgName = time().'.'.request()->file('productImg')->getClientOriginalExtension();
                        request()->file('productImg')->move(public_path('uploads/product'), $productImgName);

                        if($productImgName)
                        {
                            $productImg=$productImgName;
                        }
                    }
                }
                else
                {
                    $productImg = $request->oldProductImg;
                }

                if ($request->hasFile('label'))
                {
                    if ($request->file('label')->isValid()) 
                    {
                        $labelImgName = time().'.'.request()->file('label')->getClientOriginalExtension();
                        request()->file('label')->move(public_path('uploads/label'), $labelImgName);

                        if($labelImgName)
                        {
                            $labelImg=$labelImgName;
                        }
                    }
                }
                else
                {
                    $labelImg = $request->oldlabelImg;
                }

                //Check for sort order
                if(isset($request->sortOrder) && $request->sortOrder!='')
                {
                    $sortOrder = $request->sortOrder;
                }

                //Check for Desc in english
                if(isset($request->productDesc_en) && $request->productDesc_en!='')
                {
                    $productDesc_en = $request->productDesc_en;
                }

                //Check for Desc in urdu
                if(isset($request->productDesc_ur) && $request->productDesc_ur!='')
                {
                    $productDesc_ur = $request->productDesc_ur;
                }

                // Find Product
                $product = Product::findOrFail($request->products_id);

                //Update Categorie 
                $product->catId = $request->catId;
                $product->subCatId = $request->subCatId;
                $product->title_en = $request->title_en;
                $product->title_ur = $request->title_ur;
                $product->productImg = $productImg;
                $product->label = $labelImg;
                $product->trafficFlow = $request->trafficFlow;
                $product->sortOrder = $sortOrder;
                $product->productDesc_en = $productDesc_en;
                $product->productDesc_ur = $productDesc_ur;
                $product->updated_at = date('Y-m-d H:i:s');

                //if product updated
                if ($product->save()) {
                    $this->msg['message'] = trans('messages.products_update_success');
                    $this->msg['data'] = $product;
                    $http_code = '200';
                } else {
                    $this->msg['message'] = trans('messages.products_update_failed');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (ModelNotFoundException $e) {
                $this->msg['message'] = trans('messages.products_not_exist');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            } catch (Exception $e) {
                // if exception occurs during adding product
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
     * Below function is used for deleting products
     */
    public function deleteProducts(Request $request){
        try {
            
            //Find products
            $products = Product::findOrFail($request->products_id);

            //if product delete successfully
            if ($products->delete()) {
                $this->msg['message'] = \Lang::get('messages.multi_delete_success', array('argument' => ucfirst('Product')));
                $this->msg['data'] = (object) null;
                $http_code = '200';
            } else {
                $this->msg['message'] = \Lang::get('messages.multi_delete_failed', array('argument' => ucfirst('Product')));
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
     * Below function is used for status change products
     */
    public function multiAction(Request $request) {
        //Pass request, model and ids in helper function 
        $this->msg = Helper::multiAction($request, Product::class, 'Product', $request->ids);

        //Returns response json
        return response()->json($this->msg);
    }

    /**
     * Below function is used for listing products for dropdown
     */
    public function listSubCategories(Request $request) {
        
        $subcategories = array();
        try {
            
            $subcategories = SubCategory::whereNull('deleted_at')->where('parentid',$request->categories_id)->orderby('title_en', 'ASC')->get()->toArray();
            

            //If note is not empty
            if (!empty($subcategories)) {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['subcategories'] = $subcategories;
                
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $this->msg['data']['subcategories'] = null;
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
