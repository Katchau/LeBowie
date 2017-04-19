<?php

	include_once('../../config/init.php');
	include_once($BASE_DIR . 'actions/topic/get_topic.php');
	
	$questions = getTopicQuestions();
	$topic = getTopicInformation();
	
	$smarty->assign('questions',$questions);
	$smarty->assign('topic',$topic);
	$smarty->display('topic/list.tpl');

?>