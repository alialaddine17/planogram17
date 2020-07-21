<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }
    public function config_clear()
      {
         \Artisan::call('config:clear');
         return redirect()->back()->with('status','config Cleared!');
      }

      public function cache_clear()
      {
          \Artisan::call('cache:clear');
          return redirect()->back()->with('status','Cache Cleared!');
      }
      public function route_clear()
      {
         \Artisan::call('route:clear');
         return redirect()->back()->with('status','route Cleared!');
      }

      public function view_clear()
      {
          \Artisan::call('view:clear');
          return redirect()->back()->with('status','view Cleared!');
      }
      public function config_cache()
      {
          \Artisan::call('config:cache');
          return redirect()->back()->with('status','config cache!');
      }
}
