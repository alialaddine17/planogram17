<?php

namespace App\Http\Controllers\Api\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\EmailTemplate;
use App\Mail\EmailVerification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Input;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Response;
use Validator;
use DB;
use File;
use App\User;
use App\Module;
use App\Settings;
use App\UserRole;
use App\Role;
use App\RolePermission;
use App\Permission;
use App\SubCategory;
use App\Product;
//use App\Vip_categories;
use App\Vip_details;
use App\Channel;
use App\Redbull_settings;
use Config;
use App\Helpers\Helper;



class AdminController extends Controller
{

    public function __construct()
    {

        $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = array();
        $http_code = 200;
    }

    /**
     * Function to register user
     * Method: POST
     * Request URL: 
     * Admin user will login into system using this api
     * Request Data: user data in json format
     * */
    public function login(Request $request)
    {
        /* If User is  parent  Checking validation */
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255',
            'password' => 'required'
        ]);

        /* If validation is working fine with provided information */
        if (!$validator->fails()) {
            $credentials = $request->only('email', 'password');
            try {
                /* attempt to verify the credentials and create a token for the user */
                if (!Auth::attempt($credentials)) {
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_invalid_email_password');
                    $http_code = '401';
                } else {
                    /* User logged in successfully, now send user details ** */
                    $user = Auth::user();
                    //Find user role and if admin or super admin than allowed for login
                    $role = UserRole::leftJoin('roles', 'roles.id', '=', 'user_roles.role_id')->where('user_roles.user_id', $user->id)->select('roles.id', 'roles.title')->get()->toArray()[0];

                    if ($role['id'] == 1) {
                        $token = $user->createToken('ONCOassist')->accessToken;

                        if ($user['status'] == 1) {
                            /* update device_token and device_type into database */
                            $user->save();
                            /* Created userdata array for passing into response */
                            $user['role'] = $role;
                            $user['token'] = $token;
                            $this->msg['status'] = 1;
                            $this->msg['message'] = trans('messages.user_login');
                            $this->msg['data'] = $user;
                            $http_code = '200';
                        } else {
                            $this->msg['status'] = 0;
                            $this->msg['message'] = trans('messages.user_inactive');
                            $http_code = '400';
                        }
                    } else {
                        $this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.unauthenticated');
                        $http_code = '401';
                    }
                }
            } catch (Exception $e) {
                /* something went wrong while checking login info */
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = '500';
            }
        } else {
            /* Validation error message */
            $error_message = $validator->messages()->first();
            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = '400';
        }
        /* IF all good so return the token */
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function for getting site settings
     * Method: GET
     * @param
     * @return 
     */
    public function settings(Request $request)
    {

        try {
            if (trim($request->type) == "" || trim($request->type) == "0") {
                $type = "All";
            } else {
                $type = $request->type;
            }

            if ($type == "All") {
                $setttings = Redbull_settings::select('id', 'label', 'name', 'value as val', 'description', 'field_type', 'field_type_value')->orderBy('type', 'ASC')->orderBy('seq_no', 'ASC')->get()->toArray();
            } else {
                $setttings = Redbull_settings::select('id', 'label', 'name', 'value as val', 'description', 'field_type', 'field_type_value')->where('type', $type)->orderBy('type', 'ASC')->orderBy('seq_no', 'ASC')->get()->toArray();
            }

            if (!empty($setttings)) {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data'] = $setttings;
                $http_code = 200;
            } else {
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $http_code = 400;
            }
        } catch (Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }

        return response()->json($this->msg, $http_code);
    }

    /**
     * API for updating site setting
     * Method: PUT
     * @param 
     * @return
     */
    public function updateSettings(Request $request)
    {
        $messages = [
            'required' => 'Please enter complete data'
        ];

        $validator = Validator::make($request->all(), [
            'settingData.*.id' => 'required'
        ], $messages);

        try {

            if (!$validator->fails()) 
            {
                if ($request->has('settingData')) {

                    if (!empty($request->settingData)) 
                    {
                        foreach ($request->settingData as $key => $data) 
                        {
                            $setting = Redbull_settings::findOrFail($data['id']);
                            $setting->value = $data['val'];
                            $setting->save();
                        }

                        $this->msg['status'] = 1;
                        $this->msg['message'] = trans('messages.settings_saved');
                        $http_code = 200;
                    } else {

                        $this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.settings_failed');
                        $http_code = 400;
                    }
                }
            } else {

                // if validation rules are not satisfied
                $error_message = $validator->messages()->first();

                $this->msg['status'] = 0;
                $this->msg['message'] = $error_message;
                $http_code = 400;
            }
        } catch (Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }
        return response()->json($this->msg, $http_code);
    }
    /**
     * Function to change password of register user.
     * Method: POST
     * Request URL: 
     * Admin user will change password in a system using this api
     * Request Data: user data in json format
     * */
    public function changepassword(Request $request)
    {
        /* Checking validation */
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255',
            'old_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required|same:new_password',
        ]);
        /* If validation working proper */
        if (!$validator->fails()) {
            try {

                $user = User::select('email', 'id')->where('email', $request->input('email'))->first();
                $credentials['email'] = $user->email;
                $credentials['password'] = $request->input('old_password');

                if (Auth::attempt($credentials, true)) {
                    /* If user can able to login via provided email and password */
                    $new_password = $request->input('new_password');
                    $user->password = bcrypt($new_password);
                    $user->save();
                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.user_password_reset_success');
                    $http_code = '200';
                } else {
                    /* If user cant able to login with provided email and password */
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_invalid_password');
                    $http_code = '400';
                }
            } catch (Exception $e) {
                /* Something went wrong while updating new password */
                $http_code = '500';
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
            }
        } else {
            /* Validation error message if validation will be fail */
            $error_message = $validator->messages()->first();
            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = '400';
        }

        return response()->json($this->msg, $http_code);
    }

    /**
     * API for count for dashboard page
     * Method: get
     * @param 
     * @return
     */
    public function statistics()
    {

        try {
            //Find different count for dashboard
            $result['categories'] = DB::table('categories')->where('deleted_at',null)->where('parentid','0')->count();
            $result['sub_categories'] = SubCategory::whereNull('deleted_at')->where('parentid','<>','0')->count();
            $result['products'] = Product::whereNull('deleted_at')->count();
            $result['vipCat'] = DB::table('vip_categories')->where('deleted_at',null)->count();
            $result['announcement'] = DB::table('anouncement')->where('deleted_at',null)->count();

            if (!empty($result)) {

                $this->msg['status'] = 1;
                $this->msg['data'] = $result;
                $this->msg['message'] = trans('messages.success');
                $http_code = 200;
            } else {

                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.no_record_found');
                $http_code = 400;
            }
        } catch (Exception $e) {
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = 500;
        }
        return response()->json($this->msg, $http_code);
    }

    /* *
     * Function to get user profile details
     * Method: GET
     * Request URL: 
     * User will get user profile in system using this api
     * Request Data: user data in url
     * */
    public function editprofile($id)
    {
        if ($id != '') {
            //Store User Information According To ID And Role.        
            /* $user = DB::table('users')->select('id','first_name','last_name','email','contact_number','designation','status','createdts','updatedts')->whereId($id)->get()->first();*/

            $user = User::whereId($id)->first();


            $role = DB::table('user_roles')->where('user_id', $user->id)->pluck('role_id');

            $role_ids = DB::table('roles')->whereIn('id', $role)->where('status', 1)->pluck('id')->toArray();
            $role_names = DB::table('roles')->whereIn('id', $role)->where('status', 1)->pluck('title')->toArray();

            $user->role_ids = implode(',', $role_ids);
            $user->role_names = implode(',', $role_names);

            if (!empty($user)) {
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data'] = $user;
                $http_code = '200';
            } else {
                //Returns if Users Not Found.
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.user_doesnot_exists');
                $this->msg['data'] = (object) null;
                $http_code = '400';
            }
        } else {
            //Returns If Users Not Found.
            $this->msg['status'] = 1;
            $this->msg['message'] = '';
            $this->msg['data'] = trans('messages.id_required');
            $http_code = '400';
        }

        return response()->json($this->msg, $http_code);
    }

    /* *
     * Function to update user profile details
     * Method: PUT
     * Request URL: 
     * User will update user profile in system using this api
     * Request Data: user data in json
     * 
     */
    public function updateprofile(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'contact_number' => 'max:15'
        ]);

        if (!$validator->fails()) {

            try {

                $user = User::findOrFail($id);

                $user->first_name = $request->first_name;
                $user->last_name = $request->last_name;
                $user->contact_number = $request->contact_number;


                // updating the profile pic
                /* if($request->hasFile('profile_pic') && $request->profile_pic->isValid()){

                    $name = $request->file('profile_pic')->getClientOriginalName();
                    $fileName = time().'_'.$name;
                    
                    // if new profile_pic uploaded successfully then removed the old profile pic
                    if($request->file('profile_pic')->move(public_path('uploads/profile_pics/'.$id).'/', $fileName)){
                         
                         File::delete('uploads/profile_pics/' . $id . '/' . $user->profile_pic);
                         $user->profile_pic = $fileName;
                    
                    }
                }*/

                // saving the changes
                $saved = $user->save();

                // getting fresh model changes
                $user = $user->fresh();

                if (!empty($user)) {

                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.user_profile_success');
                    $this->msg['data'] = (object) null;
                    $http_code = '200';
                } else {
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_profile_error');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } catch (\Exception $e) {

                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
        } else {
            $error_message = $validator->messages()->first();
            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = '401';
        }
        return response()->json($this->msg, $http_code);
    }



    /**
     * 
     * Method for used to send email with using SMTP 
     */
    public function testEmail(request $request)
    {
        // Get email which is receive email
        $email = $request->input('email');

        $title = 'Test Email';
        $email_body = 'Hi, welcome ! This is a test mail';
        $email_subject = 'Test Email';

        // calling helper function
        $sendEmail =  Helper::sendEmail($email, $title, $email_body, $email_subject);

        return response()->json($sendEmail);
    }

    /*
     * Method for forgot password 
    */
    public function forgotPassword(request $request)
    {
        $email = $request->input('email');

        // Check for email exist or not
        $user = DB::table('users')->select('first_name', 'last_name')->where('email', $email)->first();

        $email = 'chetanbp@projectdemo.biz';


        if(!empty($user)){
            // get forgot password template
            $fTemplate = DB::table('emailtemplate')->select('content')->where('id', 2)->first();

            $staticData = ["u_sendOn", "u_name", "u_link", "current_year"];
            $repalceData   = ["Oncoassist", $user->first_name . " " . $user->last_name, "Link", date('Y')];

            $email_body =  str_replace($staticData, $repalceData, $fTemplate->content);

            // calling helper function
            $sendEmail =  Helper::sendEmail($email, 'Forgot Password', $email_body, 'Forgot Password');

            return response()->json($sendEmail);

        }else{
            $this->msg['status'] = 0;
            $this->msg['message'] = trans('messages.email_not_found');
            $http_code = '400';
        }

        return response()->json($this->msg, $http_code);
       



    }
}
