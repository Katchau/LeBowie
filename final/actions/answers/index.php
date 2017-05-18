<?php

require_once "../../config/init.php";
require_once $BASE_DIR . "database/questions.php";
require_once $BASE_DIR . "database/answers.php";

$id = strip_tags($_POST["answer-user-id"]);
$question_id = strip_tags($_POST["answer-question-id"]);
$description = strip_tags($_POST["answer-body"]);

createAnswer($id, $question_id, $description);
header("Location: $BASE_URL" . "pages/questions/index.php?id=" . $question_id);

?>
