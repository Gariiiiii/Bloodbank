<?php
require_once __DIR__.'/../../../include/config.php';
loginCheckHospital();

$output = "";
$hospital_id = $_SESSION["id"];
$blood_id = numOnly($_REQUEST["blood_id"]); 
$volume = $_REQUEST["volume"];

// Use regular expression to extract numeric part
if (preg_match('/\d+/', $volume, $matches)) {
    $volume = (int) $matches[0]; // Convert the numeric part to integer

    if (!empty($blood_id) && !empty($volume)) {
        if (!is_nan($volume)) { // Check if $volume is a valid number
            if (checkBlood($blood_id)) {
                $output = stockInsert($hospital_id, $blood_id, $volume);
                if ($output) {
                    $output = '{"status":"success", "remark":"Successfully added/updated"}';
                } else {
                    $output = '{"status":"failure", "remark":"Sorry, There is something problem"}';
                }
            } else {
                $output = '{"status":"failure", "remark":"Sorry, Invalid Blood selected"}';
            }
        } else {
            $output = '{"status":"failure", "remark":"Volume must be in digit"}';
        }
    } else {
        $output = '{"status":"failure", "remark":"All field are required"}';
    }
} else {
    $output = '{"status":"failure", "remark":"Invalid volume format"}';
}

echo $output;
mysqli_close($con);
?>
