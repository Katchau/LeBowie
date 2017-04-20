<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/questions.php");

$id = strip_tags($_POST["question-user-id"]);
$title = strip_tags($_POST["question-title"]);
$description = strip_tags($_POST["question-description"]);
$topic = strip_tags($_POST["question-topic"]);

$commaSeparatedTags = strip_tags($_POST["question-tags"]);
$untrimmedTags = explode(",", $commaSeparatedTags);
$tags = array_map('trim', $untrimmedTags);

createQuestion($id, $title, $description, $topic, $tags);
header("Location: $BASE_URL" . "pages/questions/ask.php");
?>