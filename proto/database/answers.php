<?php

function getRecentAnswers($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM answer_display WHERE question = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetchAll();
}

function getBestAnswers($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM best_answers WHERE question = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetchAll();
}

function getSelectedAnswer($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM selected_answer WHERE question = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetchAll();
}

?>
