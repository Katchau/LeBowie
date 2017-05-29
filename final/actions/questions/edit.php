<?php

require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';
require_once $BASE_DIR . 'database/topics.php';

function postValueOrNull($name)
{
    $value = strip_tags($_POST[$name]);
    if (!isset($value) || trim($value) == NULL) {
        return NULL;
    }
    return $value;
}

try{

    $id = postValueOrNull('id');
    $questiontitle = postValueOrNull('questiontitle');
    $questiondescription = postValueOrNull('questiondescription');
    $userId = postValueOrNull('userId');
    $questionTopic = getTopicByName(postValueOrNull('questionTopic'));

	// $id, $userId, $newTitle, $newDesc, $topic
    $newId = updateQuestion($id, $userId, $questiontitle, $questiondescription, $questionTopic);
    header('Location: ' . $BASE_URL . 'pages/questions/index.php?id=' . $newId);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>