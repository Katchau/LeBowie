<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$postId = $_GET['id'];

$smarty->assign('post_id', $postId);
$smarty->display('reports/report.tpl');
?>