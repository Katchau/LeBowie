<?php
	include_once('../../config/init.php');
  	include_once($BASE_DIR .'database/questions.php');

	function hotQuestions(){
		return getHotQuestions();
	}

	function recentQuestions(){
		return getRecentQuestions();
	}

	function bestQuestions(){
		return getBestQuestions();
	}

	function getQuestionInformation(){
		if(!isset($_GET['id'])){
			echo 'No such question found!';
			exit;
		}
		$question_id = $_GET['id'];
		return getQuestionInfo($question_id);
	}
?>