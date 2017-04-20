<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$id = $_GET["id"];

// TODO: Fazer um try catch aqui e dar 500 internal server error em caso de
//       erro
try {
    $user = getUserById($id);
    $badges = getUserBadges($id);
} catch (PDOException $e) {
    http_response_code(500);
}

echo ($user == true);

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
?>
