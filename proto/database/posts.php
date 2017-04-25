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

function getLastVoteByUserOnPost($postId, $userId) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT action FROM activity WHERE post_id = ? AND user_id = ? AND (action = ? or action = ?) ORDER BY id DESC LIMIT 1");
    $stmt->execute(array($postId, $userId, 'Upvote', 'Downvote'));
    return $stmt->fetch()['action'];
}

function upvotePost($postId, $userId)
{
    // TODO: Isto devia ser uma transação
    global $conn;
    $lastVote = getLastVoteByUserOnPost($postId, $userId);
    if ($lastVote != 'Upvote') {
        if ($lastVote) {
            $stmt = $conn->prepare("UPDATE post SET down_score = down_score - 1 WHERE id = ?");
            $stmt->execute(array($postId));
        }
        $stmt = $conn->prepare("UPDATE post SET up_score = up_score + 1 WHERE id = ?");
        $stmt->execute(array($postId));
        
        $stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
        $stmt->execute(array($postId, $userId, 'Upvote'));
    }
    return $lastVote;
}

function downvotePost($postId, $userId)
{
    // TODO: Isto devia ser uma transação
    global $conn;
    $lastVote = getLastVoteByUserOnPost($postId, $userId);
    if ($lastVote != 'Downvote') {
        if ($lastVote) {
            $stmt = $conn->prepare("UPDATE post SET up_score = up_score - 1 WHERE id = ?");
            $stmt->execute(array($postId));
        }
        $stmt = $conn->prepare("UPDATE post SET down_score = down_score + 1 WHERE id = ?");
        $stmt->execute(array($postId));
        
        $stmt = $conn->prepare("INSERT INTO activity (post_id, user_id, action) VALUES (?, ?, ?)");
        $stmt->execute(array($postId, $userId, 'Downvote'));
        return true;
    }
    return false;
}
?>
