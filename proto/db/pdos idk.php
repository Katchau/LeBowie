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
	//ver se é preciso ter sempre o defaul incluido
	function createUser($username, $email, $password, $first_name, $last_name, $description) {
		global $conn;
		$stmt = $conn->prepare("INSERT INTO useracc (username, email, password, salt, first_name, last_name, birth, country, description, user_type) 
								VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, DEFAULT)");
		$stmt->execute(array($username, $email, sha1($password), "salt", $first_name, $last_name, date('2000-1-1 10:10:10'), 1,$description));
	}
	
	//falta fazer um para ter tags.
	function getAllQuestionsTopic($topic_id){
		global $conn;
		$stmt = $conn->prepare("SELECT *
								FROM question_display
								WHERE id = ?");
		$stmt->execute(array($topic_id));
		return $stmt->fetchAll();
	}
	
	function getAnswersQuestion($question_id){
		global $conn;
		$stmt = $conn->prepare("SELECT *
								FROM answer_display
								WHERE question = ?");
		$stmt->execute(array($question_id));
		return $stmt->fetchAll();
	}
	
	function getAnswersQuestionBest($question_id){
		global $conn;
		$stmt = $conn->prepare("SELECT *
								FROM best_answers
								WHERE question = ?");
		$stmt->execute(array($question_id));
		return $stmt->fetchAll();
	}
	
	function getCommentsAnswer($answer_id){
		global $conn;
		$stmt = $conn->prepare("SELECT description
								FROM answer_commments
								WHERE answer = ?");
		$stmt->execute(array($answer_id));
		return $stmt->fetchAll();
	}
	//em vez de ter isto tudo podiamos ter um trigger antes do insert num question, answer etc
	//que fazia insert depois disto tudo. Assim é uma javardice dos diabos
	function createPost($user_id,$description){
		global $conn;
		$stmt = $conn->prepare("INSERT INTO Post (current_state) 
								VALUES (?)");
		$stmt->execute(array('Published'));
		$last_id = $conn->lastInsertId();//vi isto no w3//ver se é o conn ou o stmt. Depois ver se precisa do "id"
		$stmt = $conn->prepare("INSERT INTO PostInstance (post_id,user_id,description) 
								VALUES (?,?,?)");
		$stmt->execute(array($last_id,$user_id,$description)); //ver se dá para fazer tudo num pedido
		$stmt = $conn->prepare("INSERT INTO Activity (post_id,user_id,action) 
								VALUES (?,?,?)");
		$stmt->execute(array($last_id,$user_id,'Create')); //ver se dá para fazer tudo num pedido
		return $last_id;
	}
	
	//once again testar isto que tenho serias duvidas xp
	function createQuestion($user_id,$topic_id,$title,$description,$tags){
		global $conn;
		$last_id = createPost($user_id,$description);
		$stmt = $conn->prepare("INSERT INTO Question (post_id,topic_id,title) 
								VALUES (?,?,?)");
		$stmt->execute(array($last_id,$topic_id,$title)); //ver se dá para fazer tudo num pedido
		foreach($tags as $tag)
			addTags($last_id,$tag);
	}
	
	//todo se for com unique o text ñ é preciso verificar x)
	function addTags($post_id,$tag){
		global $conn;
		$stmt = $conn->prepare("INSERT INTO Tag (text) 
								VALUES (?)");
		$stmt->execute(array($tag)); //ver se dá para fazer tudo num pedido
		$last_id = $conn->lastInsertId();//ver se é o conn ou o stmt. Depois ver se precisa do "id"
		$stmt = $conn->prepare("INSERT INTO QuestionTag (question_id,tag_id) 
								VALUES (?,?)");
		$stmt->execute(array($post_id, $last_id)); //ver se dá para fazer tudo num pedido
	}
	
	function createAnswer($user_id,$question_id,$description){
		global $conn;
		$last_id = createPost($user_id,$description);
		$stmt = $conn->prepare("INSERT INTO Answer (post_id,question_id) 
								VALUES (?,?)");
		$stmt->execute(array($last_id,$question_id)); //ver se dá para fazer tudo num pedido
	}
	
	function createComment($user_id,$answer_id,$description){
		global $conn;
		$last_id = createPost($user_id,$description);
		$stmt = $conn->prepare("INSERT INTO AnswerComment (post_id,answer_id) 
								VALUES (?,?)");
		$stmt->execute(array($last_id,$answer)); //ver se dá para fazer tudo num pedido
	}
	
	//se up for false = downvote
	function createVote($user_id,$post_id,$up){
		global $conn;
		$vote = ($up) ? 'Upvote' : 'Downvote';
		$stmt = $conn->prepare("INSERT INTO Activity (post_id,user_id,action) 
								VALUES (?,?,?)");
		$stmt->execute(array($post_id,$user_id,$vote));
	}
	
	function getUserQuestions($user_id){
		global $conn;
		$stmt = $conn->prepare("SELECT title, up_score, down_score
								FROM user_questions_best
								WHERE id = ?");
		$stmt->execute(array($user_id));
		return $stmt->fetchAll();
	}
	
	function getUserNumberAnswers($user_id){
		global $conn;
		$stmt = $conn->prepare("SELECT total
								FROM user_answer_count
								WHERE id = ?");
		$stmt->execute(array($user_id));
		$result = $stmt->fetch();
		return $result['total'];
	}
	
	function getUserSelectedNumberAnswers($user_id){
		global $conn;
		$stmt = $conn->prepare("SELECT total
								FROM user_selected_count
								WHERE id = ?");
		$stmt->execute(array($user_id));
		$result = $stmt->fetch();
		return $result['total'];
	}
	
	function getUserAnswers($user_id){
		//l8
	}
	
	function getUserBestAnswers($user_id){
		//l7
	}
	//não me apetece fazer mais nada xD
?>
