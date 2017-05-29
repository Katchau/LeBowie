<?php
require_once '../../config/init.php';

$topicId = $_GET['id'];
if(isset($topicId)) {
    try{
		$questions = getAllQuestionsTopic($topicId);
		$topic = getTopicInfo($topicId);

		$topicMods = getTopicMods($topicId);
			
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
