<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/users.php");

$id = $_GET["id"];
$method = $_SERVER["REQUEST_METHOD"];

if ($method === "GET") {
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
} elseif ($method === "DELETE") {
    // TODO: Verificar as permissoes do utilizador que faz o pedido
    $putdata = fopen("php://input", "r");
    $para = parse_str($vars);

    echo "Am here" . count($vars);
    foreach ($vars as $var) {
	echo $var;
    }
    echo $vars["id"];
}
?>
