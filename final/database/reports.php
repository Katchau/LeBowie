<?php
function createReport($post_id, $user_id, $title, $content, $reason)
{
    global $conn;

    try {
        $conn->beginTransaction();
        $stmt = $conn->prepare("INSERT INTO Report (post_id, user_id, title, content, reason) VALUES (?,?,?,?,?) ");
        $stmt->execute(array($post_id, $user_id, $title, $content, $reason));
        $conn->commit();
    } catch (PDOException $e){
        $conn->rollBack();
        echo 'Failed: ' . $e->getMessage();
        return 0;
    }

}

function deleteReport($reportId)
{
    global $conn;
    $stmt = $conn->prepare("DELETE FROM report WHERE id = ?");
    $stmt->execute(array($reportId));
}

function getReport($post_id, $user_id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT id, title, content, reason, created FROM report WHERE post_id = ? AND user_id = ?");
    $stmt->execute(array($post_id, $user_id));
    return $stmt->fetchAll();
}

function getAllReports()
{
	global $conn;
    $stmt = $conn->prepare("SELECT * from all_reports order by id");
    $stmt->execute();
    return $stmt->fetchAll();
}

?>
