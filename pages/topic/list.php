<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/topics.php');
	
$questions = getAllQuestionsTopic();
$topic = getTopicInfo();
	
$smarty->assign('questions',$questions);
$smarty->assign('topic',$topic);
$smarty->display('topic/list.tpl');
?>
