<?php
include_once('../../config/init.php');
include_once($BASE_DIR . "database/topic.php");

$topics = getTopics();
	
$smarty->assign('topics', $topics);
$smarty->display('questions/ask.tpl');
?>
