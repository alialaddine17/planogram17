<?php

use Illuminate\Http\Request;
header('Access-Control-Allow-Origin:*');
//Access-Control-Allow-Origin: *
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Routes for mobile
Route::get('categories','Api\CategoriesController@getCategories');
Route::get('sub-categories','Api\CategoriesController@getSubCategories');
Route::get('vip','Api\VipController@getVipData');
Route::get('vip-details','Api\VipController@getVipDetails');
Route::get('announcement','Api\AnnouncementController@getAnnouncement');
Route::get('vip-setting','Api\VipSettingController@getVipSetting');
Route::get('search','Api\CategoriesController@getCatSearch');
Route::get('generalSettings','Api\SettingsController@getSettings');


Route::post('admin/login', 'Api\admin\AdminController@login');//->middleware('ipcheck');
Route::post('admin/changepassword', 'Api\admin\AdminController@changepassword');//->middleware('ipcheck');
Route::get('admin/statistics', 'Api\admin\AdminController@statistics');

Route::middleware(['auth:api'])->group(function () {
	
	Route::post('details', 'Api\AuthController@details');
    Route::delete('deleteprofile', 'Api\AuthController@deleteprofile');
    Route::get('editprofile/{id}', 'Api\AuthController@editProfile');
	Route::put('updateprofile/{id}', 'Api\AuthController@updateProfile');
	
	//Api routes usefull for manage user profile module
	Route::get('admin/profile/{id}', 'Api\admin\AdminController@editprofile');
	Route::put('admin/profile/{id}', 'Api\admin\AdminController@updateprofile');

	
	Route::middleware(['aclcheck:settings'])->group(function() {
	Route::get('settings', 'Api\admin\AdminController@settings');
	Route::post('settings', 'Api\admin\AdminController@updateSettings');
	Route::post('admin/testEmail', 'Api\admin\AdminController@testEmail');
	});
    
	//Api routes usefull for manage CMS module
	Route::middleware(['aclcheck:cms'])->group(function(){
		Route::get('page','Api\admin\CmsController@getCms');
		Route::put('page/changestatus/{page_id}','Api\admin\CmsController@updateCmsPageStatus');
		Route::put('page/{page_id}','Api\admin\CmsController@updateCmsPage');
		Route::delete('page/{page_id}','Api\admin\CmsController@deleteCmsPage');
		Route::post('page','Api\admin\CmsController@addCmsPage');
		Route::put('page/mulitiaction/{ids?}', 'Api\admin\CmsController@multiAction');
	});

	//Api routes usefull for manage Categories module
	Route::middleware(['aclcheck:categories'])->group(function(){
		Route::get('admin/categories','Api\admin\CategoriesController@listCategories');
		Route::post('admin/categories','Api\admin\CategoriesController@addCategories');
		Route::post('admin/categories/{categories_id}','Api\admin\CategoriesController@updateCategories');
		Route::delete('admin/categories/{categories_id}','Api\admin\CategoriesController@deleteCategories');
		Route::put('admin/categories/mulitiaction/{ids?}', 'Api\admin\CategoriesController@multiAction');
	});

	//Api routes usefull for manage Sub Categories module
	Route::middleware(['aclcheck:sub-categories'])->group(function(){
		Route::get('admin/sub-categories','Api\admin\SubCategoriesController@listSubCategories');
		Route::post('admin/sub-categories','Api\admin\SubCategoriesController@addSubCategories');
		Route::put('admin/sub-categories/{subcategories_id}','Api\admin\SubCategoriesController@updateSubCategories');
		Route::delete('admin/sub-categories/{subcategories_id}','Api\admin\SubCategoriesController@deleteSubCategories');
		Route::put('admin/sub-categories/mulitiaction/{ids?}', 'Api\admin\SubCategoriesController@multiAction');
		Route::get('admin/sub-categories/categoriesdropdown', 'Api\admin\SubCategoriesController@categoriesdropdown');
		
	});

	//Api routes usefull for manage Products module
	Route::middleware(['aclcheck:products'])->group(function(){
		Route::get('admin/products','Api\admin\ProductsController@listProducts');
		Route::post('admin/products','Api\admin\ProductsController@addProducts');
		Route::post('admin/products/{products_id}','Api\admin\ProductsController@updateProducts');
		Route::delete('admin/products/{products_id}','Api\admin\ProductsController@deleteProducts');
		Route::put('admin/products/mulitiaction/{ids?}', 'Api\admin\ProductsController@multiAction');
		Route::get('admin/products/{categories_id}','Api\admin\ProductsController@listSubCategories');
	});

	//Api routes usefull for manage VIP
	Route::middleware(['aclcheck:vip'])->group(function(){
		Route::get('admin/vip','Api\admin\VipController@listDetailVip');
		Route::get('admin/vipMain','Api\admin\VipController@listVip');
		Route::post('admin/vip','Api\admin\VipController@addVip');
		Route::post('admin/vip/{id}','Api\admin\VipController@updateVip');
		Route::delete('admin/vip','Api\admin\VipController@deleteVip');
		Route::put('admin/vip/mulitiaction', 'Api\admin\VipController@multiAction');
		Route::get('admin/vip/categories','Api\admin\VipController@listVipCategories');
	});
	
	//Api routes usefull for manage VIP Setting
	Route::middleware(['aclcheck:vip-setting'])->group(function(){
		Route::get('admin/vip-setting','Api\admin\VipSettingController@listVipSetting');
		Route::post('admin/vip-setting','Api\admin\VipSettingController@addVipSetting');
		Route::post('admin/vip-setting/{id}','Api\admin\VipSettingController@updateVipSetting');
		Route::put('admin/vip-setting/mulitiaction/{ids?}', 'Api\admin\VipSettingController@multiAction');
	});

	//Api routes usefull for manage Anouncement module
	Route::middleware(['aclcheck:anouncement'])->group(function(){
		Route::get('admin/anouncement','Api\admin\AnouncementController@listAnouncement');
		Route::post('admin/anouncement','Api\admin\AnouncementController@addAnnouncement');
		Route::post('admin/anouncement/{anouncement_id}','Api\admin\AnouncementController@updateAnnouncement');
		Route::delete('admin/anouncement/{anouncement_id}','Api\admin\AnouncementController@deleteAnnouncement');
		Route::put('admin/anouncement/mulitiaction/{ids?}', 'Api\admin\AnouncementController@multiAction');
	});
});

