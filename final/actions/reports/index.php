<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/reports.php";
require_once $BASE_DIR . "database/posts.php";

$questionId = strip_tags($_POST["question-id"]);
$userId = strip_tags($_POST["user-id"]);
$postId = strip_tags($_POST["post-id"]);

$title = strip_tags($_POST["report-title"]);
$reason = strip_tags($_POST["report-reason"]);
$content = strip_tags($_POST["report-content"]);

$postInstanceId = getLatestPostInstance($postId)['id'];

try {
    createReport($postInstanceId, $userId, $title, $content, $reason);
    $_SESSION["success_messages"][] = "Report created successfuly";
} catch (PDOException $e) {
    $_SESSION["error_messages"][] = "Report creation failed";
}
echo $postInstanceId . " " . $userId . " " . $title . " " . $content . " " . $reason;
//header("Location: $BASE_URL" . "pages/questions/index.php?id=$questionId");
?>
