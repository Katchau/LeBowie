<?php
	include_once('config/init.php');
	include_once($BASE_DIR . 'db/pdos idk.php');
	echo '<p> lol </p>';
	
	$tests = getAllQuestionsTopic(1);
	
	$smarty->assign('questions',$tests);
	$smarty->display('questions/listquestions.tpl');
	
?>