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
        $_SESSION['username'] = $user['username'];
        $_SESSION['userid'] = $user['id'];
        $_SESSION['success_messages'][] = 'Login successful';

        $_SESSION['moderator'] = false;
        $_SESSION['administrator'] = false;

        if($user['user_type'] == 'Moderator')
            $_SESSION['moderator'] = true;
        else if ($user['user_type'] == 'Administrator'){
            $_SESSION['moderator'] = true;
            $_SESSION['administrator'] = true;
        }
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