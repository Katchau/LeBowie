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

function getLastVoteByUserOnPost($postId, $userId) {
    global $conn;
    $stmt = $conn->prepare("SELECT action FROM activity WHERE post_id = ? AND user_id = ? AND (action = ? or action = ?) ORDER BY id DESC LIMIT 1");
    $stmt->execute(array($postId, $userId, 'Upvote', 'Downvote'));
    return $stmt->fetch()['action'];
}
?>
