<?php

namespace App\Http\Controllers\Api\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Validator;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Response;
use Helper;
use App\User;
use App\Role;
use App\Module;
use App\RolePermission;
use App\Permission;

class RoleController extends Controller {

	/**
	* Default Constructor
	*
	*/
	public function __constructor(){
		//print_r('hi');die;
	}

	/**
	* API function for adding new role
	* @param
	* @return 
	*/
	public function add(Request $request){
		
		$errFlag = false;
		// validating user input	
		$validator = Validator::make($request->all(),[
			'title' => 'required'
		]);

		// if validation rules are satisfied
		if(!$validator->fails()){

			try {
				
				DB::beginTransaction();

				// adding role in roles table
				$role = Role::create([
					'title' => $request->title,
					'status' => 1
				]);

				// if permission array is not null
				if(!empty($request->permissions)){

					// assigning permissions to roles
					foreach ($request->permissions as $key => $permission) {
						if($permission['can_create']){

							$modulePermissionCreate = Permission::where('module',$permission['id'])->where('name','can_create')->select('id')->first();


							$permission_create = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionCreate['id'],
							]);

							if(!$permission_create){
								$errFlag = true;
							}

						}

						if($permission['can_update']){
							
							$modulePermissionUpdate = Permission::where('module',$permission['id'])->where('name','can_update')->select('id')->first();
							
							$permission_update = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionUpdate['id'],
							]);

							if(!$permission_update){
								$errFlag = true;
							}

						}

						if($permission['can_view']){
							

							$modulePermissionView = Permission::where('module',$permission['id'])->where('name','can_view')->select('id')->first();
							
							$permission_view = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionView['id'],
							]);

							if(!$permission_view){
								$errFlag = true;
							}

						}

						if($permission['can_delete']){
							
							$modulePermissionDelete = Permission::where('module',$permission['id'])->where('name','can_delete')->select('id')->first();

							$permission_delete = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionDelete['id'],
							]);

							if(!$permission_delete){
								$errFlag = true;
							}

						}

					}
				}


				if(!$errFlag){

					$this->msg['message'] = "Role Created Successfully";
					$http_code = 200;

					// commiting changes if everything goes well
					DB::commit();
				}
				else{
					// commiting changes if everything goes well
					DB::rollback();
					$this->msg['message'] = "Failed To Create Roll";
					$http_code = 400;
				}

			} catch (Exception $e) {
				
				// if exception occures
				$this->msg['message'] = $e->getMessage();
				$http_code = 500;

				// rolling back db changes in something goes wrong
				DB::rollback();
			}
		}
		else{
			// if validation rules are 
			$message = $validator->messages()->first();
			$this->msg['message'] = $message;
			$http_code = 400; 
		}

		return response()->json($this->msg,$http_code);

	}

	/**
	* API function for listing roles
	* @param
	* @return 
	*/
	public function list_role(Request $request)
	{


		//Get value of offset and limit from url or set default value
		$start = (isset($request->start))?$request->start:10;
		$limit =(isset($request->limit))?$request->limit:10;
		

		//count record for total record
        $rolesCount  = DB::table('roles')->whereNull('deleted_at')->count();

		$type = '';

        // getting type of filter requested
        if($request->filter != ''){
            $data = json_decode($request->filter);

            if(!empty($data)){
                $type = $data->filter_by;
            }

        }

        try {

	        // filtering data based on requested filter
	        switch ($type) {
	            case 'only_active':
	                $query = Role::with('role_permissions')->with('role_permissions.module')->where('status',1);
	                break;

	            case 'only_inactive':
	                $query = Role::with('role_permissions')->with('role_permissions.module')->where('status',0);
	                break;

	            case 'only_deleted':

	                $query = Role::onlyTrashed()->with('role_permissions')->with('role_permissions.module');
	                break;

	            case 'all':
					$role = Role::query();

					//check for search value pass or not in api
					if($request->search !='' || $request->search !=NULL)
					{
						$search_field_fname=$request->search;
						$role= $role->orWhere('title','LIKE','%'.$search_field_fname.'%');
	
						$rolesCount= $role->whereNull('deleted_at')->count();
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
	                $query = $role->with('role_permissions')->with('role_permissions.module')->whereNull('deleted_at');
	                break;

	            default:
	                $query = Role::withTrashed()->with('role_permissions')->with('role_permissions.module')->whereNull('deleted_at');
	                break;
	        }

			$roles = $query->select('id','title','status','created_at','updated_at','deleted_at')->skip($start)->take($limit)->orderBy($orderCol, $orderby)->get()->toArray();
			
            
            if(!empty($roles)){

            	$res = [];

            	$modules = Module::where('status',1)->get()->toArray();

            	foreach ($roles as $role_key => $role) {

	            	$res[$role_key]['title'] = $role['title'];	
	            	$res[$role_key]['id'] = $role['id'];	
	            	$res[$role_key]['created_at'] = $role['created_at'];
	            	$res[$role_key]['status'] = $role['status'];
            		
            		$perm = [];

            		if(!empty($role['role_permissions'])){
            			foreach ($role['role_permissions'] as $permission_key => $permission) {
            				array_push($perm,$permission['label']);
            			}
            		}

            		if(empty($perm)){
            			$roles[$role_key]['role_permissions'] = '-';
            		}
            		else{
            			$roles[$role_key]['role_permissions'] = implode(',',$perm);
            		}

	            	if(!empty($role['role_permissions']) && isset($role['role_permissions'])){

	            		foreach ($role['role_permissions'] as $role_permission_key => $value) {

		            		$res[$role_key]['module_permission'][$value['module']['name']]['module_name'] = $value['module']['name'];
		            		$res[$role_key]['module_permission'][$value['module']['name']]['label'] = $value['module']['label'];
		            		$res[$role_key]['module_permission'][$value['module']['name']]['module_id'] = $value['module']['id'];
		            		
		            		if($value['name'] == 'can_create'){
		            			$res[$role_key]['module_permission'][$value['module']['name']]['can_create'] = true;
		            		}
		            		

		            		if($value['name'] == 'can_update'){
		            			
		            			$res[$role_key]['module_permission'][$value['module']['name']]['can_update'] = true;
		            		}
		            		

		            		if($value['name'] == 'can_view'){
		            			$res[$role_key]['module_permission'][$value['module']['name']]['can_view'] = true;
		            		}
		            		

		            		if($value['name'] == 'can_delete'){
		            			$res[$role_key]['module_permission'][$value['module']['name']]['can_delete'] = true;
		            		}

	            		}

		            	foreach ($modules as $module_key => $module) {

		            		if(!array_key_exists($module['name'],$res[$role_key]['module_permission'])){
		            			$res[$role_key]['module_permission'][$module['name']]['module_name'] = $module['name'];
		            			$res[$role_key]['module_permission'][$module['name']]['label'] = $module['label'];
		            			$res[$role_key]['module_permission'][$module['name']]['module_id'] = $module['id'];
		            			$res[$role_key]['module_permission'][$module['name']]['can_create'] = false;
		            			$res[$role_key]['module_permission'][$module['name']]['can_update'] = false;
		            			$res[$role_key]['module_permission'][$module['name']]['can_view'] = false;
		            			$res[$role_key]['module_permission'][$module['name']]['can_delete'] = false;
		            		}

		            	}

	            	}
	            	else{

	            		foreach ($modules as $module_key => $module) {


	            			$res[$role_key]['module_permission'][$module['name']]['module_name'] = $module['name'];
	            			$res[$role_key]['module_permission'][$module['name']]['label'] = $module['label'];
	            			$res[$role_key]['module_permission'][$module['name']]['module_id'] = $module['id'];
	            			$res[$role_key]['module_permission'][$module['name']]['can_create'] = false;
	            			$res[$role_key]['module_permission'][$module['name']]['can_update'] = false;
	            			$res[$role_key]['module_permission'][$module['name']]['can_view'] = false;
	            			$res[$role_key]['module_permission'][$module['name']]['can_delete'] = false;
	            		}

	            	}
            	}
            	
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
				$this->msg['data']['role'] = $res;
				$this->msg['data']['recordsTotal'] = $rolesCount;
                $http_code = 200;
            }
            else{
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $http_code = 200;
            }

        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }
	
		return response()->json($this->msg,$http_code);
	}

	/**
	* API function for deleting role
	* @param
	* @return 
	*/
	public function deleteRole(Request $request,$id=''){

		if($id !=''){

			try {

				$deletes = Role::where('id',$id)->delete();

	        	if(!$deletes)
		        {
		            //Returns If Users Not Updates.
		            $this->msg['status'] = 0;
		            $this->msg['message'] = trans('messages.record_delete_failed');
		            $this->msg['data'] = (object) null;
		            $http_code = '400';
		        }
		        else
		        {
		            //Returns If Users Updates.
		            $this->msg['status'] = 1;
		            $this->msg['message'] = trans('messages.record_delete_success');
		            $this->msg['data'] = (object) null;
		            $http_code = '200';
		        }
	        	
	        } catch (Exception $e) {
	        	
	        	$this->msg['status'] = 1;
	            $this->msg['message'] = $e->getMessage();
	            $this->msg['data'] = (object) null;
	            $http_code = '500';

	        }

		}
		else{

			$this->msg['status'] = 1;
            $this->msg['message'] = trans('messages.no_change');
            $this->msg['data'] = (object) null;
            $http_code = '500';


		}

		return response()->json($this->msg, $http_code);
	}

	/**
    * API for multiple delete,undelete and change status
    * @param 
    * @return 
    */
	public function multiAction(Request $request,$ids=''){

		/*$response =  Helper::multiAction($request,'Role','role',$ids);

		$this->msg['status'] = $response['status'];
		$this->msg['message'] = $response['message'];
		$http_code = $response['http_code'];

		return response()->json($this->msg, $http_code);*/

		if($request->has('action')){

			if($ids != ''){

				$arr = explode(',',$ids);

				switch ($request->action) {
					case '0':
						$action = Role::withTrashed()->whereIn('id',$arr)->update(['status'=>0]);
						break;
					case '1':
						$action = Role::withTrashed()->whereIn('id',$arr)->update(['status'=>1]);
						break;
					case '2':
						$action = Role::whereIn('id',$arr)->delete();
						break;
					case '3':
						$action = Role::withTrashed()->whereIn('id',$arr)->update(['deleted_at'=>NULL]);
						break;
					default:
						# code...
						break;
				}

				if($action){

					if($request->action == 0){
						$message = \Lang::get('messages.multi_inactive_success',array('argument'=>'Role'));
					}
					elseif ($request->action == 1) {
						$message = \Lang::get('messages.multi_active_success',array('argument'=>'Role'));
					}
					elseif ($request->action == 3) {
						$message = \Lang::get('messages.multi_delete_success',array('argument'=>'Role'));
					}
					else{
						$message = \Lang::get('messages.multi_undelete_success',array('argument'=>'Role'));
					}

                    $this->msg['status'] = 1;
                    $this->msg['message'] = $message;
                    $http_code = 200;
                }
                else{

                	if($request->action == 0){
						$message = \Lang::get('messages.multi_inactive_failed',array('argument'=>'role'));
					}
					elseif ($request->action == 1) {
						$message = \Lang::get('messages.multi_active_failed',array('argument'=>'role'));
					}
					elseif ($request->action == 3) {
						$message = \Lang::get('messages.multi_delete_failed',array('argument'=>'role'));
					}
					else{
						$message = \Lang::get('messages.multi_undelete_failed',array('argument'=>'role'));
					}

                    $this->msg['status'] = 0;
                    $this->msg['message'] = $message;
                    $http_code = 400;
                }

			}
			else{
				$this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_change');
                $http_code = 400;
			}

		}
		else{

			$this->msg['status'] = 0;
            $this->msg['message'] = trans('messages.no_action');
            $http_code = 400;

		}

		return response()->json($this->msg, $http_code);
			
	}

	public function changestatus(Request $request,$id=''){

        try {

            if($request->has('action')){

            	// updating Role status
            	$status = Role::where('id',$id)->update(['status'=>$request->action]);
            	

                if($status){

                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.status_update_successful');
                    $http_code = 200;
                }
                else{

                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.status_update_failed');
                    $http_code = 400;
                }

            }
            else{

                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_action');
                $http_code = 400;
            }

        } catch (Exception $e) {
            
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }
          return response()->json($this->msg, $http_code); 
    }


    public function updateRole(Request $request,$id=''){


    	$errFlag = false;

    	// validating user input
		$validator = Validator::make($request->all(),[
			'title' => 'required'
		]);
		if($id != ''){

			// if validation rules are satisfied
			if(!$validator->fails()){

				try {
					
					DB::beginTransaction();

					$role = Role::findOrFail($id);
					$role->title = $request->title;

					$saved = $role->save();


					$deleted = RolePermission::where('role_id',$role->id)->delete();

					// assigning permissions to roles
					foreach ($request->module_permission as $key => $permission) {
						
						if(isset($permission['can_create']) && $permission['can_create'] !== false){

							$modulePermissionCreate = Permission::where('module',$permission['module_id'])->where('name','can_create')->select('id')->first();
							if($modulePermissionCreate['id']!='' && $modulePermissionCreate['id']!=null){
								$permission_create = RolePermission::create([
									'role_id' => $role->id,
									'permission_id' => $modulePermissionCreate['id'],
								]);
							}

							if(isset($permission_create) && !$permission_create){
								$errFlag = true;
							}
						}
						
						if(isset($permission['can_update']) && $permission['can_update'] !== false){

							$modulePermissionUpdate = Permission::where('module',$permission['module_id'])->where('name','can_update')->select('id')->first();
							
							$permission_update = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionUpdate['id'],
							]);

							if(isset($permission_update) && !$permission_update){
								$errFlag = true;
							}

						}


						if(isset($permission['can_view']) && $permission['can_view'] !== false){

							
							$modulePermissionView = Permission::where('module',$permission['module_id'])->where('name','can_view')->select('id')->first();
							
							$permission_view = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionView['id'],
							]);

							if(isset($permission_view) && !$permission_view){
								$errFlag = true;
							}

						}

						if(isset($permission['can_delete']) && $permission['can_delete'] !== false){
							
							$modulePermissionDelete = Permission::where('module',$permission['module_id'])->where('name','can_delete')->select('id')->first();

							$permission_delete = RolePermission::create([
								'role_id' => $role->id,
								'permission_id' => $modulePermissionDelete['id'],
							]);

							if(isset($permission_delete) && !$permission_delete){
								$errFlag = true;
							}

						}

					}


					if($saved && !$errFlag){

						DB::commit();

						$this->msg['status'] = 1;
			            $this->msg['message'] = trans('messages.role_update_success');
			            $http_code = 200;

					}
					else{

						DB::rollback();

						$this->msg['status'] = 0;
			            $this->msg['message'] = trans('messages.role_update_failed');
			            $http_code = 400;

					}

				} catch (Exception $e) {
					
					DB::rollback();

					// if exception occures
					$this->msg['status'] = 0;
					$this->msg['message'] = $e->getMessage();
					$http_code = 500;

				}
			}
			else{
				// if validation rules are 
				$message = $validator->messages()->first();

				$this->msg['status'] = 0;
				$this->msg['message'] = $message;
				$http_code = 400; 
			}

			
	    }
	    else{
	    	$this->msg['status'] = 0;
            $this->msg['message'] = trans('messages.no_change');
            $http_code = 400;
	    }

    	return response()->json($this->msg,$http_code);

	}

	/**
	* Function to list permission to display while adding role 
	*
	*
	*/
	public function listModules(){

		try {
			
			$modules = Module::where('status',1)->select('id','name','label')->get()->toArray();

			if(!empty($modules)){

				foreach ($modules as $key => $module) {
					$modules[$key]['can_create'] = false;
					$modules[$key]['can_update'] = false;
					$modules[$key]['can_view'] = false;
					$modules[$key]['can_delete'] = false;
				}

                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data'] = $modules;
                $http_code = 200;
            }
            else{
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $http_code = 200;
            }


		} catch (Exception $e) {
			
			// if exception occures
			$this->msg['status'] = 0;
			$this->msg['message'] = $e->getMessage();
			$http_code = 500;

		}

		return response()->json($this->msg,$http_code);
	}
	
	

	/**
	* API function for listing roles for particular login user
	* @param
	* @return 
	*/
	public function userlist_role(Request $request)
	{
		$userid=$request->id;
		$type = '';

        // getting type of filter requested
        if($request->filter != ''){
            $data = json_decode($request->filter);

            if(!empty($data)){
                $type = $data->filter_by;
            }

        }

        try {

	        // filtering data based on requested filter
	        switch ($type) {
	            case 'only_active':
	                $query = Role::with('role_permissions')->with('role_permissions.module')->where('status',1);
	                break;

	            case 'only_inactive':
	                $query = Role::with('role_permissions')->with('role_permissions.module')->where('status',0);
	                break;

	            case 'only_deleted':

	                $query = Role::onlyTrashed()->with('role_permissions')->with('role_permissions.module');
	                break;

	            case 'all':

	                $query = Role::with('role_permissions')->with('role_permissions.module')->whereNull('deleted_at');
	                break;

	            default:
	                $query = Role::withTrashed()->with('role_permissions')->with('role_permissions.module')->whereNull('deleted_at');
	                break;
	        }

			$roles = $query->select('id','title','status','created_at','updated_at','deleted_at')->where('id',$userid)->orderBy('title', 'ASC')->get()->toArray();
			

            
            if(!empty($roles)){

            	$res = [];

            	$modules = Module::where('status',1)->get()->toArray();

            	foreach ($roles as $role_key => $role) {

					// if($role['id'] == $userid)
					// {
					
						$res[$role_key]['title'] = $role['title'];	
						$res[$role_key]['id'] = $role['id'];	
						$res[$role_key]['created_at'] = $role['created_at'];
						$res[$role_key]['status'] = $role['status'];
						
						$perm = [];

						if(!empty($role['role_permissions'])){
							foreach ($role['role_permissions'] as $permission_key => $permission) {
								array_push($perm,$permission['label']);
							}
						}

						if(empty($perm)){
							$roles[$role_key]['role_permissions'] = '-';
						}
						else{
							$roles[$role_key]['role_permissions'] = implode(',',$perm);
						}

						if(!empty($role['role_permissions']) && isset($role['role_permissions'])){

							foreach ($role['role_permissions'] as $role_permission_key => $value) {

								$res[$role_key]['module_permission'][$value['module']['name']]['module_name'] = $value['module']['name'];
								$res[$role_key]['module_permission'][$value['module']['name']]['label'] = $value['module']['label'];
								$res[$role_key]['module_permission'][$value['module']['name']]['module_id'] = $value['module']['id'];
								
								if($value['name'] == 'can_create'){
									$res[$role_key]['module_permission'][$value['module']['name']]['can_create'] = true;
								}
								

								if($value['name'] == 'can_update'){
									
									$res[$role_key]['module_permission'][$value['module']['name']]['can_update'] = true;
								}
								

								if($value['name'] == 'can_view'){
									$res[$role_key]['module_permission'][$value['module']['name']]['can_view'] = true;
								}
								

								if($value['name'] == 'can_delete'){
									$res[$role_key]['module_permission'][$value['module']['name']]['can_delete'] = true;
								}

							}

							foreach ($modules as $module_key => $module) {

								if(!array_key_exists($module['name'],$res[$role_key]['module_permission'])){
									$res[$role_key]['module_permission'][$module['name']]['module_name'] = $module['name'];
									$res[$role_key]['module_permission'][$module['name']]['label'] = $module['label'];
									$res[$role_key]['module_permission'][$module['name']]['module_id'] = $module['id'];
									$res[$role_key]['module_permission'][$module['name']]['can_create'] = false;
									$res[$role_key]['module_permission'][$module['name']]['can_update'] = false;
									$res[$role_key]['module_permission'][$module['name']]['can_view'] = false;
									$res[$role_key]['module_permission'][$module['name']]['can_delete'] = false;
								}

							}

						}
						else{

							foreach ($modules as $module_key => $module) {


								$res[$role_key]['module_permission'][$module['name']]['module_name'] = $module['name'];
								$res[$role_key]['module_permission'][$module['name']]['label'] = $module['label'];
								$res[$role_key]['module_permission'][$module['name']]['module_id'] = $module['id'];
								$res[$role_key]['module_permission'][$module['name']]['can_create'] = false;
								$res[$role_key]['module_permission'][$module['name']]['can_update'] = false;
								$res[$role_key]['module_permission'][$module['name']]['can_view'] = false;
								$res[$role_key]['module_permission'][$module['name']]['can_delete'] = false;
							}

						}
					//}	

        		}
            	
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data']['userrole'] = $res;
                $http_code = 200;
            }
            else{
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $http_code = 200;
            }

        } catch (\Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }
	
		return response()->json($this->msg,$http_code);
	}
}
