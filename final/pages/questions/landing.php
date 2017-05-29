<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';
    
$hot_questions = getHotQuestions(0, 10);
$recent_questions = getRecentQuestions(0, 10);
$best_questions = getBestQuestions(0, 10);
    
$smarty->assign('hquestions', $hot_questions);
$smarty->assign('rquestions', $recent_questions);
$smarty->assign('bquestions', $best_questions);
$smarty->display('frontpage/landing.tpl');
?>
