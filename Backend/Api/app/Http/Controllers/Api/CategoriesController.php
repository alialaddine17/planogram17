<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use DB;
use Validator;
use Carbon\Carbon;
use Config;
use Categorie;
use SubCategory;

class CategoriesController extends Controller {
    
    public $paginate=10;

    public function __construct() {
        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = (array) null;
        $http_code = 200;
    }

    /**
     * Function to get Categories Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getCategories(Request $request) 
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
            $categoriesData = $this->getCategoriesData('',$paginate,$searchString);
            
            
            if(isset($categoriesData) && !empty($categoriesData))
            {   
                $categoriesData = $categoriesData->toArray();

                foreach($categoriesData as $ck=>$cv)
                {
                    if(isset($cv->catImg) && $cv->catImg!='' && $cv->catImg!='-')
                    {
                        $categoriesData[$ck]->catImg = config::get('constant.CATEGORIES_IMG').$cv->catImg;
                    }
                    else
                    {
                        $categoriesData[$ck]->catImg = '';
                    }
                }

                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($categoriesData, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($categoriesData), $perPage, $page);
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
                $this->msg['message'] = trans('messages.categories_sent_success');

                
                
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
     * Function to get Categories Data
     * Method: POST
     * Request URL: http://your-domain.com/api/banner
     * Request Data: - User data in json format
     * */
    public function getSubCategories(Request $request) 
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
            $subCategoriesData = $this->getSubCategoriesData('',$paginate,$searchString,$catId);
            
            $finalArr = [];
            if(isset($subCategoriesData) && !empty($subCategoriesData))
            {   
                $subCategoriesData = $subCategoriesData->toArray();

                //Get the Products Data
                if(isset($subCategoriesData) && !empty($subCategoriesData))
                {
                    foreach($subCategoriesData as $sk=>$sv)
                    {
                        //Get the parent category name
                        $mainCat = DB::table('categories')->select('id as catId','title_en', 'title_ur','subTitle_en','subTitle_ur','created_at')->where(array('deleted_at'=>NULL,'status'=>'1','id'=>$sv->parentid))->first();
                        
                        if(isset($mainCat) && !empty($mainCat))
                        {
                            $finalArr[$sk]['category']['catId'] = $mainCat->catId;
                            $finalArr[$sk]['category']['title_en'] = $mainCat->title_en;
                            $finalArr[$sk]['category']['title_ur'] = $mainCat->title_ur;
                            $finalArr[$sk]['category']['created_at'] = $mainCat->created_at;

                            $finalArr[$sk]['category']['sub-category']['subCatId'] = $sv->id;
                            $finalArr[$sk]['category']['sub-category']['title_en'] = $sv->title_en;
                            $finalArr[$sk]['category']['sub-category']['title_ur'] = $sv->title_ur;
                            $finalArr[$sk]['category']['sub-category']['subTitle_en'] = $sv->subTitle_en;
                            $finalArr[$sk]['category']['sub-category']['subTitle_ur'] = $sv->subTitle_ur;
                            $finalArr[$sk]['category']['sub-category']['created_at'] = $sv->created_at;

                            //Get the products
                            $products = DB::table('products')->select('id as productId','title_en','title_ur','productImg','trafficFlow','label','productDesc_en','productDesc_ur','created_at')->where(array('deleted_at'=>NULL,'status'=>'1','catId'=>$catId,'subCatId'=>$sv->id))->orderBy('sortOrder')->get();

                            if(isset($products) && !empty($products))
                            {
                                foreach($products as $pk=>$pv)
                                {
                                    $finalArr[$sk]['category']['sub-category']['products'][$pk]['productId'] = $pv->productId;

                                    if($pv->title_en == '<no-title>')
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['title_en'] = '';
                                    }
                                    else
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['title_en'] = $pv->title_en;
                                    }

                                    if($pv->title_ur == '<no-title>')
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['title_ur'] = '';
                                    }
                                    else
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['title_ur'] = $pv->title_ur;
                                    }
                                    
                                    $finalArr[$sk]['category']['sub-category']['products'][$pk]['productDesc_en'] = $pv->productDesc_en;
                                    $finalArr[$sk]['category']['sub-category']['products'][$pk]['productDesc_ur'] = $pv->productDesc_ur;
                                    $finalArr[$sk]['category']['sub-category']['products'][$pk]['trafficFlow'] = $pv->trafficFlow;

                                    if(isset($pv->productImg) && $pv->productImg!='')
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['productImg'] = config::get('constant.PRODUCTIMG_PATH').$pv->productImg;
                                    }
                                    else
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['productImg'] = '-';
                                    }

                                    if(isset($pv->label) && $pv->label!='' && $pv->label!='-')
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['label'] = config::get('constant.LABEL_PATH').$pv->label;
                                    }
                                    else
                                    {
                                        $finalArr[$sk]['category']['sub-category']['products'][$pk]['label'] = '';
                                    }
                                    
                                    $finalArr[$sk]['category']['sub-category']['products'][$pk]['created_at'] = $pv->created_at;
                                }
                            }
                        }
                    }
                }

                $perPage = isset($request->pageSize) ? $request->pageSize : '10';
                $page = isset($request->page) ? $request->page : '1';
                $itemsForCurrentPage = array_slice($finalArr, $perPage * ($page - 1), $perPage); 

                $result = new \Illuminate\Pagination\LengthAwarePaginator($itemsForCurrentPage, count($finalArr), $perPage, $page);
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
                $this->msg['message'] = trans('messages.subcategories_sent_success');
                
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
     * Below function is used for searching the data
     */
    public function getCatSearch(Request $request)
    {
        try 
        {
            //Check if any search filter is passed from mobile
            if(isset($request->searchString) && $request->searchString!='')
            {
                $searchString = $request->searchString;
            }
            else
            {
                $searchString = '';
            }

            //Search for categories
            $categories = DB::table('categories')->select('categories.*')
            ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.parentid'=>'0'))
            ->where(function ($query) use ($searchString){
                $query->orWhere('categories.title_en','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.title_ur','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.title_ur','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.subTitle_en','LIKE','%'.$searchString.'%');
                      
            })->orderBy('catSortOrder')->get();

            //Search for sub categories
            $subCategories = DB::table('categories')->select('categories.*')
            ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1'))
            ->where('categories.parentid','<>','0')
            ->where(function ($query) use ($searchString){
                $query->orWhere('categories.title_en','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.title_ur','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.title_ur','LIKE','%'.$searchString.'%')
                      ->orWhere('categories.subTitle_en','LIKE','%'.$searchString.'%');
            })->orderBy('catSortOrder')->get();

             //Search for products
            $products = DB::table('products')->select('products.*')
            ->where(array('products.deleted_at'=>NULL,'products.status'=>'1'))
            ->where(function ($query) use ($searchString){
                $query->orWhere('products.title_en','LIKE','%'.$searchString.'%')
                      ->orWhere('products.title_ur','LIKE','%'.$searchString.'%')
                      ->orWhere('products.productDesc_en','LIKE','%'.$searchString.'%')
                      ->orWhere('products.productDesc_ur','LIKE','%'.$searchString.'%');
            })->orderBy('sortOrder')->get();

            if(isset($categories) && !empty($categories))
            {
                $catArr = $categories->toArray();

                if(count($catArr) > 0)
                {
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.search_success');
                    $http_code = 200;
                    $this->msg['data']['categoryData'] = $categories;
                }
            }

            if(isset($subCategories) && !empty($subCategories))
            {
                $subCatArr = $subCategories->toArray();

                if(count($subCatArr) > 0)
                {
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.search_success');
                    $http_code = 200;
                    $this->msg['data']['SubCategoryData'] = $subCategories;
                    
                }
            }

            if(isset($products) && !empty($products))
            {
                $productsArr = $products->toArray();

                if(count($productsArr) > 0)
                {
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.search_success');
                    $http_code = 200;
                    $this->msg['data']['productsData'] = $productsArr;
                    
                }
            }

            if(isset($catArr) && count($catArr)<=0 && isset($subCatArr) && count($subCatArr)<=0 && isset($products) && count($products)<=0)
            {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.search_fail');
                $http_code = 200;
                $this->msg['data'] = [];
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
     * Below function is used to get Categories Data
     */
    public function getCategoriesData($id='',$paginate='',$searchStr='')
    {
        $categories = '';
     
        if($id=='')
        {
            if($searchStr!='')
            {
                $categories = DB::table('categories')->select('categories.*')
                ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.parentid'=>'0'))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('categories.title_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('categories.title_ur','LIKE','%'.$searchStr.'%');
                })->orderBy('catSortOrder')->get();
            }
            else
            {
                $categories = DB::table('categories')->select('categories.*')
                ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.parentid'=>'0'))->orderBy('catSortOrder')->get();
            }
        }
        else
        {
            $categories = DB::table('categories')->select('categories.*')
            ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.id'=>$id,'categories.parentid'=>'0'))
            ->orderBy('catSortOrder')
            ->first();
        }

        return $categories;
    }

     /**
     * Below function is used to get SubCategrories Data
     */
    public function getSubCategoriesData($id='',$paginate='',$searchStr='',$catId='')
    {
        $subCategories = '';

        if($id=='')
        {
            if($searchStr!='')
            {
                $subCategories = DB::table('categories')->select('categories.*')
                ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.parentid'=>$catId))
                ->where(function ($query) use ($searchStr){
                    $query->orWhere('categories.title_en','LIKE','%'.$searchStr.'%')
                          ->orWhere('categories.title_ur','LIKE','%'.$searchStr.'%');
                })->orderBy('catSortOrder')->get();
            }
            else
            {
                $subCategories = DB::table('categories')->select('categories.*')
                ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.parentid'=>$catId))->orderBy('catSortOrder')->get();
            }
        }
        else
        {
            $subCategories = DB::table('categories')->select('categories.*')
            ->where(array('categories.deleted_at'=>NULL,'categories.status'=>'1','categories.id'=>$id,'categories.parentid'=>$catId))
            ->orderBy('catSortOrder')->first();
        }

        return $subCategories;
    }
}
