<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';
require_once $BASE_DIR . 'database/users.php';

$string = $_GET["string"];

$questions = getQuestionApproximateTitle($string);
$users = getUserApproximate($string);

$smarty->assign('string',$string);
$smarty->assign('questions',$questions);
$smarty->display('questions/search.tpl');
?>