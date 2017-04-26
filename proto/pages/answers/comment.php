<?php

require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';
require_once $BASE_DIR .'database/answers.php';

$answerId = $_GET["id"];
$questionId = getQuestionFromAnswer($answerId)[0];

$question = getQuestionInfo($questionId);
$tags = getQuestionTags($questionId);
$answer = getAnswerInfo($answerId);

$smarty->assign('question', $question);
$smarty->assign('tags', $tags);
$smarty->assign('answer', $answer);

$smarty->display('answers/comment.tpl');

 ?>
