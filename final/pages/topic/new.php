<?php
require_once '../../config/init.php';
require_once $BASE_DIR . "database/topic.php";

$topics = getTopics();
    
$smarty->assign('topics', $topics);
$smarty->display('topic/new.tpl');
?>
