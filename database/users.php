<?php

	function getHash($password,$salt){
		return hash("sha1",$password . $salt);
	}
	
	function getUser($username){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM user_info WHERE username = ?");
		$stmt->execute(array($username));
		return $stmt->fetch();
	}
	
	function getUserInfo($userOrEmail){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM user_info WHERE username = ? OR email = ?");
		$stmt->execute(array($userOrEmail,$userOrEmail));
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
	
	
	function generateRandomString($length) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
	
	function insertNewUser($firstname,$lastname,$username,$email,$password,$birth,$country){
		global $conn;
		$salt = generateRandomString(8);
		$stmt = $conn->prepare('INSERT INTO UserAcc(first_name,last_name,salt,username,email,password,birth,country) VALUES (?,?,?,?,?,?,?,?)');
		return $stmt->execute(array($firstname,$lastname,$salt,$username,$email,getHash($password,$salt),$birth,$country));
	}

?>