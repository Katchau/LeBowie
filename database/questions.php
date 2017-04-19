<?php
include "posts.php";

function createQuestion($userId, $title, $description, $topic, $tags) {
    global $conn;
    $lastId = createPost($userId, $description);

    $stmt = $conn->prepare("INSERT INTO Question (post_id, topic_id, title) VALUES (?, ?, ?)");
    $stmt->execute(array($lastId, $topicId, $title));

    foreach($tags as $tag) {
	addTag($lastId, $tag);
    }

    return $conn->lastInsertId();
}

function addTag($postId, $tag) {
    global $conn;
    $stmt = $conn->prepare("SELECT id FROM Tag WHERE text = ?");
    $stmt->execute(array($tag));

    if ($stmt->rowCount() == 0) {
	$stmt = $conn->prepare("INSERT INTO Tag (text) VALUES (?)");
	$stmt->execute(array(tag));
	$tagId = $conn->lastInsertId();
    } else {
	$result = $stmt->fetch();
	$tagId = $result["id"];
    }

    $stmt = $conn->prepare("INSERT INTO QuestionTag (question_id, tag_id) VALUES (?, ?)");
    $stmt->execute(array($postId, $tagId));
}
?>
