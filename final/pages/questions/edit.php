<?php
require_once '../../config/init.php';
require_once $BASE_DIR .'database/questions.php';

$questionId = $_GET['id'];

if(isset($questionId)) {
    try{
        $question = getQuestionInfo($questionId);

		$smarty->assign('questionId', $questionId);
        $smarty->assign('question', $questionId);
        $smarty->display('questions/edit.tpl');
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