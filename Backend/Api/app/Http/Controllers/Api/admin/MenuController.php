<?php

namespace App\Http\Controllers\Api\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\UserRole;
use App\Role;
use App\Module;
use App\Menu;
use App\RolePermission;
use Response;
use App\Permission;
use Validator;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MenuController extends Controller {

	/**
	* Default class constructor
	*
	*/
	public function __construct(){
	
	}

	
	public function list_menu_items(){
		try {
			$user_menu = [];			
			$user_menu_link = [];
			$user_id = Auth::user()->id;

			$user_roles = UserRole::where('status',1)->where('user_id',$user_id)->pluck('role_id')->toArray();
			//pr($user_roles);
			$permission = RolePermission:: whereIn('role_id',$user_roles)->pluck('permission_id')->toArray();
			$moduleId = Permission::whereIn('id',$permission)->where('name','can_view')->pluck('module')->toArray();
			//$mddule  = Module::where('')

			//Check for menu items based on roles
			if(!empty($user_roles))
			{
				$moduleId[] = 0;
				//print_r($user_roles);
				foreach($user_roles as $uk=>$uv)
				{
					//$menu_items = Menu::where('status',1)->whereIn('role_ids',$uv)->select('id','label','menu_link','role_ids')->get()->toArray();
					$menu_items = DB::table('menu')->where('status',1)->whereNull('deleted_at')->whereIn('module',$moduleId)->orderBy('sequence')->get()->toArray();

					foreach($menu_items as $mk=>$mv)
					{
						if(!in_array($mv->menu_link,$user_menu_link))
						{
							array_push($user_menu,$mv);
							array_push($user_menu_link,$mv->menu_link);
						}
					}
				}	
			}
			
			if(!empty($user_menu)){
				$this->msg['message'] = "success";
				$this->msg['data'] = (object) $user_menu;
				$http_code = 200; 

			}
			else{
				$this->msg['message'] = "failed";
				$this->msg['data'] = (object) $user_menu;
				$http_code = 400;
			}



		} catch (\Exception $e) {

			

			$this->msg['message'] = $e->getMessage();

			$http_code = 500;



		}





		return response()->json($this->msg,$http_code);

	}

	function array_unique_multidimensional($input)
	{
		$serialized = array_map('serialize', $input);
		$unique = array_unique($serialized);
		return array_intersect_key($input, $unique);
	}

}


