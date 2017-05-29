<?php

require_once '../../config/init.php';
require_once $BASE_DIR . 'database/topic.php';

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
    $topicname = postValueOrNull('topicname');
    $description = postValueOrNull('topicdescription');
	
    updateTopic($id, $topicname, $description);
    header('Location: ' . $BASE_URL . 'pages/topic/list?id=' . $id);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>