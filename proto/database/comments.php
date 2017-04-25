<?php

function getComments($answerId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM answer_comments WHERE answer = ?");
    $stmt->execute(array($answerId));
    return $stmt->fetchAll();
}

function createComment($userId, $answerId, $commentBody){

}

?>
