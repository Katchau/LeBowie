<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$method = $_SERVER["REQUEST_METHOD"];
switch ($method) {
    case "GET":
	get();
	break;
    case "DELETE":
	delete();
	break;
    default:
	http_response_code(405);
}

function get() {
    $id = $_GET["id"];
    try {
	$user = getUserById($id);
	$badges = getUserBadges($id);
	if (!isset($user["id"])) {
	    http_response_code(404);
	    exit;
	}
    } catch (PDOException $e) {
	http_response_code(500);
    }
    echo serializeUser($user, $badges);
}

function delete() {
    // TODO: Verificar as permissoes do utilizador que faz o pedido
    
    $contents = file_get_contents("php://input");
    $_delete = json_decode($contents, true);

    $id = $_delete["id"];
    deleteUser($id);
}
?>
