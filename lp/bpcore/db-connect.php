<?php
include_once 'config.php';   // As functions.php is not included
$mysqli = new mysqli(DBHOST, DBUSER, DBPASSWORD, DATABASE); 
$mysqli->set_charset("utf8mb4");

?>