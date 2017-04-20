<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/questions.php');

$questionId = $_GET["id"];
$question = getQuestionInfo($questionId);
$tags = getQuestionTags($questionId);

$smarty->assign('question', $question);
$smarty->assign('tags', $tags);
$smarty->display('questions/question.tpl');
?>
