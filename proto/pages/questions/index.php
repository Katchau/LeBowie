<?php
require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';
require_once $BASE_DIR .'database/answers.php';

$questionId = $_GET["id"];
$question = getQuestionInfo($questionId);
$tags = getQuestionTags($questionId);
$answers = getBestAnswers($questionId);
$selected = ($question['answer_desc'] != null) ? getSelectedAnswer($questionId) : null;

$smarty->assign('question', $question);
$smarty->assign('tags', $tags);
$smarty->assign('answers', $answers);
$smarty->assign('selected', $selected);
$smarty->display('questions/question.tpl');
?>
