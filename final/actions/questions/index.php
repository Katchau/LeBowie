<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/questions.php";

$id = strip_tags($_POST["question-user-id"]);
$title = strip_tags($_POST["question-title"]);
$description = strip_tags($_POST["question-description"]);
$topic = strip_tags($_POST["question-topic"]);

$commaSeparatedTags = strip_tags($_POST["question-tags"]);
$untrimmedTags = explode(",", $commaSeparatedTags);
$tags = array_map('trim', $untrimmedTags);

$questionId = createQuestion($id, $title, $description, $topic, $tags);
if(!$questionId) {
	$_SESSION["error_messages"][] = "Question creation failed";
	header("Location: $BASE_URL" . "pages/questions/ask.php");
} else {
	header("Location: $BASE_URL" . "pages/questions/index.php?id=" . $questionId);
}
?>
