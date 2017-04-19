<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/questions.php");

$title = strip_tags($_POST["question-title"]);
$description = strip_tags($_POST["question-description"]);
$topic = strip_tags($POST["question-topic"]);
$tags = strip_tags($POST["question-tags"]);

createQuestion(1, $title, $description, 1, array("a", "b", "c"));
header("Location: $BASE_URL" . "pages/questions/ask.php");
?>
