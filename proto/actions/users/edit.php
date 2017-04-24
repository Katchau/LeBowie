<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$id = $_SESSION['userid'];
$email = (isset($_POST['email']) ? $_POST['email'] : null);
$password = $_POST['password'];
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$description = $_POST['description'];

if ($email === null) {
    echo "e-mail is null";
}

//updateUser($id, $email, $password, $firstName, $lastName, $description);
//header('Location: ' . $BASE_URL . 'pages/users/?id=' . $id);
?>