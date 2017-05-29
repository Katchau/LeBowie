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
    $userid = postValueOrNull('userid');
	
    if(removeMod($id, $userid)){
        $_SESSION['success_messages'][] = 'Successfully removed mod.';
    }else{
        $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    }
    header('Location: ' . $BASE_URL . 'pages/topic/list.php?id=' . $id);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>