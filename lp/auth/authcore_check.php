<?php
require_once __DIR__.'/../bpcore/db-connect.php';
require_once __DIR__.'/../bpcore/session.php';
 
sec_session_start();
// if ($mysqli -> connect_errno) {
// 	echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
// 	exit();
//   }

// print_r($_SESSION);
 
if (login_check($mysqli) == true) {
    $logged = 'in';
    require_once __DIR__.'/../bpcore/keynamespace.php';
} else {
    $logged = 'out';
   header('Location: login.php');

}


?>