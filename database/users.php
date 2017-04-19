<?php
	function getUser($username){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM UserAcc WHERE username = ?");
		$stmt->execute(array($username));
		return $stmt->fetch();
	}

	function getUserInfo($username,$password){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
					FROM UserAcc WHERE username = ? AND password = ?");
		$stmt->execute(array($username,$password));
		return $stmt->fetch();
	}

?>