<?php
function createPost($userId, $description) 
{
    global $conn;
    $stmt = $conn->prepare("SET TRANSACTION ISOLATION LEVEL READ COMMITTED READ WRITE");
	$stmt->execute();
	$stmt = $conn->prepare("
			INSERT INTO Post(current_state)
			VALUES (?)");
	$stmt->execute(array('Published'));
	$lastId = $conn->lastInsertId();
	$stmt = $conn->prepare("INSERT INTO postinstance (post_id, user_id, description)
			VALUES (?,?,?)");
	$stmt->execute(array($lastId,$userId,$description));
	$stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) 
			VALUES (?,?,?)");
	$stmt->execute(array($lastId,$userId,"Create"));
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

	$stmt = $conn->prepare("SET TRANSACTION ISOLATION LEVEL SERIALIZABLE READ WRITE");
	$stmt->execute();
	
	$stmt = $conn->prepare("DELETE FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute(array($postId, $userId, 'Downvote'));

	$stmt = $conn->prepare("SELECT * FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute(array($postId, $userId, 'Upvote'));
	$results = $stmt->fetchAll();

	if (count($results) == 0) {
		$stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
		$stmt->execute(array($postId, $userId, 'Upvote'));
		$ret = true;
	}

	$conn->commit();
    return $ret;
}

function downvotePost($postId, $userId)
{
    global $conn;
	$ret = false;

	$conn->beginTransaction();

	$stmt = $conn->prepare("SET TRANSACTION ISOLATION LEVEL SERIALIZABLE READ WRITE");
	$stmt->execute();

	$stmt = $conn->prepare("DELETE FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute(array($postId, $userId, 'Upvote'));

	$stmt = $conn->prepare("SELECT * FROM activity WHERE post_id = ? AND user_id = ? AND action = ?");
	$stmt->execute(array($postId, $userId, 'Downvote'));
	$results = $stmt->fetchAll();

	if (count($results) == 0) {
		$stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
		$stmt->execute(array($postId, $userId, 'Downvote'));
		$ret = true;
	}
        
	$conn->commit();
	return $ret;
}

function updatePost($postId, $userId, $description) 
{
	global $conn;
	$conn->beginTransaction();

	$stmt = $conn->prepare("SET TRANSACTION ISOLATION LEVEL READ COMMITED READ WRITE");

	$stmt = $conn->prepare("INSERT INTO postinstance (post_id, user_id, description) VALUES (?, ?, ?)");
	$stmt->execute(array($postId, $userId, $description));

	$postContentId = $conn->lastInsertId();

	$stmt = $conn->prepare("INSERT INTO activity (post_id, post_content_id, user_id, action) VALUES (?, ?, ?, ?)");
	$stmt->execute(array($postId, $postContentId, $userId, 'Update'));

	$conn->commit();
}

function getLatestPostInstance($postId) 
{
	global $conn;	
	$stmt = $conn->prepare("SELECT * FROM postinstance WHERE post_id = ? ORDER BY id DESC LIMIT 1");
	$stmt->execute(array($postId));
	return $stmt->fetch();
}
?>
