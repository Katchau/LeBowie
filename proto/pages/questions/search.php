<?php
require_once '../../config/init.php';
$string = $_GET["string"];

$smarty->assign('string',$string);
$smarty->display('questions/search.tpl');
?>