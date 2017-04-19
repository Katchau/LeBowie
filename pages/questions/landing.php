<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'actions/questions/question.php');
	
$hot_questions = hotQuestions();
$recent_questions = recentQuestions();
$best_questions = bestQuestions();
	
$smarty->assign('hquestions',$hot_questions);
$smarty->assign('rquestions',$recent_questions);
$smarty->assign('bquestions',$best_questions);
$smarty->display('frontpage/landing.tpl');
?>
