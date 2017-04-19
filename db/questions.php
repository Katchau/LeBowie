<?php
	include_once('posts.php');
	
	function getAllQuestionsTopic($topic_id){
		global $conn;
		$stmt = $conn->prepare("SELECT title, description, score
								FROM get_questions_topic
								WHERE id = ?");
		$stmt->execute(array($topic_id));
		return $stmt->fetchAll();
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

	function getUserQuestions($user_id){
		global $conn;
		$stmt = $conn->prepare("SELECT title, up_score, down_score
								FROM user_questions_best
								WHERE id = ?");
		$stmt->execute(array($user_id));
		return $stmt->fetchAll();
	}



?>