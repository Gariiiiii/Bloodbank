<?php
require_once __DIR__.'/../../../include/config.php';
require_once __DIR__.'/../../../include/function.php';

ini_set('display_errors', 1); // Enable error display
ini_set('display_startup_errors', 1); 
error_reporting(E_ALL); // Report all PHP errors

loginCheckHospital();

$obj = (object)$_REQUEST;
$obj->hospital_id = $_SESSION["id"];

// Fetch the list of requests
$data = requestList($obj);

// Output the JSON encoded data
echo ($data);

mysqli_close($con);
?>
