<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$user = getUserById($_GET["id"]);

if ($user.rowCount() == 0) {
    http_response_code(404);
} else {
    echo json_encode($user);
}
?>