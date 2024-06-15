<?php
require_once __DIR__.'/../../../include/config.php';

$output = "";

// Applying filters
$username = filter_var($_REQUEST["username"], 513);
$hospital_name = filter_var($_REQUEST["hospital_name"], 513);
$password = md5($_REQUEST["password"]);
$mobile = numOnly($_REQUEST["mobile"]);

// Check if the PRODUCTION constant is defined and true
if (defined('PRODUCTION') && PRODUCTION) {
    $output = '{"status":"failure", "remark":"This feature is disabled in production."}';
} else {
    // Validate input data
    if (!empty($username) && !empty($hospital_name) && !empty($_REQUEST["password"]) && !empty($_REQUEST["mobile"])) {
        if (strlen($username) >= 4 && strlen($hospital_name) >= 4) {
            if (strlen($_REQUEST["password"]) >= 6 && strlen($_REQUEST["password"]) <= 12) {
                if (strlen($mobile) == 10 && strlen($_REQUEST["mobile"]) == 10) {
                    // Check if the hospital username already exists
                    if (checkHospital($username)) {
                        // Insert hospital into the database
                        $output = insert_hospital($username, $hospital_name, $password, $mobile);
                        if ($output) {
                            $output = '{"status":"success", "remark":"Successfully Registered, Please login"}';
                        } else {
                            $output = '{"status":"failure", "remark":"Sorry, There was a problem registering the hospital."}';
                        }
                    } else {
                        $output = '{"status":"failure", "remark":"Username already exists, please choose another one."}';
                    }
                } else {
                    $output = '{"status":"failure", "remark":"Mobile must be 10 digits long."}';
                }
            } else {
                $output = '{"status":"failure", "remark":"Password must be 6-12 characters long."}';
            }
        } else {
            $output = '{"status":"failure", "remark":"Username and hospital name must be at least 4 characters long."}';
        }
    } else {
        $output = '{"status":"failure", "remark":"All fields are required."}';
    }
}

echo $output;
mysqli_close($con);
?>
