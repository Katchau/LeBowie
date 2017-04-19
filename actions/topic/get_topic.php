<?php
	include_once('../../config/init.php');
  	include_once($BASE_DIR .'database/topic.php');  
	
	function getTopicQuestions(){
		if (!isset($_GET['id'])) {
    			// $_SESSION['error_messages'][] = 'You didn\'t say anything';
    			// header("Location: " . $_SERVER['HTTP_REFERER']);
			echo 'No such topic found!';
    			exit;
  		}
  
  		$topic_id = $_GET['id'];
  		return getAllQuestionsTopic($topic_id);
	}
	
	function getTopicInformation(){
		if (!isset($_GET['id'])) {
    			// $_SESSION['error_messages'][] = 'You didn\'t say anything';
    			// header("Location: " . $_SERVER['HTTP_REFERER']);
			echo 'No such topic found!';
    			exit;
  		}
  
  		$topic_id = $_GET['id'];
  		return getTopicInfo($topic_id);
	}
?>