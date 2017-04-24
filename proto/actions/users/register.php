<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

if (!$_POST['first_name'] || !$_POST['last_name'] || !$_POST['display_name'] || !$_POST['email'] || !$_POST['password'] || !$_POST['password_confirmation'] || !$_POST['birth'] || !$_POST['country']) {
    $_SESSION['error_messages'][] = 'Not all fields inserted';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if ($_POST['password'] !== $_POST['password_confirmation']) {
    $_SESSION['error_messages'][] = 'Passwords are not identical';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

$success = createUser($_POST['first_name'], $_POST['last_name'], $_POST['display_name'], $_POST['email'], $_POST['password'], $_POST['birth'], $_POST['country']);

if ($success === true) {
    $user = getUser($_POST['display_name']);
    $_SESSION['username'] = $_POST['display_name'];
    $_SESSION['userid'] = $user['id'];
    $_SESSION['sucess_messages'][] = 'Register successful';
    header("Location: $BASE_URL");
    exit;
} else {
    $_SESSION['error_messages'][] = 'Error creating user';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
?>
