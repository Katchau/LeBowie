<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$username = $_GET['username'];
if(!isset($username)) {
    echo 'Invalid User!'. '<br>';
    exit;
}    
$user = getUser($username);
$userAnswers = getUserAnswers($username);
$userQuestions = getUserQuestions($username);
$userTopics = getUserFrequentTopics($user['id']);

$smarty->assign('user', $user);
$smarty->assign('answers', $userAnswers);
$smarty->assign('questions', $userQuestions);
$smarty->assign('topics', $userTopics);
$smarty->display('users/profile.tpl');
?>
