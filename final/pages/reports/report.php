<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$postId = $_GET['id'];
$questionId = $_GET['question'];

if ($postId == $questionId) {
    $question = getQuestionInfo($questionId);
    $smarty->assign('question', $question);
} else {
    $content = getLatestPostInstance($postId);
    $smarty->assign('content', $content);
}

$smarty->assign('post_id', $postId);
$smarty->assign('question_id', $questionId);
$smarty->display('reports/report.tpl');
?>