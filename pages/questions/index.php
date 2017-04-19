<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/questions.php');

$questionId = $_GET["id"];
$question = getQuestionInfo($questionId);

$smarty->assign('question', $question);
$smarty->display('questions/question.tpl');
?>
