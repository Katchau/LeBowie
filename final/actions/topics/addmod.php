<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/topic.php';
require_once $BASE_DIR . 'database/users.php';

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
    $username = postValueOrNull('username');

    $userid = getUserSessionId($username);

	
    addMod($id, $userid);
    header('Location: ' . $BASE_URL . 'pages/topic/list.php?id=' . $id);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.' . $id . $userid['id'];
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>