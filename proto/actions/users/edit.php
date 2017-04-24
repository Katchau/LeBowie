<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$id = $_SESSION['id'];
echo $id;
$email = $_POST['email'];
$password = $_POST['password'];
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$description = $_POST['description'];

updateUser($id, $email, $password, $firstName, $lastName, $description);
//header('Location: ' . $BASE_URL . 'pages/users/?id=' . $id);
?>