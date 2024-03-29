<?php
function getTopics()
{
    global $conn;
    $stmt = $conn->prepare("SELECT id, topicname FROM topic");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getAllQuestionsTopic($topicId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM question_display WHERE id = ?");
    $stmt->execute(array($topicId));
    return $stmt->fetchAll();
}

function getTopicInfo($topicId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT topicname, description FROM topic WHERE id = ?");
    $stmt->execute(array($topicId));
    return $stmt->fetch();
}

function createTopic($admin_id, $topicname, $description){
    global $conn;

    try {
        $conn->beginTransaction();
        $stmt = $conn->prepare("INSERT INTO Topic (admin_id, topicname, description) VALUES (?,?,?) ");
        $stmt->execute(array($admin_id, $topicname, $description));
        $conn->commit();

    } catch (PDOException $e){
        $conn->rollBack();
        echo 'Failed: ' . $e->getMessage();
        return 0;
    }
}

function deleteTopic($topicId){
    global $conn;
    $stmt = $conn->prepare("DELETE FROM Topic WHERE id = ?");
    $stmt->execute(array($topicId));
}

function updateTopicName($topicId, $topicName){
    global $conn;
    $stmt = $conn->prepare('UPDATE topic SET topicname = ? WHERE id = ?');
    $stmt->execute(array($topicName, $topicId));
}

function updateTopicDescription($topicId, $topicDescription){
    global $conn;
    $stmt = $conn->prepare('UPDATE topic SET description = ? WHERE id = ?');
    $stmt->execute(array($topicName, $topicId));
}

function updateTopic($topicId, $newName, $newDescription){

    if ($topicId != NULL) {
        if ($nameName != NULL) {
            updateTopicName($topicId, $newName);
        }
        if ($newDescription != NULL){
            updateTopicDescription($topicId, $newDescription);
        }
    }
    else {
        echo 'Failed update';
        return 0;
    }
}



?>
