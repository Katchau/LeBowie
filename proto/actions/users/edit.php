<?php
try{
    require_once '../../config/init.php';
    require_once $BASE_DIR . 'database/users.php';

    $id = $_SESSION['userid'];
    $email = postValueOrNull('email');
    $password = postValueOrNull('password');
    $firstName = postValueOrNull('first_name');
    $lastName = postValueOrNull('last_name');
    $description = postValueOrNull('description');

    updateUser($id, $email, $password, $firstName, $lastName, $description);
    header('Location: ' . $BASE_URL . 'pages/users/?username=' . $_SESSION['username']);

    function postValueOrNull($name)
    {
        $value = strip_tags($_POST[$name]);
        if (!isset($value) || trim($value) == NULL) {
            return NULL;
        }
        return $value;
    }
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>