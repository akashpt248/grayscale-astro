<?php

$router->map( 'GET', '/', function() {
	require_once __DIR__ . '/../test.php';
});

$router->map( 'GET', '/xlp', function() {
 
 
});

$router->map( 'POST', '/signup', function() {

});



$router->map( 'GET', '/logout', function() {

});

$router->map( 'GET', '/profile/[*:id]', function($id) {

});




?>