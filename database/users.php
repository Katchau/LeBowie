<?php
	function getUser($username){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM user_info WHERE username = ?");
		$stmt->execute(array($username));
		return $stmt->fetch();
	}
	
	function getUserAnswers($username){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM user_answers_best WHERE username = ?");
		$stmt->execute(array($username));
		return $stmt->fetchAll();
	}
	
	function getUserQuestions($username){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM user_questions_best WHERE username = ?");
		$stmt->execute(array($username));
		return $stmt->fetchAll();
	}
	
	function getUserFrequentTopics($userId){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM frequent_topics WHERE id = ?");
		$stmt->execute(array($userId));
		return $stmt->fetchAll();
	}
	
	function getUserInfo($username,$password){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
					FROM UserAcc WHERE username = ? AND password = ?");
		$stmt->execute(array($username,$password));
		return $stmt->fetch();
	}

?>