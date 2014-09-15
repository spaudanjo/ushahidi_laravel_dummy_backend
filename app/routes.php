<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::get('/', function()
{
	return View::make('hello');
});

// Route::get('users', array('before' => 'oauth', function(){
// 		$users = User::all();
//
// 		return View::make('users')->with('users', $users);
// });

Route::group(array('prefix' => 'api/v2', 'before' => array('oauth')), function()
{
	Route::get('users.json', array(function(){
			$users = User::all();

			return Response::json(array(
	        'error' => false,
	        'users' => $users->toArray()),
	        200
	    );
	}));

	Route::get('posts', array(function(){
			$posts = Post::all();

			return Response::json($posts->toArray(), 200);
	}));

});

Route::post('oauth/access_token', function()
{
    return AuthorizationServer::performAccessTokenFlow();
});
