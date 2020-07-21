<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\User;
use Response;
use Validator;
use Carbon\Carbon;
use DB;
use App\EmailTemplate;
use App\Mail\EmailVerification;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use App\CMS;
use App\Module;
use App\Role;
use App\UserRole;
use App\RolePermission;
use App\Permission;
use App\Menu;
use App\ReRedbull_settings;
use File;

class AuthController extends Controller {


    protected $error = '';

    public function __construct() {

       // $this->msg['status'] = 0;
        $this->msg['message'] = "success";
        $this->msg['data'] = array();
        $http_code = 200;
    }
    /**
     * Function to login user and generate a token
     * Method: POST
     * Request URL: http://your-domain.com/api/login
     * Request Data: - User data in json format
     * */
    public function login(Request $request) {
        
        $user_permission = [];
        
        //If User is  parent  Checking validation 
        $validator = Validator::make($request->all(),[
            'email' => 'required|email|max:255',
            'password' => 'required|min:6|max:12'
        ]);

        //If validation is working fine with provided information
        if(!$validator->fails())
        {
            try {
                $credentials = $request->only('email','password');
                // attempt to verify the credentials and create a token for the user 
                 
                if(!Auth::attempt($credentials)){
                        //$this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.user_invalid_credintial');
                        $this->msg['data'] = (object) null;
                        $http_code = '401';
                    }
                    else
                    {
                        //Find login user
                        $user = Auth::user();
                         //Find user role and if not admin or super admin than allowed for login

                        $role = UserRole::where('user_id',$user->id)->pluck('role_id')[0];
                        
                        if($role == 1 || $role == 2)
                        {
                            $this->msg['status'] = 0;
                            $this->msg['data'] = (object) null;
                            $this->msg['message'] = trans('messages.unauthenticated');
                            $http_code = '401';
                        }
                        else
                        {
                            //Generate passport token
                            $token = $user->createToken('ONCOassist')->accessToken;

                            //Check user active or not
                            if($user['status'] == 1)
                            {
                                //Check user verified or not
                                $roles = UserRole::where('status',1)->where('user_id',Auth::user()->id)->select('role_id')->get();
                                $rolesTitle = Role::select('id','title')->where('status',1)->whereIn('id',$roles)->get()->toArray();

                                $module = Module::select('id','name')->get()->toArray();

                                foreach ($module as $mkey => $mvalue) {
                                    
                                    $moduleFinal = [config('app.CAN_UPDATE')=>false,config('app.CAN_VIEW')=>false,config('app.CAN_CREATE')=>false,config('app.CAN_DELETE')=>false];
                                    
                                    $perminssion = Permission::where('module',$mvalue['id'])->pluck('id')->toArray();
                                    if(!empty($perminssion))
                                    {
                                        //Get perminssion details using above role id and module id
                                        $modulePermission = Permission::where('module',$mvalue['id'])->whereIn('id',RolePermission::whereIn('role_id',$roles)->whereIn('permission_id',$perminssion)->pluck('permission_id')->toArray())->where('status',1)->pluck('name')->toArray();

                                        //Initialize constant varialbe 
                                        foreach ($modulePermission as $mpkey => $mpvalue) {
                                            if($mpvalue=='can_update')
                                            {
                                                $moduleFinal[config('app.CAN_UPDATE')] = true;
                                            }
                                            if($mpvalue=='can_view')
                                            {
                                                $moduleFinal[config('app.CAN_VIEW')] = true;
                                            }
                                            if($mpvalue=='can_create')
                                            {
                                                $moduleFinal[config('app.CAN_CREATE')] = true;
                                            }
                                            if($mpvalue=='can_delete')
                                            {
                                                $moduleFinal[config('app.CAN_DELETE')] = true;
                                            }
                                        }
                                        $user_permission[$module[$mkey]['name']] = $moduleFinal;
                                    }
                                    else
                                    {
                                        $user_permission[$module[$mkey]['name']] = $moduleFinal;
                                    }
                                }
                                
                                //Add token in user data
                                $user['permissions'] = $user_permission;
                                $user['role'] = $rolesTitle;
                                $user['token'] = $token;
                                
                                //$this->msg['status'] = 0;
                                $this->msg['message'] = trans('messages.user_login');
                                $this->msg['data'] = $user;
                                $http_code = '200';
                                
                            }
                            else
                            {
                                //$this->msg['status'] = 0;
                                $this->msg['message'] = trans('messages.user_inactive');
                                $this->msg['data'] = (object) null;
                                $http_code = '400';
                            }
                        } 
                    } 
            }
            catch(Exception $e)
            {
                // if exception occurs during fileupload
                //$this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }

        }
        else
        {
            //If Validation Fails than return message
            $error_message = $validator->messages()->first();
            //$this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $this->msg['data'] = (object) null;
            $http_code = '401';
        }    
        // IF all good so return the token 
        return response()->json($this->msg, $http_code);
    }
    
    /**
     * Function to upload profile pic
     * Method: POST
     * Request URL: http://your-domain.com/api/profilepic/{id}
     * User will upload profile pic using this service
     * Request Data: user data in json format
     * */
    public function uploadProfilePic(Request $request,$id='') {
        //Validate Request Array.
        
         $validator = Validator::make($request->all(),[
                    'profile_pic'=>'required|mimes:jpeg,jpg,png|max:1000'
                ]);

        if(!$validator->fails())
        {
            try
            {
                $user=User::find($request->id);

                if(!empty($user))
                {
                    // if the file uploaded is valid
                    $imageExisting=$user->profile_pic;
                    $imageName = rand(1111,9999).'_'.time().'_'.$request->profile_pic->getClientOriginalName();
                    //If user image uploaded successfully

                    if($request->profile_pic->move(public_path('uploads/profile_pics/'.$user->id), $imageName))
                    {
                        $user->profile_pic = $imageName;
                        if($user->save())
                        {
                            //If user already have an  existing image
                            File::delete(public_path('uploads/profile_pics/'.$user->id).'/'.$imageExisting);
                            $this->msg['status'] = 1;
                            $this->msg['message'] = trans('messages.file_upload_success');
                            $this->msg['data']['profile_pic'] = url('uploads/profile_pics/'.$user->id).'/'.$imageName;
                            $http_code = '200';
                        }
                    }
                    else
                    {
                        //If Error Occur during fileupload
                        $this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.file_upload_error');
                        $this->msg['data']=(object) null;
                        $http_code = '400';
                    }

                }
                else
                {
                    // if user not exist
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_doesnot_exists');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            }
            catch(Exception $e)
            {
                // if exception occurs during fileupload
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
        }
        else
        {
            //If Validation Fails than return message
            $error_message = $validator->messages()->first();
            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $this->msg['data'] = (object) null;
            $http_code = '401';
        }
        return response()->json($this->msg,$http_code);
    }

    /**
     * Function to register user
     * Method: POST
     * Request URL: http://your-domain.com/api/register
     * User will register into system using this api
     * Request Data: user data in json format
     * */
    public function register(Request $request) {

        //Validate request
        $validator = Validator::make($request->all(),[
            'first_name'=>'required',
            'last_name'=>'required',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:6|max:12',
            'contact_number'=>'required|numeric',
            'role'=>'required'
        ]);
          //Validate request successfull
        if (!$validator->fails()) {
            try {
                    //Create user
                    $user = User::create([
                        'first_name'=>$request->first_name,
                        'last_name'=>$request->last_name,
                        'email'=>$request->email,
                        'password'=>bcrypt($request->password),
                        'contact_number'=>$request->contact_number,
                        'status'=>1,
                        'email_token'=> hash_hmac('sha256', str_random(40), config('app.key'))
                    ]);

                    if(!empty($user))
                    {

                        $role = explode(',',$request->role);
                        //Insert roles of user
                        foreach ($role as $rkey => $rvalue) {
                            
                            UserRole::create([
                                'user_id'=>$user->id,
                                'role_id'=>$rvalue,
                                'status'=>'1'
                            ]);
                        }

                        // fetching email template from db
                        $template = EmailTemplate::find(1);

                        $logo = url('images/logo.png');

                        //Start code for email sending 
                        $email_data['email'] = $user->email;
                        $email_data['name'] = $user->first_name;
                        $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                        $verify_link = url('api/register/verify/' . $user->email_token);
                        $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('user_pin',$user->pin,str_replace('u_name', $user->first_name, str_replace('u_verify_link', $verify_link, $template->content)))));

                        Mail::send('emails.verification', $email_data, function($message) use ($email_data) 
                        {
                            $message->to($email_data['email'], $email_data['name'])->subject('Email Verification - ONCOassist');
                            $message->setBody($email_data['body']);
                        });

                         //$this->msg['status'] = 1;
                        $this->msg['message'] = trans('messages.user_register_success');
                        $this->msg['data'] = $user;
                        $http_code = '200';
                    }
                    else
                    {
                        //$this->msg['status'] = 1;
                        $this->msg['message'] = trans('messages.user_register_failed');
                        $this->msg['data'] = (object) null;
                        $http_code = '400';
                    }
                } 
                catch (Exception $e) 
                {
                // Something went wrong while updating user setting 
                // $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = '500';
                }
            }
            else {
            // Validation error message 
            $error_message = $validator->messages()->first();
           // $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = '401';
        }
        return response()->json($this->msg, $http_code);
    }

    /*
     * Function to verify user
     */

    public function verify($token) {

        $user = User::where('email_token', $token)->first();

        //Check if it's valid token or not
        if ($user === null) {

            //user doesn't exist
            $message = trans('messages.user_verified_fail');
            
            $data['message'] = $message;
            $data['user_name'] = 'User';

            return view('verify')->with('data',$data);
            
        } else {


            $user_name = $user->first_name;

            // If it's valid token then activate the user 
            $user_data = $user->toArray();
            $user_data['sendOn'] = Carbon::now()->format('d, M Y');
           

            //$front_link = config('app.front_link');

            User::where('email_token', $token)->firstOrFail()->verified();
            $message = trans('messages.user_verified_success');

            $template = EmailTemplate::find(16);

            $logo = url('images/logo.png');

            // Start code for email sending 
            $email_data['email'] = $user_data['email'];
            $email_data['first_name'] = $user_data['first_name'];
            $email_data['sendOn'] = Carbon::now()->format('d, M Y');

            $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $user_data['first_name'], str_replace('u_email', $user_data['email'],$template->content))));

            Mail::send('emails.welcomeuser', $email_data, function($message) use ($email_data) {
                $message->to($email_data['email'], $email_data['first_name'])->subject('Welcome to ONCOassist');
                $message->setBody($email_data['body']);
            });

            $data['message'] = $message;
            $data['user_name'] = $user_name;

            return view('verify')->with('data',$data);
        }
    }

    /**
     * Function to reset password
     * Method: POST
     * Request URL: http://your-domain.com/api/resetpassword
     * User will provide email, token , password and new password
     * System will update new password into database
     * Request Data: - user data in json format
     */
    public function resetpassword(Request $request) {     

        // Checking validation 
        $validator = Validator::make($request->all(), [
            'userid' => 'required',
            'old_password' => 'required|min:6|max:12',
            'new_password' => 'required|min:6|max:12',
            'confirm_password' => 'required|same:new_password',
            ]);

        // If validation working proper 
        if (!$validator->fails()) {
            try {
                //Find user from db
                $user = User::where('id', $request->userid)->select('email','id')->first();

                if(!empty($user))
                {

                    $credentials['email'] = $user->email;
                    $credentials['password'] = $request->input('old_password');
                    if(Auth::attempt($credentials)) {

                        // If user can able to login via provided email and password 
                        $new_password = $request->input('new_password');
                        $user->password = bcrypt($new_password);
                        $user->save();
                    
                       // $this->msg['status'] = 1;
                        $this->msg['message'] = trans('messages.user_password_reset_success');
                        $this->msg['data'] =(object)null;
                        $http_code = '200';
                    } else {
                        //If user cant able to login with provided email and password 
                       // $this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.user_invalid_password');
                        $this->msg['data'] =(object)null;
                        $http_code = '400';
                    }
                }
                else
                {
                    //$this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.unauthenticated');
                    $this->msg['data'] =(object)null;
                    $http_code = '401';    
                }
            } catch (Exception $e) {
                // Something went wrong while updating new password
               // $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] =(object)null;
                $http_code = '500';
            }
        } else {
            // Validation error message if validation will be fail 
            $error_message = $validator->messages()->first();
            //$this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $this->msg['data'] =(object)null;
            $http_code = '401';
        }
        return response()->json($this->msg, $http_code);
    }

   


    /**
     * Function when user forgot password
     * Method: POST
     * Request URL: http://your-domain.com/api/forgotpassword
     * Send email with new password to provided email address and update to database
     * Request Data: user data in json format
     */
    public function forgotpassword(Request $request) {
        // Checking Validation 
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|max:255'
            ]);

        $email = $request->input('email');
        // If validation working fine with provided information 
        if (!$validator->fails()) {
            try {

                 // getting status of user's account        
                $user_status = User::status($email);
                if(!empty($user_status) && $user_status[0]['status'] != 1){

                    //$this->msg['status'] = 0;
                    $this->msg['message'] =trans('messages.contact_admin_deactivated');
                    $this->msg['data'] = (object) null;
                    $http_code = 400;

                    return response()->json($this->msg,$http_code);
                }

                if(!empty($user_status) && $user_status[0]['deleted_at'] != ''){

                    //$this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.contact_admin_deleted');
                    $this->msg['data'] = (object) null;
                    $http_code = 400;

                    return response()->json($this->msg,$http_code);
                }
                
                
                $user = User::where('email',$email)->first();
                // If user exists with provided email into database 
                if (!empty($user)) {
                
                    // Getting user object for updating new password into database 
                   // $user = User::where('email', '=', $email)->firstOrFail();
                    $new_password = str_random(12);
                    $user->password = Hash::make($new_password);
                    $user->save();

                    $template = EmailTemplate::find(2);

                    $logo = url('images/logo.png');

                    // Start code for email sending 
                    $email_data['password'] = $new_password;
                    $email_data['email'] = $email;
                    $email_data['name'] = $user->first_name . " " . $user->last_name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_password', $new_password, str_replace('u_name', $user->first_name, $template->content))));

                    Mail::send('emails.forgotpassword', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Forgot Password - ONCOassist');
                        $message->setBody($email_data['body']);
                    });

                    $this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.user_forgot_email_send');
                    $http_code = '200';
                    //End code for email sending 
                } else {
                    // If user doesn't exists
                    $this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_emailid_not_exists');
                    $http_code = '400';
                }
            } catch (Exception $e) {
                // something went wrong while updating new password and email send to user 
                $this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $http_code = '500';
            }
        } else {
            // Validation error message 
            $error_message = $validator->messages()->first();
            $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $http_code = '401';
        }
        return response()->json($this->msg, $http_code);
    }

     /**
     * Function for update user profile
     * Method: get
     * Request URL: http://your-domain.com/api/editprofile/id
        Update user profile based on userid
     * Request Data: user data in json format
     */
    public function editProfile($id) {
        
        try
        {
            //Find user of requested id
            $user = User::findOrFail($id);
            
            if(!empty($user))
            {
                $role = UserRole::leftJoin('roles','user_roles.role_id','=','roles.id')->select('roles.title','roles.id')->where('user_roles.user_id',$user->id)->get();
                $user->role = $role;

                //$this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.success');
                $this->msg['data'] = $user;
                $http_code = '200';

            }
            else
            {
                 //$this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.user_doesnot_exists');
                $this->msg['data'] = (object) null;
                $http_code = '400';
            }
        }
        catch (Exception $e) {
            // something went wrong while updating new password and email send to user 
            //$this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = '500';
        }
        catch(\ModelNotFoundException $e){

            //$this->msg['status'] = 0;
            $this->msg['message'] = trans('messages.user_doesnot_exists');
            $this->msg['data'] = (object) null;
            $http_code = '400';
        }
        
        return response()->json($this->msg, $http_code);   
    }   

    /**
     * Function for update user profile
     * Method: POST
     * Request URL: http://your-domain.com/api/updatprofile
        Update user profile based on userid
     * Request Data: user data in json format
     */
    public function updateProfile(Request $request,$id) {

        //Validate request
        $validator = Validator::make($request->all(), [
                'first_name'=>'required',
                'last_name'=>'required',
                'email' => 'required | max:255 | email | unique:users,email,'.$id,
                'contact_number'=>'required',
                'role'=>'required'
            ]);
        //If validation successfull
        if (!$validator->fails()) 
        {   
            try{
                //Find user of requested id
                $user = User::findOrFail($id);
                //Check user verified or not
                
                $user->email = $request->email;
                $user->first_name = $request->first_name;
                $user->last_name = $request->last_name;
                $user->contact_number = $request->contact_number;
                $user->updated_by = Auth::user()->id;
                $user->save();
                

                if(!empty($user)){
                    //Remove existing roles
                    DB::table('user_roles')->where('user_id',$user->id)->delete();

                    $role = explode(',',$request->role);
                    //Insert roles of user
                    foreach ($role as $rkey => $rvalue) {
                        
                        UserRole::create([
                            'user_id'=>$user->id,
                            'role_id'=>$rvalue,
                            'status'=>'1'
                        ]);
                    }

                    $user->role = $role;

                    //$this->msg['status'] = 1;
                    $this->msg['message'] = trans('messages.user_profile_success');
                    $this->msg['data'] = $user;
                    $http_code = '200';

                }
                else
                {
                    //$this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_profile_error');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
                
            }
            catch(\Exception $e){

                //$this->msg['status'] = 0;
                $this->msg['message'] = $e->getMessage();
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
            catch(\ModelNotFoundException $e){

                //$this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.user_doesnot_exists');
                $this->msg['data'] = (object) null;
                $http_code = '500';
            }
        }
        else
        {
            $error_message = $validator->messages()->first();
           // $this->msg['status'] = 0;
            $this->msg['message'] = $error_message;
            $this->msg['data'] = (object) null;
            $http_code = '400';
        }
       
       return response()->json($this->msg, $http_code); 
    }

    /**
     * Function to delete user
     * Method: DELETE
     * Request URL: http://your-domain.com/api/deleteprofile?userid=108
       Delete user based on userid.
     * Request Data: user data in url
     */
    public function deleteprofile(Request $request) {
        $id = $request->input('userid');
        try {
            $user = User::find($id);
            if ($user) {
                // If user exists 
                User::find($id)->delete();
                $this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.user_delete_success');
                $http_code = '200';
            } else {
                // If user doesn't not exists 
                $this->msg['status'] = 0;
                $this->msg['message'] = trans('messages.user_doesnot_exists');
                $http_code = '400';
            }
        } catch (Exception $e) {
            // Something went wrong while deleting user profile 
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }

    
    /**
     * API function to get cms content
     * Method: GET
     * Request URL: http://your-domain.com/api/getcms?slug=contact-us
     * User get content of CMS using this api.
     * Request Data: user data in json format
     */
    public function getcms(Request $request) {
        $slug = $request->input('slug');
        try {
            // Fetching cms data based on provided slug 
            $cms_details = CMS::where('slug', $slug)->select('description', 'content', 'page_name', 'id')->first();
            if(!empty($cms_details))
            {
                //$this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.page_sent_success');
                $this->msg['data'] = $cms_details;
                $http_code = '200';
            }
            else
            {
                //$this->msg['status'] = 1;
                $this->msg['message'] = trans('messages.page_not_found');
                $this->msg['data'] = (object)null;
                $http_code = '200';   
            }
        } catch (Exception $e) {
            // Something went wrong while getting cms content
            $this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * Function to login user and generate a token
     * Method: POST
     * Request URL: http://your-domain.com/api/login
     * Request Data: - User data in json format
     * */
    public function permissions() {
        
        $user_permission = [];
        
        try {
            //Find login user
            $user = Auth::user();
             //Find user role and if not admin or super admin than allowed for login

            $role = UserRole::where('user_id',$user->id)->pluck('role_id')[0];
                    
            if($role == 1 || $role == 2)
            {
                $this->msg['status'] = 0;
                $this->msg['data'] = (object) null;
                $this->msg['message'] = trans('messages.unauthenticated');
                $http_code = '401';
            }
            else
            {
                //Check user active or not
                if($user['status'] == 1)
                {
                    //Check user verified or not
                    
                    $rolesTitle = Role::select('id','title')->where('status',1)->where('id',$role)->get()->toArray();

                    $module = Module::select('id','name')->get()->toArray();
                    
                    $moduleFinal = [config('app.CAN_UPDATE')=>false,config('app.CAN_VIEW')=>false,config('app.CAN_CREATE')=>false,config('app.CAN_DELETE')=>false];

                    foreach ($module as $mkey => $mvalue) {
                        
                        $perminssion = Permission::where('module',$mvalue['id'])->pluck('id')->toArray();
                        
                        if(!empty($perminssion))
                        {
                            //Get perminssion details using above role id and module id
                            $modulePermission = Permission::where('module',$mvalue['id'])->whereIn('id',RolePermission::where('role_id',$role)->whereIn('permission_id',$perminssion)->pluck('permission_id')->toArray())->where('status',1)->pluck('name')->toArray();

                            $moduleFinal = [config('app.CAN_UPDATE')=>false,config('app.CAN_VIEW')=>false,config('app.CAN_CREATE')=>false,config('app.CAN_DELETE')=>false];

                            foreach ($modulePermission as $mpkey => $mpvalue) {

                                if($mpvalue=='can_update')
                                {
                                    $moduleFinal[config('app.CAN_UPDATE')] = true;
                                }
                                if($mpvalue=='can_view')
                                {
                                    $moduleFinal[config('app.CAN_VIEW')] = true;
                                }
                                if($mpvalue=='can_create')
                                {
                                    $moduleFinal[config('app.CAN_CREATE')] = true;
                                }
                                if($mpvalue=='can_delete')
                                {
                                    $moduleFinal[config('app.CAN_DELETE')] = true;
                                }
                            }
                            $user_permission[$module[$mkey]['name']] = $moduleFinal;
                            
                        }
                        else
                        {
                            $user_permission[$module[$mkey]['name']] = $moduleFinal;
                        }
                    }
                    
                    //Add token in user data
                    if(!empty($user_permission))
                    {
                        //$this->msg['status'] = 0;
                        $this->msg['message'] = trans('messages.permission_sent_success');
                        $this->msg['data'] = $user_permission;
                        $http_code = '200';
                    }
                    else
                    {
                        $this->msg['message'] = trans('messages.failed_sent_permission');
                        $this->msg['data'] = (object) null;
                        $http_code = '400';   
                    }
                    
                }
                else
                {
                    //$this->msg['status'] = 0;
                    $this->msg['message'] = trans('messages.user_inactive');
                    $this->msg['data'] = (object) null;
                    $http_code = '400';
                }
            } 
                 
        }
        catch(Exception $e)
        {
            // if exception occurs during fileupload
            //$this->msg['status'] = 0;
            $this->msg['message'] = $e->getMessage();
            $this->msg['data'] = (object) null;
            $http_code = '500';
        }    
        // IF all good so return the token 
        return response()->json($this->msg, $http_code);
    }
}
