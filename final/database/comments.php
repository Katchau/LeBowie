<?php

function getComments($answerId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM comment_display WHERE answer = ?");
    $stmt->execute(array($answerId));
    return $stmt->fetchAll();
}

function createComment($userId, $answerId, $commentBody)
{
    global $conn;
    try{
        $conn->beginTransaction();
        $lastId = createPost($userId, $commentBody);
        $stmt=$conn->prepare("INSERT INTO comment (post_id, answer_id)
                                VALUES (? , ?)");
        $stmt->execute(array($lastId, $answerId));
        $conn->commit();
        return $lastId;
    } catch (PDOException $e){
        $conn->rollBack();
        echo "Failed: " . $e->getMessage();
        return 0;
    }
}
?>
