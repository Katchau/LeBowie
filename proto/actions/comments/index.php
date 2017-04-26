<?php

require_once "../../config/init.php";
require_once $BASE_DIR . "database/questions.php";
require_once $BASE_DIR . "database/answers.php";

$id = strip_tags($_POST["comment-user-id"]);
$answer_id = strip_tags($_POST["comment-answer-id"]);
$description = strip_tags($_POST["comment-body"]);

createComment($id, $answer_id, $description);
header("Location: $BASE_URL" . "pages/questions/index.php?id=" . $question_id);

?>
