<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$user = getUserById($_GET["id"]);
$userObject = [
    "user_id" => $user.id,
    "username" => $user.username
];
echo json_encode($userObject);
?>
