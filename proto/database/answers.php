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
	try{
		$conn->beginTransaction();
		$lastId = createPost($userId,$description);
		$stmt = $conn->prepare("INSERT INTO answer (post_id, question_id) 
								VALUES (?, ?)");
		$stmt->execute(array($lastId, $question_id));
		$conn->commit();
		return $lastId;
	}
	catch (PDOException $e) {
		$conn->rollBack();
		echo "Failed: " . $e->getMessage();
		return 0;
	}
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
