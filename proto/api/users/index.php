<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$method = $_SERVER["REQUEST_METHOD"];
$params = json_decode(file_get_contents("php://input"), true);
switch ($method) {
    case "GET":
	get($params);
	break;
    case "DELETE":
	delete($params);
	break;
    default:
	http_response_code(405);
}

function get($params) {
    $id = $params["id"];
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

function delete($params) {
    // TODO: Verificar as permissoes do utilizador que faz o pedido
    $id = $params["id"];
    try {
	deleteUser($id);
    } catch (PDOException $e) {
	http_response_code(500);
    }
}
?>
