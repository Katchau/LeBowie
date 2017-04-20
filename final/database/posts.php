<?php
function createPost($userId, $description) {
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
?>
