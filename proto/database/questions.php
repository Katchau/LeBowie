<?php
require_once 'posts.php';

function getQuestionById($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM question WHERE post_id = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetch();
}

function createQuestion($userId, $title, $description, $topic, $tags)
{
    global $conn;	
	try{
		$conn->beginTransaction();
		$stmt = $conn->prepare("SET TRANSACTION 
				ISOLATION LEVEL REPEATABLE READ
				READ WRITE;");
		$stmt->execute();
		echo 'cenas';
		$stmt = $conn->prepare("
				INSERT INTO Post(current_state)
				VALUES ('Published');");
		$stmt->execute();
		$stmt = $conn->prepare("INSERT INTO postinstance (post_id, user_id, description)
				VALUES (currval(pg_get_serial_sequence('Post', 'id')),?,?);");
		$stmt->execute(array($userId,$description));
		$stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) 
				VALUES (currval(pg_get_serial_sequence('Post', 'id')),?,'Create');");
		$stmt->execute(array($userId));
		$stmt = $conn->prepare("INSERT INTO question (post_id, topic_id, title) 
				VALUES (currval(pg_get_serial_sequence('Post', 'id')), ?, ?);");
		$stmt->execute(array($topic, $itle));
		$conn->commit();
		foreach ($tags as $tag) {
			addTag($lastId, $tag);
		}
	}
	catch (Exception $e) {
		$conn->rollBack();
		echo "Failed: " . $e->getMessage();
	}

}

function getHotQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM hot_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getRecentQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM recent_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getBestQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM top_10_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function addTag($postId, $tag)
{
    global $conn;
    $stmt = $conn->prepare("SELECT id FROM tag WHERE text = ?");
    $stmt->execute(array($tag));

    $tagId = null;
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

function getQuestionInfo($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT id, topicname, post_id, title, description, up_score, down_score, creation, username FROM question_display WHERE post_id = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetch();
}

function getQuestionTags($questionId)
{
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