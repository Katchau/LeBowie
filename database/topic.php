<?php

	function getAllQuestionsTopic($topic_id){
		global $conn;
		$stmt = $conn->prepare("SELECT *
						FROM question_display
						WHERE id = ?");
		$stmt->execute(array($topic_id));
		return $stmt->fetchAll();
	}

	function getTopicInfo($topic_id){
		global $conn;
		$stmt = $conn->prepare("SELECT topicname, description
								FROM Topic
								WHERE id = ?");
		$stmt->execute(array($topic_id));
		return $stmt->fetch();
	}

?>