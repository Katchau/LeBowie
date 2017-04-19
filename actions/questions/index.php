<?php
include_once("../../config/init.php");
include_once($BASE_DIR . "database/questions.php");

$id = strip_tags($_POST["question-user-id"]);
$title = strip_tags($_POST["question-title"]);
$description = strip_tags($_POST["question-description"]);
$topic = strip_tags($_POST["question-topic"]);

$commaSeparatedTags = strip_tags($POST["question-tags"]);
echo "CommaSeparatedTags=$commaSeparatedtags";

$untrimmedTags = explode(",", $commaSeparatedTags);
foreach ($untrimmedTags as $untrimmedTag) {
	echo "UntrimmedTag=$untrimmedTag";
}

$tags = array_map('trim', $untrimmedTags);
foreach ($tags as $tag) {
	echo "Tag=$tag"; 
}

createQuestion($id, $title, $description, $topic, $tags);
//header("Location: $BASE_URL" . "pages/questions/ask.php");
?>
