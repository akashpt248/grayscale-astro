<?php
require_once __DIR__.'/../bpcore/db-connect.php';
require_once __DIR__.'/../bpcore/sqltransaction.php';
require_once __DIR__.'/../bpcore/session.php';

sec_session_start();




$auth__init=function($sucess='index.php',$failed='login.php') use($mysqli){

	if (isset($_REQUEST['email'], $_REQUEST['p']))
	{
		$email = $_REQUEST['email'];
		$password = $_REQUEST['p']; 

 		// $user_type=extract_cell('user_type','email',$_REQUEST['email'],'members');

 		 
			if (login($email, $password, $mysqli) == 2) 
			{
				header('Location: '.$sucess);
			} 
			else if(login($email, $password, $mysqli) == 3)
			{
				header('Location: '.$failed."?errorlck=1");

			}else{
				header('Location: '.$failed."?error=1");
 			 
 			}
	} 
	else
	{
		echo 'Invalid Request';
	}


}


 


?>