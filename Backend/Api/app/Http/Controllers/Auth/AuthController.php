<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\Models\UserFriends;
use App\Models\CMS;
use App\Models\EmailTemplate;
use App\Models\Contactus;
use App\Models\AdvertisementInquiry;
use Validator;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Mail\EmailVerification;
use Illuminate\Support\Facades\Hash;
use DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;

class AuthController extends Controller {

    protected $error = '';

    /**
     * API Login, on success return JWT Auth token
     * Method: POST
     * Request URL: http://your-domain.com/api/login
     * Request Data: - {"email":"gopalpp@projectdemo.biz","password":"Jxs2oVGv9SNa","device_type":"2","device_token":"asdasd4544qwe44"}
     * */
    public function login(Request $request) {
        /* Checking validation */
        $validator = Validator::make($request->all(), [
                    'email' => 'required|email',
                    'password' => 'required'
        ]);
        /* If validation is working fine with provided information */
        if (!$validator->fails()) {
            $credentials = $request->only('email', 'password');

            try {
                /* attempt to verify the credentials and create a token for the user */
                if (!$token = JWTAuth::attempt($credentials)) {
                    $this->msg['sStatus'] = 0;
                    $this->msg['sMessage'] = trans('messages.user_invalid_email_password');
                    $this->msg['UserInfo'] = (object) null;
                    $http_code = '401';
                } else {
                    /* User logged in successfully, now send user details ** */
                    $user = User::whereEmail($credentials['email'])->first();
                    /* */
                    if ($user['status'] == 1) {
                        if ($user['verified'] == 1) {
                            /* update device_token and device_type into database */
                            $user->is_login = 1;
                            $user->save();
                            /* Created userdata array for passing into response */
                            $user_data = array();
                            $user_data['id'] = $user['id'];
                            $user_data['email'] = $user['email'];
                            $user_data['first_name'] = $user['first_name'];
                            $user_data['last_name'] = $user['last_name'];
                            $user_data['phone'] = $user['phone'];
                            $user_data['zip_code'] = $user['zip_code'];
                            $user_data['no_of_kids'] = $user['no_of_kids'];
                            $user_data['category'] = $user['category'];
                            $user_data['token'] = $token;
                            $this->msg['sStatus'] = 1;
                            $this->msg['sMessage'] = trans('messages.user_login');
                            $this->msg['UserInfo'] = $user_data;
                            $http_code = '200';
                        } else {
                            $this->msg['sStatus'] = 0;
                            $this->msg['sMessage'] = trans('messages.user_not_verify');
                            $this->msg['UserInfo'] = (object) null;
                            $http_code = '401';
                        }
                    } else {
                        $this->msg['sStatus'] = 0;
                        $this->msg['sMessage'] = trans('messages.user_inactive');
                        $this->msg['UserInfo'] = (object) null;
                        $http_code = '400';
                    }
                }
            } catch (JWTException $e) {
                /* something went wrong while checking login info */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $this->msg['UserInfo'] = (object) null;
                $http_code = '500';
            }
        } else {
            /* Validation error message */
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $this->msg['UserInfo'] = (object) null;
            $http_code = '400';
        }
        /* IF all good so return the token */
        return response()->json($this->msg, $http_code);
    }

    /**
     * Register
     * Method: POST
     * Request URL: http://your-domain.com/api/register
     * User will register into system using this api
     * Request Data: - {"email":"gopalpp2@projectdemo.biz","first_name":"Gopal","last_name":"Patel","password":"12345678","phone":"12345678"}
     * */
    public function register(Request $request) {

        $data = $request->all();

        /* facebook registration */
        if (isset($data['fb_id'])) {
            DB::beginTransaction();
            try {
                if (!isset($data['email'])) {
                    $data['email'] = $data['phone'] . '@gmail.com';
                }
                if (!isset($data['phone'])) {
                    $data['phone'] = '';
                }
                if (!isset($data['name'])) {
                    $data['name'] = '';
                }

                $check_user = User::where('fb_id', $data['fb_id'])->select('id', 'name', 'email', 'phone', 'avatar')->first();
                if (!$check_user) {

                    $new_password = str_random(12);
                    $user = User::create([
                                'role_id' => '2',
                                'name' => $data['name'],
                                'email' => $data['email'],
                                'password' => bcrypt($new_password),
                                'phone' => $data['phone'],
                                'fb_id' => $data['fb_id'],
                                'is_login' => 1,
                                'verified' => 1,
                    ]);

                    $credentials['email'] = $data['email'];
                    $credentials['password'] = $new_password;
                    $token = JWTAuth::attempt($credentials);
                    /* Fetching user information after user registration */
                    $userinfo = User::whereId($user->id)->select('id', 'name', 'email', 'phone', 'avatar')->first();
                    $userinfo['token'] = $token;
                    
                    $template = EmailTemplate::find(5);

                    $logo = url('/images/email_logo.png');

                    /* Start code for email sending */
                    $email_data['email'] = $userinfo->email;
                    $email_data['name'] = $userinfo->name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $userinfo->name, $template->content)));

                    Mail::send('emails.welcomeuser', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Welcome - ONCOassist');
                        $message->setBody($email_data['body']);
                    });
                    
                    
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_register_success');
                    $this->msg['UserInfo'] = $userinfo->toArray();
                    $http_code = '200';
                    DB::commit();
                } else {
                    $new_password = str_random(12);
                    $check_user->email = $data['email'];
                    $check_user->password = bcrypt($new_password);
                    $check_user->save();
                    DB::commit();

                    $credentials['email'] = $data['email'];
                    $credentials['password'] = $new_password;
                    $token = JWTAuth::attempt($credentials);
                    $check_user['token'] = $token;
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_register_exists');
                    $this->msg['UserInfo'] = $check_user->toArray();
                    $http_code = '200';
                }
            } catch (Exception $e) {
                DB::rollback();
                /* something went wrong whilst attempting to encode the token */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $this->msg['UserInfo'] = (object) null;
                $http_code = '500';
            }
        } else if (isset($data['google_id'])) {
            /* google registration */
            DB::beginTransaction();
            try {
                if (!isset($data['email'])) {
                    $data['email'] = $data['phone'] . '@gmail.com';
                }
                if (!isset($data['phone'])) {
                    $data['phone'] = '';
                }
                if (!isset($data['name'])) {
                    $data['name'] = '';
                }

                $check_user = User::where('google_id', $data['google_id'])->orWhere('email', $data['email'])->select('id', 'name', 'email', 'phone', 'avatar')->first();
                if (!$check_user) {

                    $new_password = str_random(12);
                    $user = User::create([
                                'role_id' => '2',
                                'name' => $data['name'],
                                'email' => $data['email'],
                                'password' => bcrypt($new_password),
                                'phone' => $data['phone'],
                                'google_id' => $data['google_id'],
                                'is_login' => 1,
                                'verified' => 1,
                    ]);

                    $credentials['email'] = $data['email'];
                    $credentials['password'] = $new_password;
                    $token = JWTAuth::attempt($credentials);
                    /* Fetching user information after user registration */
                    $userinfo = User::whereId($user->id)->select('id', 'name', 'email', 'phone', 'avatar')->first();
                    $userinfo['token'] = $token;
                    
                    $template = EmailTemplate::find(5);

                    $logo = url('/images/email_logo.png');


                    /* Start code for email sending */
                    $email_data['email'] = $userinfo->email;
                    $email_data['name'] = $userinfo->name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $userinfo->name, $template->content)));

                    Mail::send('emails.welcomeuser', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Welcome - ONCOassist');
                        $message->setBody($email_data['body']);
                    });

                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_register_success');
                    $this->msg['UserInfo'] = $userinfo->toArray();
                    $http_code = '200';

                    DB::commit();
                } else {

                    $new_password = str_random(12);
                    $check_user->email = $data['email'];
                    $check_user->password = bcrypt($new_password);
                    $check_user->save();
                    DB::commit();

                    $credentials['email'] = $data['email'];
                    $credentials['password'] = $new_password;
                    $token = JWTAuth::attempt($credentials);
                    $check_user['token'] = $token;

                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_register_exists');
                    $this->msg['UserInfo'] = $check_user->toArray();
                    $http_code = '200';
                }
            } catch (Exception $e) {
                DB::rollback();
                /* something went wrong whilst attempting to encode the token */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $this->msg['UserInfo'] = (object) null;
                $http_code = '500';
            }
        } else {
            /* Validation checking */
            $validator = Validator::make($data, [
                        'name' => 'required|max:255',
                        'email' => 'required|email|max:255|unique:users',
                        'password' => 'required|min:6|max:12'
            ]);

            /* If validation is working fine with provided information */
            if (!$validator->fails()) {

                DB::beginTransaction();
                try {
                    if (!isset($data['phone'])) {
                        $data['phone'] = '';
                    }
                    $user = User::create([
                                'role_id' => '2',
                                'name' => $data['name'],
                                'email' => $data['email'],
                                'phone' => $data['phone'],
                                'email_token' => hash_hmac('sha256', str_random(40), config('app.key')),
                                'password' => bcrypt($data['password']),
                    ]);

                    if (Input::hasFile('avatar')) {
                        if ($request->file('avatar')->isValid()) {
                            $file = $request->file('avatar');
                            $ext = $file->extension();
                            $timestamp = strtotime(Carbon::now());
                            $filename = $file->storeAs('uploads/users/' . $user->id, "{$timestamp}.{$ext}");
                            $user->avatar = $filename;
                            $user->save();
                        }
                    }

                    /* Fetching user information after registration of user */
                    $userinfo = User::whereId($user->id)->select('id', 'name', 'email', 'phone', 'avatar')->first();
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_register_success');
                    $this->msg['UserInfo'] = $userinfo->toArray();
                    $http_code = '200';

                    $user = User::findOrFail($user->id);

                    $template = EmailTemplate::find(1);

                    $logo = url('/images/email_logo.png');


                    /* Start code for email sending */
                    $email_data['email'] = $user->email;
                    $email_data['name'] = $user->name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $verify_link = url('api/register/verify/' . $user->email_token);
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $user->name, str_replace('u_verify_link', $verify_link, $template->content))));

                    Mail::send('emails.verification', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Email Verification - ONCOassist');
                        $message->setBody($email_data['body']);
                    });

                    DB::commit();
                } catch (Exception $e) {
                    DB::rollback();
                    /* something went wrong whilst attempting to encode the token */
                    $this->msg['sStatus'] = 0;
                    $this->msg['sMessage'] = $e->getMessage();
                    $this->msg['UserInfo'] = (object) null;
                    $http_code = '500';
                }
            } else {
                /* Validation error message */
                $error_message = $validator->messages()->first();
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $error_message;
                $this->msg['UserInfo'] = (object) null;
                $http_code = '400';
            }
        }

        return response()->json($this->msg, $http_code);
    }

    /**
     * Log out
     * Invalidate the token, so user cannot use it anymore
     * They have to relogin to get a new token
     *
     * @param Request $request
     */
    public function logout(Request $request) {

        /* Checking validation */
        $validator = Validator::make($request->all(), [
                    'userid' => 'required',
        ]);
        /* If validation will be working with provided information */
        if (!$validator->fails()) {
            try {
                $id = $request->input('userid');
                /* checking user exists or not and update setting */
                $user = User::find($id);
                if ($user) {
                    /* If user exists */
                    $user->is_login = '0';
                    $user->save();
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_logout');
                    $http_code = '200';
                } else {
                    /* If user doesn't not exists */
                    $this->msg['sStatus'] = 0;
                    $this->msg['sMessage'] = trans('messages.user_doesnot_exists');
                    $http_code = '400';
                }
            } catch (Exception $e) {
                /* Something went wrong while updating user setting */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $http_code = '500';
            }
        } else {
            /* Validation error message */
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

    /* function for sending resend confirmation for user */

    function resendconfirmation(Request $request) {
        /* Checking validation */
        $validator = Validator::make($request->all(), [
                    'email' => 'required',
        ]);
        if (!$validator->fails()) {
            $email = $request->input('email');
            $user = User::where('email', $email)->first();

            if ($user) {
                if ($user->verified == 1) {
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_already_verify');
                    $http_code = '400';
                } else {
                    $user = User::where('email', $email)->first();
                    
                    $template = EmailTemplate::find(1);

                    $logo = url('/images/email_logo.png');


                    /* Start code for email sending */
                    $email_data['email'] = $user->email;
                    $email_data['name'] = $user->name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $verify_link = url('api/register/verify/' . $user->email_token);
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $user->name, str_replace('u_verify_link', $verify_link, $template->content))));

                    Mail::send('emails.verification', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Email Verification - ONCOassist');
                        $message->setBody($email_data['body']);
                    });
                    
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_resend_cofirmation');
                    $http_code = '200';
                }
            } else {
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = trans('messages.user_emailid_not_exists');
                $http_code = '400';
            }
        } else {
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

    /*
     * Function to verify user
     */

    public function verify($token) {

        $user = User::where('email_token', $token)->first();

        /* Check if it's valid token or not */
        if ($user === null) {
            /* user doesn't exist */
            $message = trans('messages.user_verified_fail');
            return view('verify', compact('message'));
        } else {
            /* If it's valid token then activate the user */
            $user_data = $user->toArray();
            $user_data['sendOn'] = Carbon::now()->format('d, M Y');
            /*$front_link = config('app.front_link');*/

            User::where('email_token', $token)->firstOrFail()->verified();
            $message = trans('messages.user_verified_success');

            $template = EmailTemplate::find(5);

            $logo = url('/images/email_logo.png');


            /* Start code for email sending */
            $email_data['email'] = $user_data['email'];
            $email_data['name'] = $user_data['name'];
            $email_data['sendOn'] = Carbon::now()->format('d, M Y');
            $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_name', $user_data['name'], $template->content)));

            Mail::send('emails.welcomeuser', $email_data, function($message) use ($email_data) {
                $message->to($email_data['email'], $email_data['name'])->subject('Welcome - ONCOassist');
                $message->setBody($email_data['body']);
            });

            return view('verify', compact('message'));
        }
    }

    /**
     * ResetPassword
     * Method: POST
     * Request URL: http://your-domain.com/api/resetpassword
     * User will provide email, token , password and new password
     * System will update new password into database
     * Request Data: - {"email":"gopalpp@projectdemo.biz","password":"bl2G44yZDniv","new_password":"abcd@1234","confirm_password":"abcd@1234"}
     */
    public function resetpassword(Request $request) {
        /* Checking validation */
        $validator = Validator::make($request->all(), [
                    'userid' => 'required',
                    'password' => 'required',
                    'new_password' => 'required',
                    'confirm_password' => 'required|same:new_password',
        ]);
        /* If validation working proper */
        if (!$validator->fails()) {
            try {
                $user = User::select('email', 'id')->where('id', $request->input('userid'))->first();
                $credentials['email'] = $user->email;
                $credentials['password'] = $request->input('password');
                if (JWTAuth::attempt($credentials)) {
                    /* If user can able to login via provided email and password */
                    $new_password = $request->input('new_password');
                    $user->password = bcrypt($new_password);
                    $user->save();
                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_password_reset_success');
                    $http_code = '200';
                } else {
                    /* If user cant able to login with provided email and password */
                    $this->msg['sStatus'] = 0;
                    $this->msg['sMessage'] = trans('messages.user_invalid_password');
                    $http_code = '400';
                }
            } catch (Exception $e) {
                /* Something went wrong while updating new password */
                $http_code = '500';
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
            }
        } else {
            /* Validation error message if validation will be fail */
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * ForgotPassword
     * Method: POST
     * Request URL: http://your-domain.com/api/forgotpassword
     * Send email with new password to provided email address and update to database
     * Request Data: - {"email":"gopalpp@projectdemo.biz"}
     */
    public function forgotpassword(Request $request) {
        /* Checking Validation */
        $validator = Validator::make($request->all(), [
                    'email' => 'required',
        ]);

        $email = $request->input('email');
        /* If validation working fine with provided information */
        if (!$validator->fails()) {
            try {
                $user = User::where('email', $email);
                /* If user exists with provided email into database */
                if ($user->count() == 1) {
                    /* Getting user object for updating new password into database */
                    $user = User::where('email', '=', $email)->firstOrFail();
                    $new_password = str_random(12);
                    $user->password = Hash::make($new_password);
                    $user->save();

                    $template = EmailTemplate::find(2);

                    $logo = url('/images/email_logo.png');

                    /* Start code for email sending */
                    $email_data['password'] = $new_password;
                    $email_data['email'] = $email;
                    $email_data['name'] = $user->name;
                    $email_data['sendOn'] = Carbon::now()->format('d, M Y');
                    $email_data['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $email_data['sendOn'], str_replace('u_password', $new_password, str_replace('u_name', $user->name, $template->content))));

                    Mail::send('emails.forgotpassword', $email_data, function($message) use ($email_data) {
                        $message->to($email_data['email'], $email_data['name'])->subject('Forgot Password - ONCOassist');
                        $message->setBody($email_data['body']);
                    });

                    $this->msg['sStatus'] = 1;
                    $this->msg['sMessage'] = trans('messages.user_forgot_email_send');
                    $http_code = '200';
                    /* End code for email sending */
                } else {
                    /* If user doesn't exists */
                    $this->msg['sStatus'] = 0;
                    $this->msg['sMessage'] = trans('messages.user_emailid_not_exists');
                    $http_code = '400';
                }
            } catch (Exception $e) {
                /* something went wrong while updating new password and email send to user */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $http_code = '500';
            }
        } else {
            /* Validation error message */
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to edit existing record based on primary key
     * Method: POST
     * Request URL: http://your-domain.com/api/updatprofile
     * Request Data: {"name":"jitu","l_name":"Prajapati","userid":"46"}
     */
    public function updateprofile(Request $request) {

        $data = $request->all();
        $userid = $data['userid'];

        try {
            $user = User::whereId($userid)->first();
            $avatar = $user->avatar;
            if ($user) {
                $input = $request->all();
                $input = $request->except(['avatar']);
                /* If user exist */
                User::find($userid)->update($input);

                if (Input::hasFile('avatar')) {
                    if ($request->file('avatar')->isValid()) {

                        $file = $request->file('avatar');
                        $ext = $file->extension();
                        $timestamp = strtotime(Carbon::now());
                        $filename = $file->storeAs('uploads/users/' . $user->id, "{$timestamp}.{$ext}");
                        $user->avatar = $filename;
                        if ($user->save()) {
                            if (!strpos($avatar, "user_blank.png")) {
                                $image = explode('uploads', $avatar);
                                $filename = public_path() . '/uploads' . $image[1];
                                chmod(public_path() . '/uploads', 0777);
                                File::delete($filename);
                            }
                        }
                    }
                }

                $user = User::where('id', $userid)->select('id', 'email', 'name', 'phone', 'avatar', 'paypal_id')->first();
                $this->msg['sStatus'] = 1;
                $this->msg['sMessage'] = trans('messages.user_profile_success');
                $this->msg['UserInfo'] = $user;
                $http_code = '200';
            } else {
                /* If user doesn't not exists */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = trans('messages.user_doesnot_exists');
                $this->msg['UserInfo'] = (object) null;
                $http_code = '400';
            }
        } catch (Exception $e) {
            // Something went wrong while updating user profile
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $e->getMessage();
            $this->msg['UserInfo'] = (object) null;
            $http_code = '500';
        }

        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to delete existing record based on primary key
     * Method: DELETE
     * Request URL: http://your-domain.com/api/deleteprofile
     * Request Data: {"userid":"46"}
     */
    public function deleteprofile(Request $request) {
        $id = $request->input('userid');
        try {
            $user = User::find($id);
            if ($user) {
                /* If user exists */
                User::find($id)->delete();
                $this->msg['sStatus'] = 1;
                $this->msg['sMessage'] = trans('messages.user_delete_success');
                $http_code = '200';
            } else {
                /* If user doesn't not exists */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = trans('messages.user_doesnot_exists');
                $http_code = '400';
            }
        } catch (Exception $e) {
            /* Something went wrong while deleting user profile */
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to get user profile
     * Method: GET
     * Request URL: http://your-domain.com/api/getprofile?userid=108
     */
    public function getprofile(Request $request) {
        $userid = $request->input('userid');
        try {
            $user_details = User::whereId($userid)->select('id', 'email', 'name', 'phone', 'avatar', 'paypal_id')->first();
            if ($user_details) {
                /* If user exists */
                $this->msg['sStatus'] = 1;
                $this->msg['sMessage'] = 'Success';
                $this->msg['UserInfo'] = $user_details;
                $http_code = '200';
            } else {
                /* If user doesn't not exists */
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = trans('messages.user_doesnot_exists');
                $http_code = '400';
            }
        } catch (Exception $e) {
            /* Something went wrong while getting user profile */
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to get user profile
     * Method: GET
     * Request URL: http://your-domain.com/api/getprofile?userid=108
     */
    function autologin(Request $request, $id) {
        $user = User::select('id', 'name', 'email', 'phone', 'avatar')->whereId($id)->first();
        if ($user) {
            $user->is_login = 1;
            $user->save();

            $this->msg['sStatus'] = 1;
            $this->msg['sMessage'] = 'Success';
            $this->msg['UserInfo'] = $user->toArray();
            $http_code = '200';
        } else {
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = trans('messages.user_doesnot_exists');
            $this->msg['UserInfo'] = '';
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to get cms content
     * Method: GET
     * Request URL: http://your-domain.com/api/getcms?slug=contact-us
     */
    public function getcms(Request $request) {
        $slug = $request->input('slug');
        try {
            /* Fetching cms data based on provided slug */
            $cms_details = CMS::where('slug', $slug)->select('description', 'content', 'page_name', 'id')->first();
            $this->msg['sStatus'] = 1;
            $this->msg['sMessage'] = 'Success';
            $this->msg['CmsInfo'] = $cms_details;
            $http_code = '200';
        } catch (Exception $e) {
            // Something went wrong while getting cms content
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $e->getMessage();
            $http_code = '500';
        }
        return response()->json($this->msg, $http_code);
    }

    /**
     * API function to store contact us
     * Method: POST
     * Request URL: http://your-domain.com/api/contactus
     */
    public function contactus(Request $request) {
        /* Checking Validation */
        $validator = Validator::make($request->all(), [
                    'email' => 'required',
                    'comment' => 'required',
                    'name' => 'required',
                    'phone' => 'max:15|numeric'
        ]);
        if (!$validator->fails()) {
            try {
                /* Storeing contactus data */
                $contact = Contactus::create($request->all());

                $template = EmailTemplate::find(3);

                $logo = url('/images/email_logo.png');

                $contact_details = Contactus::findOrFail($contact->id)->toArray();
                $contact_details['sendOn'] = Carbon::now()->format('d, M Y');
                $contact_details['body'] = str_replace('u_logo', $logo, str_replace('u_sendOn', $contact_details['sendOn'], str_replace('u_name', $contact->name, str_replace('u_comment', $contact->comment, str_replace('u_phone', $contact->phone, str_replace('u_email', $contact->email, str_replace('u_logo', url('/images/email_logo.png'), $template->content)))))));

                Mail::send('emails.contactus', $contact_details, function($message) use ($contact_details) {
                    $message->to(config('settings.contact_us_mail'), $contact_details['name'])->subject('Contact us - ONCOassist');
                    $message->setBody($contact_details['body']);
                });


                $this->msg['sStatus'] = 1;
                $this->msg['sMessage'] = trans('messages.contact_send_success');
                $http_code = '200';
            } catch (Exception $e) {
                // Something went wrong while storing contact us data
                $this->msg['sStatus'] = 0;
                $this->msg['sMessage'] = $e->getMessage();
                $http_code = '500';
            }
        } else {
            /* Validation error message */
            $error_message = $validator->messages()->first();
            $this->msg['sStatus'] = 0;
            $this->msg['sMessage'] = $error_message;
            $http_code = '400';
        }
        return response()->json($this->msg, $http_code);
    }

}
