<?php
namespace App\Http\Middleware;
use Closure;
class ApiDataLogger
{
private $startTime;
/**
* Handle an incoming request.
*
* @param  \Illuminate\Http\Request  $request
* @param  \Closure  $next
* @return mixed
*/
public function handle($request, Closure $next)
{
    $this->startTime = microtime(true);
    return $next($request);
}
public function terminate($request, $response)
{
   if (env('API_DATALOGGER', false)) {
    return;
   }
   $end_time = microtime(true);
   $filename = 'api_datalogger_' . date('d-m-Y') . '.log';
   $main = array();
   $main['Time'] = gmdate("F j, Y, g:i a");
   $main['Duration'] = number_format($end_time - LARAVEL_START, 3);
   $main['IP Address'] = $request->ip();
   $main['URL'] = $request->fullUrl();
   $main['Method'] = $request->method();
   $main['Input'] = json_decode($request->getContent());
   $main['Output'] = json_decode($response->getContent());
   $data = json_encode($main, JSON_PRETTY_PRINT);
   \File::append(public_path('apilogs' . DIRECTORY_SEPARATOR . $filename), $data. "\n" . str_repeat("=", 20) . "\n\n");
}
}

?>
