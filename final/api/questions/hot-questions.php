<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/questions.php";

$method = $_SERVER["REQUEST_METHOD"];
$params = json_decode(file_get_contents("php://input"), true);
switch ($method) {
    case "GET":
        get($params);
        break;
    default:
        http_response_code(405);
}

function get($params) 
{
    $offset = $params["offset"];
    $limit = $params["limit"];

    $questions = getHotQuestions(offset, limit);
    echo josn_encode($questions);
}
?>