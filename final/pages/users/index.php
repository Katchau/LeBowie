<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$username = $_GET['username'];
if(isset($username)) {
    try{
		$user = getUserProfileInfo($username);
		$userAnswers = getUserAnswers($username);
		$userQuestions = getUserQuestions($username);
		$userTopics = getUserFrequentTopics($user['id']);
		
		$smarty->assign('user', $user);
		$smarty->assign('answers', $userAnswers);
		$smarty->assign('questions', $userQuestions);
		$smarty->assign('topics', $userTopics);
		$smarty->display('users/profile.tpl');
	}
	catch(PDOException $e){
		$smarty->assign('errorMessage', "No such user found!");
		$smarty->display('common/error.tpl');
		exit(1);
	}
}
else{
	$smarty->assign('errorMessage', "Invalid Page! Link's probably dead!");
	$smarty->display('common/error.tpl');
	exit(1);
}  

?>
