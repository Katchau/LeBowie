<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/questions.php');
include_once($BASE_DIR .'database/answers.php');

$questionId = $_GET["id"];
$question = getQuestionInfo($questionId);
$tags = getQuestionTags($questionId);
$answers = getBestAnswers($questionId);
$selected = ($question['answer_desc'] != NULL) ? getSelectedAnswer($questionId) : NULL;

$smarty->assign('question', $question);
$smarty->assign('tags', $tags);
$smarty->assign('answers',$answers);
$smarty->assign('selected',$selected);
$smarty->display('questions/question.tpl');
?>
