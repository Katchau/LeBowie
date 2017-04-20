<?php
include "posts.php";

function createQuestion($userId, $title, $description, $topic, $tags) {
	global $conn;
	$lastId = createPost($userId, $description);

	$stmt = $conn->prepare("INSERT INTO question (post_id, topic_id, title) VALUES (?, ?, ?)");
	$stmt->execute(array($lastId, $topic, $title));

	foreach($tags as $tag) {
		addTag($lastId, $tag);
	}
}

function getHotQuestions(){
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM hot_questions");
	$stmt->execute();
	return $stmt->fetchAll();
}

function getRecentQuestions(){
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM recent_questions");
	$stmt->execute();
	return $stmt->fetchAll();
}

function getBestQuestions(){
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM top_10_questions");
	$stmt->execute();
	return $stmt->fetchAll();
}

function addTag($postId, $tag) {
	global $conn;
	$stmt = $conn->prepare("SELECT id FROM tag WHERE text = ?");
	$stmt->execute(array($tag));

	$tagId = NULL;
	if ($stmt->rowCount() == 0) {
		$stmt = $conn->prepare("INSERT INTO tag (text) VALUES (?)");
		$stmt->execute(array($tag));
		$tagId = $conn->lastInsertId();
	} else {
		$result = $stmt->fetch();
		$tagId = $result["id"];
	}
	
	$stmt = $conn->prepare("INSERT INTO questiontag (question_id, tag_id) VALUES (?, ?)");
	$stmt->execute(array($postId, $tagId));
}

function getQuestionInfo($questionId) {
	global $conn;
	$stmt = $conn->prepare("SELECT id, topicname, post_id, title, description, up_score, down_score, creation, username FROM question_display WHERE post_id = ?");
	$stmt->execute(array($questionId));
	return $stmt->fetch();
}

function getQuestionTags($questionId) {
	global $conn;
	$stmt = $conn->prepare("SELECT tag_id FROM questiontag WHERE question_id = ?");
	$stmt->execute(array($questionId));
	$results = $stmt->fetchAll();

	$tags = [];
	foreach ($results as $result) {
		$tagId = $result["tag_id"];
		$stmt = $conn->prepare("SELECT text FROM tag WHERE id = ?");
		$stmt->execute(array($tagId));
		$tag = $stmt->fetch()["text"];
		$tags[] = $tag;
	}
	return $tags;
}
?>