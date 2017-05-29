<?php
require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';
require_once $BASE_DIR .'database/answers.php';
require_once $BASE_DIR .'database/comments.php';
require_once $BASE_DIR . 'database/users.php';
require_once $BASE_DIR . 'database/topic.php';

function isMod($topicMods){
	if (!isset($topicMods)) return FALSE;
	$user = getUserProfileInfo($_SESSION['username']);
	for ($i = 0; $i < count($topicMods); ++$i){
		if ($user['id'] === $topicMods[$i]['id']){
			return TRUE;
		}
	}
	return FALSE;
}

$questionId = $_GET["id"];
if(isset($questionId)) {
    try{
		$question = getQuestionInfo($questionId);
		$tags = getQuestionTags($questionId);
		$answers = getBestAnswers($questionId);
		$selected = ($question['answer_desc'] != null) ? getSelectedAnswer($questionId) : null;
		//testar
		$relquestions = getRelatedQuestions($questionId);
		$topicId = $question['id'];
		$topicMods = getTopicMods($topicId);
		
		if (isMod($topicMods)) $smarty->assign('TOPICMODERATOR', TRUE);
		else $smarty->assign('TOPICMODERATOR', FALSE);
		
		$smarty->assign('question', $question);
		$smarty->assign('relquestions',$relquestions);
		$smarty->assign('tags', $tags);
		$smarty->assign('answers', $answers);
		$smarty->assign('selected', $selected);
		$smarty->display('questions/question.tpl');

	}
	catch(PDOException $e){
		$smarty->assign('errorMessage', "No such question found!");
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
