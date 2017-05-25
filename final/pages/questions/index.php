<?php
require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';
require_once $BASE_DIR .'database/answers.php';
require_once $BASE_DIR .'database/comments.php';

$questionId = $_GET["id"];
if(isset($questionId)) {
    try{
		$question = getQuestionInfo($questionId);
		$tags = getQuestionTags($questionId);
		$answers = getBestAnswers($questionId);
		$selected = ($question['answer_desc'] != null) ? getSelectedAnswer($questionId) : null;
		$allComments = [];
		foreach($answers as $answer){
			$comments = getComments($answer.answer);
			//array_push($allComments, $comments);
		}

		$smarty->assign('question', $question);
		$smarty->assign('tags', $tags);
		$smarty->assign('answers', $answers);
		$smarty->assign('selected', $selected);
		$smarty->assign('allcomments', $allComments);
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
