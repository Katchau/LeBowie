<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/topic.php";

$admin_id = strip_tags($_POST["topic-admin-id"]);
$title = strip_tags($_POST["topic-title"]);
$description = strip_tags($_POST["topic-description"]);

$topicId = createTopic($admin_id, $title, $description);

if (!$topicId) {
    $_SESSION["error messages"][] = "Topic creation failed";
    header("Location: $BASE_URL" . "pages/topic/new.php");
}
else {
    header("Location: $BASE_URL" . "pages/topic/list.php?id=" . $topicId);
}
?>
