<?php
require_once "../../config/init.php";
require_once $BASE_DIR . "database/reports.php";

$userId = strip_tags($_POST["user-id"]);
$postId = strip_tags($_POST["post-id"]);

$title = strip_tags($_POST["report-title"]);
$reason = strip_tags($_POST["report-reason"]);
$content = strip_tags($_POST["report-content"]);
?>
