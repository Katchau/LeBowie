<?php
  
  function getAllTweets() {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            ORDER BY time DESC");
    $stmt->execute();
    return $stmt->fetchAll();
  }
  
  function getUserTweets($username) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE username = ? 
                            ORDER BY time DESC");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
  }

  function createTweet($username, $tweet) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO tweets 
                            VALUES (DEFAULT, ?, ?, ?)");
    $stmt->execute(array(date('Y-m-d H:i:s'), $username, $tweet));
  }
  
  function getTweetCountAfter($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(*) AS count
                            FROM tweets 
                            WHERE id > ?");
    $stmt->execute(array($id));
    $result = $stmt->fetch();    
    return $result['count'];
  }

  function getTweetsAfter($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE id > ?
                            ORDER BY time");
    $stmt->execute(array($id));
    return $stmt->fetchAll();
  }
  //estes sao exemplos kek
  //ainda ñ testei nada pq sou pobre e ñ tenho net
  
  //secalhar tenho de por outro nome pro país
	function getUserInformation($user_id) {
		global $conn;
		$stmt = $conn->prepare("SELECT *
								FROM user_info
								WHERE id = ?");
		$stmt->execute(array($user_id));
		return $stmt->fetchAll();
	}
	
	//temos de por data de nascimento e gerar salt
	//por enquanto vou por cenas aleatorias
	//fazer um pro google
	function createUser($username, $email, $password, $first_name, $last_name, $description) {
		global $conn;
		$stmt = $conn->prepare("INSERT INTO UserAcc VALUES (?, ?, ?)");
		$stmt = $conn->prepare("INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, description) 
								VALUES (?, ?, ?, ?, ?, ?, ?, ?, DEFAULT)");
		$stmt->execute(array($username, $email, sha1($password), "salt", $first_name, $last_name, '01-01-2000', 1,$description));
	}
	
	function getAllQuestionsTopic($topic_id){
		global $conn;
		$stmt = $conn->prepare("SELECT title, description
								FROM get_questions_topic
								WHERE id = ?");
		$stmt->execute(array($topic_id));
		return $stmt->fetchAll();
	}
	
	//não me apetece fazer mais nada xD
?>
