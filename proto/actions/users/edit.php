<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$id = $_SESSION['userid'];
isset($_POST['email']) ? ($email = $_POST['email']) : ($email = NULL);
isset($_POST['password']) ? ($password = $_POST['password']) : ($password = NULL);
isset($_POST['first_name']) ? ($firstName = $_POST['first_name']) : ($firstName = NULL);
isset($_POST['last_name']) ? ($lastName = $_POST['last_name']) : ($lastName = NULL);
isset($_POST['description']) ? ($description = $_POST['description']) : ($description = $_POST['description']);

updateUser($id, $email, $password, $firstName, $lastName, $description);
header('Location: ' . $BASE_URL . 'pages/users/?id=' . $id);
?>