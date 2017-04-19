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

	function getUserInfo($usernameormail){
		global $conn;
		$stmt = $conn->prepare("SELECT * 
					FROM UserAcc WHERE username = ? OR email = ?");
		$stmt->execute(array($usernameoremail,$usernameoremail));
		return $stmt->fetch();
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
	
	function insertNewUser($firstname,$lastname,$username,$email,$password){
		global $conn;
		$salt = generateRandomString(8);
		$stmt = $conn->prepare('INSERT INTO UserAcc(first_name,last_name,salt,username,email,password) VALUES (?,?,?,?,?,?)');
		return $stmt->execute(array($firstname,$lastname,$salt,$username,$email,getHash($password,$salt)));
	}

?>