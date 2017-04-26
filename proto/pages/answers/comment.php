<?php

require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';
require_once $BASE_DIR .'database/answers.php';

$answerId = $_GET["id"];
$questionId = getQuestionFromAnswer($answerId);

echo "QuestioID: " . $questionId . "\n";
echo "QuestionID[0] " . $questionId[0] . "\n";

$question = getQuestionInfo($questionId[0]);
$tags = getQuestionTags($questionId);
$answer = getAnswerInfo($answerId);

$smarty->assign('question', $question);
$smarty->assign('tags', $tags);
$smarty->assign('answer', $answer);

$smarty->display('answers/comment.tpl');

 ?>
