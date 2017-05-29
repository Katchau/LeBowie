<?php
require_once '../../config/init.php';
$smarty->assign("topicId", $_GET['id']);
$smarty->display('topic/edit.tpl');

?>