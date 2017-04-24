<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

$id = $_SESSION['userid'];
$email = postValueOrNull('email');
$password = postValueOrNull('password');
$firstName = postValueOrNull('first_name');
$lastName = postValueOrNull('last_name');
$description = postValueOrNull('description');

echo "The new description is $description";

updateUser($id, $email, $password, $firstName, $lastName, $description);
//header('Location: ' . $BASE_URL . 'pages/users/?username=' . $_SESSION['username']);

function postValueOrNull($name)
{
    $value = strip_tags($_POST[$name]);
    echo "The value for $name is $value";
    if (!isset($value) || trim($value) == NULL) {
        return NULL;
    }
    return $value;
}
?>