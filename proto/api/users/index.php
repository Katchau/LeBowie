<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$id = $_GET["id"];

try {
    $user = getUserById($id);
    $badges = getUserBadges($id);
} catch (PDOException $e) {
    http_response_code(500);
}

if (!isset($user["id"])) {
    http_response_code(404);
} else {
    $badgesObject = [];
    foreach ($badges as $badge) {
	$badgesObject[] = [
	    "id" => $badge["id"],
	    "color" => $badge["color"],
	    "text" => $badge["text"]
	];
    }    
    $userObject = [
	"user_id" => $user["id"],
	"username" => $user["username"],
	"email" => $user["email"],
	"first_name" => $user["first_name"],
	"last_name" => $user["last_name"],
	"country" => $user["country"],
	"description" => $user["description"],
	"image" => $user["image"],
	"score" => $user["score"],
	"badges" => $badgesObject
    ];
    echo json_encode($userObject);
}
?>
