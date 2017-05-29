<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';
require_once $BASE_DIR . 'database/topic.php';

$topicId = $_GET['id'];
if (isset($topicId)) $topicMods = getTopicMods($topicId);

function isMod(){
	if (!isset($topicMods)) return FALSE;
	$user = getUserProfileInfo($_SESSION['username']);
	for ($i = 0; $i < count($topicMods); ++$i){
		if ($user['id'] === $topicMods[$i]['id']){
			return TRUE;
		}
	}
	return FALSE;
}

if(isset($topicId)) {
    try{
		$questions = getAllQuestionsTopic($topicId, 0, 10);
		$topic = getTopicInfo($topicId);
		
		if (isMod()) $smarty->assign('TOPICMODERATOR', TRUE);
		else $smarty->assign('TOPICMODERATOR', FALSE);

		$smarty->assign('questions', $questions);
		$smarty->assign('topic', $topic);
		$smarty->assign('topicId', $topicId);
		$smarty->assign('topicMods', $topicMods);
		$smarty->display('topic/list.tpl');
	}
	catch(PDOException $e){
		$smarty->assign('errorMessage', "No such topic found!");
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
