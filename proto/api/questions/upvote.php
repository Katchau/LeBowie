<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$method = $_SERVER['REQUEST_METHOD'];
$params = json_decode(file_get_contents('php://input'), true);
switch ($method) {
    case 'POST':
        post($_POST);
        break;
    default:
        http_response_code(405);
}

function post($params)
{
    if (!isset($_SESSION['userid'])) {
        http_response_code(401);
        return;
    }
    $id = $params["id"];
    try {
        if (getQuestionById($id) == NULL) {
            http_response_code(404);
            return;
        }
        upvoteQuestion($id, $_SESSION['userid']);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}
?>