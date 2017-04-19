<?php
include_once('../../config/init.php');
include($BASE_DIR . 'database/topics.php');

$topicId = $_GET['id'];
if(!isset($topicId)){
	echo 'Invalid Topic!'. '<br>';
	exit;
}
$questions = getAllQuestionsTopic($topicId);
$topic = getTopicInfo($topicId);
	
$smarty->assign('questions',$questions);
$smarty->assign('topic',$topic);
$smarty->display('topic/list.tpl');
?>
