<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$method = $_SERVER['REQUEST_METHOD'];
$params = json_decode(file_get_contents('php://input'), true);
switch ($method) {
    case 'GET':
        get($_GET);
        break;
    default:
        http_response_code(405);
}

function get($params)
{
    $title = $params['title'];
    try {
        $question = getQuestionApproximateTitle($title);
        if ($question == null) {
            http_response_code(404);
            return;
        }
        echo json_encode($question);
    } catch (PDOException $e) {
        echo $e->getMessage();
        http_response_code(500);
    }
}

