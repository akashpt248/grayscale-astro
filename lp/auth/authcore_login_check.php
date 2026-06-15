<?php
require_once __DIR__.'/../bpcore/db-connect.php';
require_once __DIR__.'/../bpcore/session.php';
 
sec_session_start();

 
if (login_check($mysqli) == true) {
    $logged = 'in';
    header('Location: index.php');
} else {
    $logged = 'out';

}


?>