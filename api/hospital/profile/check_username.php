<?php
require_once __DIR__.'/../../../include/config.php';

$username=filter_var($_REQUEST["username"], 513);
$output=checkHospital($username);

echo $output;
mysqli_close($con);
?>