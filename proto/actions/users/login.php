<?php
try{
    require_once '../../config/init.php';
    require_once $BASE_DIR .'database/users.php';

    if (!$_POST['username'] || !$_POST['password']) {
        $_SESSION['error_messages'][] = 'Invalid login';
        $_SESSION['form_values'] = $_POST;
        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit;
    }

    $username = $_POST['username'];
    $password = $_POST['password'];    
    $user = getUserInfo($username);

    if ($user != false && ($user['password'] === getHash($_POST['password'], $user['salt']))) {
        $_SESSION['username'] = $username;
        $_SESSION['userid'] = $user['id'];
        $_SESSION['sucess_messages'][] = 'Login successful';
    } else {
        $_SESSION['error_messages'][] = 'Login failed';
    }
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>