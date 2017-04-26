<?php
function createPost($userId, $description) 
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO post (current_state) VALUES (?)");
    $stmt->execute(array("Published"));

    $lastId = $conn->lastInsertId();
    $stmt = $conn->prepare("INSERT INTO postinstance (post_id, user_id, description) VALUES (?, ?, ?)");
    $stmt->execute(array($lastId, $userId, $description));

    $stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
    $stmt->execute(array($lastId, $userId, "Create"));
    return $lastId;
}

function getPostById($postId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM post WHERE id = ?");
    $stmt->execute(array($postId));
    return $stmt->fetch();    
}

function upvotePost($postId, $userId)
{
    global $conn;
	$ret = false;
        
	$conn->beginTransaction();

	//$stmt = $conn->prepare("BEGIN");
	//$stmt->execute();
	$stmt = $conn->prepare("SET TRANSACTION ISOLATION LEVEL SERIALIZABLE READ WRITE");
	$stmt->execute();
	
	$stmt = $conn->prepare("DELETE FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute(array($postId, $userId, 'Downvote'));

	$stmt = $conn->prepare("SELECT * FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute($postId, $userId, 'Upvote');
	$results = $stmt->fetchAll();

	if (count($results) == 0) {
		$stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
		$stmt->execute(array($postId, $userId, 'Upvote'));
		$ret = true;
	}

	$conn->commit();

    return $ret; //TODO nao sei para que isto serve :)
}

function downvotePost($postId, $userId)
{
    //WIP
    global $conn;
        
	$stmt = $conn->prepare("
	BEGIN;
	SET TRANSACTION 
	ISOLATION LEVEL SERIALIZABLE
	READ WRITE;
	
	DELETE FROM activity
	WHERE post_id = ?
	AND user_id = ?
	AND action = ?;
	
	INSERT INTO activity (post_id, user_id, action) 
	SELECT ?, ?, ?
	WHERE NOT EXISTS(
		SELECT post_id, user_id, action
		FROM Activity
		WHERE post_id = ?
		AND user_id = ?
		AND action = ?
	);
	COMMIT;
	");
	$stmt->execute(array($postId, $userId, 'Upvote', $postId, $userId, 'Downvote', $postId, $userId, 'Downvote'));
    return true; //TODO nao sei para que isto serve :)
}
?>
