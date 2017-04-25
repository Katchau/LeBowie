<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/posts.php';

$method = $_SERVER['REQUEST_METHOD'];
$params = json_decode(file_get_contents('php://input'), true);
switch ($method) {
    case 'GET':
        get($_GET);
        break;
    case 'POST':
        post($_POST);
        break;
    default:
        http_response_code(405);
}

function get($params)
{
    if (!isset($_SESSION['userid'])) {
        http_response_code(401);
        return;
    }
    $id = $params['id'];
    try {
        if (getPostById($id) == null) {
            http_response_code(404);
            return;
        }
        $upvote = (getLastVoteByUserOnPost($id, $_SESSION['userid']) == 'Upvote') ? true : false;
        echo json_encode($upvote);
    } catch (PDOException $e) {
        http_response_code(500);
    }
}

function post($params)
{
    if (!isset($_SESSION['userid'])) {
        http_response_code(401);
        return;
    }
    $id = $params['id'];
    try {
        if (getPostById($id) == null) {
            http_response_code(404);
            return;
        }
        $successful = upvotePost($id, $_SESSION['userid']);
        if (!$successful) {
            http_response_code(400);
            return;
        }
    } catch (PDOException $e) {
        http_response_code(500);
    }
}
