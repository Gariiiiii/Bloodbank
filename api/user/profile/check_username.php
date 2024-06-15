<?php
require_once __DIR__.'/../../../include/config.php';

$username=filter_var($_REQUEST["username"], 513);
$output=checkUser($username);

echo $output;
mysqli_close($con);
?>