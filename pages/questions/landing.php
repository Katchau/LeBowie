<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
	
$hot_questions = getHotQuestions();
$recent_questions = getRecentQuestions();
$best_questions = getBestQuestions();
	
$smarty->assign('hquestions',$hot_questions);
$smarty->assign('rquestions',$recent_questions);
$smarty->assign('bquestions',$best_questions);
$smarty->display('frontpage/landing.tpl');
?>
