<?php  

namespace App\Helpers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Role;
use App\RolePermission;
use Response;
use Validator;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Support\Facades\Mail;
use Config;



class Helper
{	

	public static function multiAction(Request $request,$model,$module,$ids=''){

		$msg = array();

		if($request->has('action')){
			
				if($ids != ''){

					$arr = explode(',',$ids);

					switch ($request->action) {
						case '0':
							$action = $model::withTrashed()->whereIn('id',$arr)->update(['status'=>0]);
							break;
						case '1':
							$action = $model::withTrashed()->whereIn('id',$arr)->update(['status'=>1]);
							break;
						case '2':
							$action = $model::whereIn('id',$arr)->delete();
							break;
						case '3':
							$action = $model::withTrashed()->whereIn('id',$arr)->update(['deleted_at'=>NULL]);
							break;
						default:
							# code...
							break;
					}

					if($action){

						if($request->action == 0){
							$message = \Lang::get('messages.multi_inactive_success',array('argument'=>ucfirst($module)));
						}
						elseif ($request->action == 1) {
							$message = \Lang::get('messages.multi_active_success',array('argument'=>ucfirst($module)));
						}
						elseif ($request->action == 2) {
							$message = \Lang::get('messages.multi_delete_success',array('argument'=>ucfirst($module)));
						}
						else if ($request->action == 3) {
							$message = \Lang::get('messages.multi_undelete_success',array('argument'=>ucfirst($module)));
						}

	                    $msg['status'] = 1;
	                    $msg['message'] = $message;
	                    $msg['http_code'] = 200;
	                }
	                else{

	                	if($request->action == 0){
							$message = \Lang::get('messages.multi_inactive_failed',array('argument'=>$module));
						}
						elseif ($request->action == 1) {
							$message = \Lang::get('messages.multi_active_failed',array('argument'=>$module));
						}
						elseif ($request->action == 3) {
							$message = \Lang::get('messages.multi_delete_failed',array('argument'=>$module));
						}
						else{
							$message = \Lang::get('messages.multi_undelete_failed',array('argument'=>$module));
						}

	                    $msg['status'] = 0;
	                    $msg['message'] = $message;
	                    $msg['http_code'] = 400;
	                }

				}
				else{
					$msg['status'] = 0;
	                $msg['message'] = trans('messages.no_change');
	                $msg['http_code'] = 400;
				}

			}
			else{

				$msg['status'] = 0;
                $msg['message'] = trans('messages.no_action');
                $msg['http_code'] = 400;

			}

			return $msg;

	}

	/*
	 * Below method for used to the send email usin smtp 
	 */

	 public  static function sendEmail($to_email,$email_title,$email_body,$email_subjet){

		$msg = array();

		// Get smtp confiure value from settings table    
		$email_config = DB::table('settings')->select('value', 'name')->whereIn('name', array('port', 'username', 'password', 'from_email'))->get()->toArray();

		// Convert MD array to single array
		$email_config_array = array_column($email_config, 'value', 'name');

		// Setuo config array values
		$config = array(
			'driver' => 'smtp',
			'host' => 'smtp.gmail.com',
			'port' => $email_config_array['port'],
			'encryption' => 'tls',
			'username' => $email_config_array['username'],
			'from' => array('address' => $email_config_array['from_email'], 'name' => $email_config_array['from_email']),
			'password' => $email_config_array['password'],
			'sendmail' => '/usr/sbin/sendmail -bs',
			'pretend' => false
		);

		// Set Config value in smtp
		Config::set('mail', $config);

		// Set email title
		$data['title'] = $email_title;

		$input_data = array('to_email' => $to_email, 'email_subjet' => $email_subjet,'email_body'=> $email_body);    


		// // Function for send test mail
		// Mail::raw(['html' => 'tet'], function ($message) use ($input_data) {

		// 	$message->to($input_data['to_email'], 'Test')

		// 		->subject($input_data['email_subjet']);
		// });


		Mail::send([], [], function ($message) use ($input_data) {
			$message->to($input_data['to_email'], 'Test')
			->subject($input_data['email_subjet'])
			->setBody($input_data['email_body'], 'text/html'); // for HTML rich messages
		});

		// Send for mail send or not
		if (Mail::failures()) {
			// If mail not send than show error 
			$msg['status'] = 0;
			$msg['message'] = trans('messages.mail_sent_fail');
			$http_code = '400';
		} else {
			$msg['status'] = 1;
			$msg['message'] = trans('messages.mail_sent_success');
			$http_code = '200';
		}
		
		// Send email responase
		return $msg;

	 }

}

