<?php
function createPost($userId, $description) {
	echo "Preparing to insert post";

    global $conn;
    $stmt = $conn->prepare("INSERT INTO post (current_state) VALUES (?)");
    $stmt->execute(array("Published"));

	echo "Created post";

    $lastId = $conn->lastInsertId();
    $stmt = $conn->prepare("INSERT INTO postinstance (post_id, user_id, description) VALUES (?, ?, ?)");
    $stmt->execute(array($lastId, $userId, $description));

	echo "Created post instance";

    $stmt->$conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
    $stmt->execute(array($lastId, $userId, "Create"));

	echo "Created activity";
	echo "Returning postId " . $lastId;
    return $lastId;
}
?>
