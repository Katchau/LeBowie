<?php
function getTopics() {
	global $conn;
	$stmt = $conn->prepare("SELECT id, topicname FROM topic");
	$stmt->execute();
	return $stmt->fetchAll();
}

function getAllQuestionsTopic($topicId){
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM question_display WHERE id = ?");
	$stmt->execute(array($topicId));
	return $stmt->fetchAll();
}

function getTopicInfo($topicId){
	global $conn;
	$stmt = $conn->prepare("SELECT topicname, description FROM topic WHERE id = ?");
	$stmt->execute(array($topicId));
	return $stmt->fetch();
}
?>
