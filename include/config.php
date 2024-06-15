<?php
    session_start();
    require_once __DIR__ . "/config.php";

    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);


    define('HOSTNAME', '127.0.0.1');
    define('USERNAME', 'root');
    define('PASSWORD', '');
    define('DATABASE', 'blood_bank');
    define('BASE_URL', 'http://localhost/blood_bank-master');
    define('PREFIX', 'bb_');

    define("PRODUCTION", false);

    // db configration
    $server   = HOSTNAME;
    $username = USERNAME;
    $password = PASSWORD;
    $database = DATABASE;
       
    date_default_timezone_set('Asia/Kolkata');
    $con = mysqli_connect($server,$username,$password,$database) or die ("could not connect to mysql");

    // some global value
    $DATETIME_FORMAT = "l, M j, Y @ g:ia";
    $HOSTNAME = BASE_URL;
    $COMPANY_NAME = "Blood Bank";

    require_once 'function.php';
?>