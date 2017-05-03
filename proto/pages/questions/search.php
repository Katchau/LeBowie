<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$string = $_GET["string"];

$questions = getTextSearch($string);


$smarty->assign('string',$string);
$smarty->assign('questions',$questions);
$smarty->display('questions/search.tpl');
?>