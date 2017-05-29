<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/topic.php";

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
    global $smarty;

    $topic = $_GET["topic"];
    $offset = $_GET["offset"];
    $limit = $_GET["limit"];

    $questions = getAllQuestionsTopic($topic, $offset, $limit);
    if ($questions != null) {
        $smarty->assign('questions', $questions);
        $output = $smarty->fetch('questions/listquestions.tpl');
        echo $output;
    } else {
        http_response_code(204);
    }
}
?>