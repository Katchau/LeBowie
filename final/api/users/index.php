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
        if ($user == null) {
            http_response_code(404);
            return;
        }
    } catch (PDOException $e) {
        http_response_code(500);
    }
    echo serializeUser($user);
}

function delete($params) 
{
    if (!isset($_SESSION["userid"])) {
        http_response_code(401);
        return;
    } else {
        // TODO: Se estiver autenticado verificar se tem autorizacao
        // e se nao tiver devolver 403 - forbidden
    }
    $id = $params["id"];
    try {
        if (getUserById($id) == null) {
            http_response_code(404);
            return;
        }
        deleteUser($id);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}

function put($params) 
{
    if (!isset($_SESSION["userid"])) {
        http_response_code(401);
        return;
    } else {
        // TODO: Se estiver autenticado verificar se tem autorizacao
        // e se nao tiver devolver 403 - forbidden
    }
    $id = $params["id"];
    $email = $params["email"];
    $password = $params["password"];
    $firstName = $params["firstName"];
    $lastName = $params["lastName"];
    $description = $params["description"];
    try {
        if (getUserById($id) == null) {
            http_response_code(404);
            return;
        }
        updateUser($id, $email, $password, $firstName, $lastName, $description);
        $user = getUserById($id);
        echo serializeUser($user);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}
?>
