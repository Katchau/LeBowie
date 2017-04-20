<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$user = getUserById($_GET["id"]);

echo json_encode($user);
?>