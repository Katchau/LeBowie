<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

$username = $_GET['username'];
if(!isset($username)){
	echo 'Invalid User!'. '<br>';
	exit;
}	
$user = getUser($username);
	
$smarty->assign('user',$user);
$smarty->display('user/profile.tpl');
$smarty->display('frontpage/footer.tpl');
?>
