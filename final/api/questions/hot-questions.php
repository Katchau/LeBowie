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
    $offset = $_GET["offset"];
    $limit = $_GET["limit"];

    $questions = getHotQuestions($offset, $limit);
    $smarty->assign('questions', $questions);
    $output = $smarty->fetch();
    echo $output;
}
?>