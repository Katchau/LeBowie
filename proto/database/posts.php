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

function hasUserUpvotedPost($postId, $userId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM activity WHERE post_id = ?, user_id = ?, action = ?");
    $stmt->execute(array($postId, $userId, 'Upvote'));
    return $stmt->fetch();
}

function hasUserDownvotedPost($postId, $userId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM activity WHERE post_id = ?, user_id = ?, action = ?");
    $stmt->execute(array($postId, $userId, 'Downvote'));
    return $stmt->fetch();
}
?>
