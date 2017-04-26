<?php
require_once 'posts.php';

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

function createAnswer($userId, $question_id, $answer_body)
{
    global $conn;
    $lastId = createPost($userId, $answer_body);

    $stmt = $conn->prepare("INSERT INTO answer (post_id, question_id) VALUES (?, ?)");
    $stmt->execute(array($lastId, $question_id));
}

function getQuestionFromAnswer($answerId){

    global $conn;

    $stmt = $conn->prepare("SELECT question FROM answer_display WHERE answer = ?");
    $stmt->execute(array($answerId));
    return $stmt->fetch();

}

function getAnswerInfo($answerId){
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM answer_display WHERE answer = ?");
    $stmt->execute(array($answerId));
    return $stmt->fetch();
}

?>
