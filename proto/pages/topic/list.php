<?php
require_once '../../config/init.php';

$topicId = $_GET['id'];
if(!isset($topicId)) {
    $smarty->assign('topic', $topic);
	$smarty->display('topic/list.tpl');
	exit;
}
$questions = getAllQuestionsTopic($topicId);
$topic = getTopicInfo($topicId);
    
$smarty->assign('questions', $questions);
$smarty->assign('topic', $topic);
$smarty->display('topic/list.tpl');
?>
