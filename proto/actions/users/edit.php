<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$id = $_SESSION['userid'];
isset($_POST['email']) ? ($email = $_POST['email']) : ($email = NULL);
$password = $_POST['password'];
$firstName = $_POST['first_name'];
$lastName = $_POST['last_name'];
$description = $_POST['description'];

if ($email == NULL) {
    echo "e-mail is null";
}

//updateUser($id, $email, $password, $firstName, $lastName, $description);
//header('Location: ' . $BASE_URL . 'pages/users/?id=' . $id);
?>