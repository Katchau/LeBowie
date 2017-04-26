<?php
try{
    require_once '../../config/init.php';  
    session_destroy();
    header('Location: ' . $BASE_URL);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>