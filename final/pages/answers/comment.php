<?php

require_once '../../config/init.php';
require_once $BASE_DIR .'database/answers.php';
require_once $BASE_DIR .'database/comments.php';

$answerId = $_GET["id"];
$answer = getAnswerInfo($answerId);

$smarty->assign('answer', $answer);

$smarty->display('answers/comment.tpl');

 ?>
