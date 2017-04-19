<?php
	function getUser($user_name,$password){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM UserAcc WHERE username = ?");
		$stmt->execute();
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