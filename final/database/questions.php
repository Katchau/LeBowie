<?php
require_once 'posts.php';

function getQuestionById($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM question WHERE post_id = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetch();
}

function createQuestion($userId, $title, $description, $topic, $tags)
{
    global $conn;	
	try{
	
		$conn->beginTransaction();
		$lastId = createPost($userId,$description);
		$stmt = $conn->prepare("INSERT INTO question (post_id, topic_id, title) VALUES (?, ?, ?)");
		$stmt->execute(array($lastId, $topic, $title));
		$conn->commit();
		foreach ($tags as $tag) {
			addTag($lastId, $tag);
		}
		return $lastId;
	}
	catch (PDOException $e) {
		$conn->rollBack();
        $_SESSION["error_messages"][] = $e->getMessage();
		echo "Failed: " . $e->getMessage();
		return 0;
	}

}

function getQuestionApproximateTitle($title){
	global $conn;
	$capt = ucfirst($title);
	$tit1 = substr_replace(substr_replace($title, '%', strlen($title), 0), '%', 0, 0);
	$tit2 = substr_replace(substr_replace($capt, '%', strlen($capt), 0), '%', 0, 0);
	$stmt = $conn->prepare('SELECT * FROM question_display 
							WHERE title LIKE ? or 
							title LIKE ?');
	$stmt->execute(array($tit1,$tit2));
	return $stmt->fetchAll();
}

//TODO uma opcao para poder escolher text search
function searchQuestions($title, $tags, $best, $time){
	global $conn;
	$capt = ucfirst($title);
	$tit1 = substr_replace(substr_replace($title, '%', strlen($title), 0), '%', 0, 0);
	$tit2 = substr_replace(substr_replace($capt, '%', strlen($capt), 0), '%', 0, 0);
	$statement = 'SELECT DISTINCT question_display.* from 
			(question_display left outer join QuestionTag on question_id = post_id)
			left outer join Tag on Tag.id = tag_id 
			where (title LIKE ? or title LIKE ? ) ';
	if(sizeof($tags) > 0)
		$statement = $statement . 'and ( Tag.text = ?';
	for($i = 1; $i < sizeof($tags); $i++){
		$statement = $statement . ' or Tag.text=?';
	}
	if(sizeof($tags) > 0)
		$statement = $statement . ' )';
	$statement = $statement . ' ORDER BY ';
	if($best == 'true')
		$statement = $statement . 'up_score-down_score DESC NULLS LAST, ';
	if($time == 'true')
		$statement = $statement . ' post_id';
	else $statement = $statement . ' post_id DESC NULLS LAST';
	$stmt = $conn->prepare($statement);
	$titles = array($tit1,$tit2);
	$values = array_merge((array)$titles, (array)$tags);
	$stmt->execute($values);
	return $stmt->fetchAll();
}

function getHotQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM hot_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getRecentQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM recent_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getBestQuestions()
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM top_10_questions");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getTextSearch($string)
{
    global $conn;
    $stmt = $conn->prepare("
    SELECT question_display.id,
    question_display.topicname,
    question_display.post_id,
    question_display.title,
    question_display.description,
    question_display.up_score,
    question_display.down_score,
    question_display.creation,
    question_display.user_id,
    question_display.username,
    question_display.answer,
    question_display.answer_desc,
    question_display.answer_user_id,
    question_display.answer_creation,
    question_display.answer_user_name
    FROM question_display
    JOIN first_post_instance ON question_display.post_id = first_post_instance.id
    WHERE to_tsvector('english',question_display.username || ' ' || question_display.description) @@ plainto_tsquery('english', ?);
    ");
    $stmt->execute(array($string));
    return $stmt->fetchAll();
}

function addTag($postId, $tag)
{
    global $conn;
    $stmt = $conn->prepare("SELECT id FROM tag WHERE text = ?");
    $stmt->execute(array($tag));

    $tagId = null;
    if ($stmt->rowCount() == 0) {
        $stmt = $conn->prepare("INSERT INTO tag (text) VALUES (?)");
        $stmt->execute(array($tag));
        $tagId = $conn->lastInsertId();
    } else {
        $result = $stmt->fetch();
        $tagId = $result["id"];
    }

    $stmt = $conn->prepare("INSERT INTO questiontag (question_id, tag_id) VALUES (?, ?)");
    $stmt->execute(array($postId, $tagId));
}

function getQuestionInfo($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM question_display WHERE post_id = ?");
    $stmt->execute(array($questionId));
    return $stmt->fetch();
}

function getQuestionTags($questionId)
{
    global $conn;
    $stmt = $conn->prepare("SELECT tag_id FROM questiontag WHERE question_id = ?");
    $stmt->execute(array($questionId));
    $results = $stmt->fetchAll();

    $tags = [];
    foreach ($results as $result) {
        $tagId = $result["tag_id"];
        $stmt = $conn->prepare("SELECT text FROM tag WHERE id = ?");
        $stmt->execute(array($tagId));
        $tag = $stmt->fetch()["text"];
        $tags[] = $tag;
    }
    return $tags;
}
?>