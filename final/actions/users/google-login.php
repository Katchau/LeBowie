<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

if (!$_POST['email']) {
    header('Location: ' . $BASE_DIR);
    exit;
}

$email = $_POST['email'];
$user = getUserInfo($email);

if ($user != false && $user['gosogle'] === true) {
    $_SESSION['username'] = $user['username'];
        $_SESSION['userid'] = $user['id'];
        $_SESSION['success_messages'][] = 'Login successful';

        $_SESSION['moderator'] = false;
        $_SESSION['administrator'] = false;

    if ($user['user_type'] == 'Moderator') {
        $_SESSION['moderator'] = true;
    } elseif ($user['user_type'] == 'Administrator') {
        $_SESSION['moderator'] = true;
        $_SESSION['administrator'] = true;
    }
} else {
    $_SESSION['error_messages'][] = 'Login failed';
}
header('Location: ' . $BASE_DIR);
?>
