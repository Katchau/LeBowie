<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/users.php";

$method = $_SERVER["REQUEST_METHOD"];
$params = json_decode(file_get_contents("php://input"), true);
switch ($method) {
case "GET":
    get($params);
    break;
case "DELETE":
    delete($params);
    break;
case "PUT":
    put($params);
    break;
default:
    http_response_code(405);
}

function get($params) 
{
    $id = $params["id"];
    try {
        $user = getUserById($id);
        if (getUserById($id) == null) {
            http_response_code(404);
            exit;
        }
    } catch (PDOException $e) {
        http_response_code(500);
    }
    echo serializeUser($user);
}

function delete($params) 
{
    if (!isset($_SESSION["id"])) {
        // TODO:
        // Se o utilizador nao estiver autenticado OU nao for moderador/admin
        // entao devolver o codigo http correcto
    }
    $id = $params["id"];
    try {
        deleteUser($id);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}

function put($params) 
{
    if (!isset($_SESSION["id"])) {
        // TODO: Verificar autorização
    }
    $id = $params["id"];
    $email = $params["email"];
    $password = $params["password"];
    $firstName = $params["firstName"];
    $lastName = $params["lastName"];
    $description = $params["description"];
    try {
        echo "EMAIL = " . $email;
        updateUser($id, $email, $password, $firstName, $lastName, $description);
        echo serializeUser($user);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}
?>
