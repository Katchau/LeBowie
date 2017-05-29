<?php
function getTopics()
{
    global $conn;
    $stmt = $conn->prepare("SELECT id, topicname FROM topic");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getAllQuestionsTopic($topicId, $offset, $limit)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM question_display WHERE id = ? LIMIT ? OFFSET ?");
    $stmt->execute(array($topicId,$offset,$limit));
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
    $stmt->execute(array($topicDescription, $topicId));
}

function updateTopic($topicId, $newName, $newDescription){

    if ($topicId != NULL) {
        if ($newName != NULL) {
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

function getTopicMods($topicId){
    if ($topicId != NULL){
        global $conn;
        $stmt = $conn->prepare(
        "SELECT UserAcc.id, UserAcc.username 
        FROM UserAcc INNER JOIN TopicUserAcc 
        ON UserAcc.id = TopicUserAcc.mod_id WHERE TopicUserAcc.topic_id = ?");
        $stmt->execute(array($topicId));
        return $stmt->fetchAll();
    }
}

function addMod($topicId, $userId){
    if ($topicId != NULL && $userId != NULL){
        global $conn;
        $stmt = $conn->prepare("INSERT INTO TopicUserAcc (mod_id, topic_id) VALUES (?,?) ");
        $stmt->execute(array($userId, $topicId));
    }
}

function removeMod($topicId, $userId) {
    if ($topicId != NULL && $userId != NULL){
        global $conn;
        $stmt = $conn->prepare("DELETE FROM TopicUserAcc WHERE mod_id = ? AND topic_id = ?");
        $stmt->execute(array($userId, $topicId));   
    }
}


?>
