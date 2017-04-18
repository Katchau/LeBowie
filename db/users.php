<?php
	function getUser($user_name,$password){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
                            FROM UserAcc WHERE username = ?");
		$stmt->execute();
		return $stmt->fetchAll();
	}

?>