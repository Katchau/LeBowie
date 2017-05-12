<?php

require_once '../../config/init.php';
require_once $BASE_DIR . 'database/users.php';

function postValueOrNull($name)
{
    $value = strip_tags($_POST[$name]);
    if (!isset($value) || trim($value) == NULL) {
        return NULL;
    }
    return $value;
}

try{

    $id = $_SESSION['userid'];
    $email = postValueOrNull('email');
    $password = postValueOrNull('password');
    $firstName = postValueOrNull('first_name');
    $lastName = postValueOrNull('last_name');
	$image = postValueOrNull('userfile');
    $description = postValueOrNull('description');
	
	if($image != null){
		$target_dir = $BASE_DIR . 'images/users/';
		$target_file = $target_dir . basename($_FILES["userfile"]["name"]);
		$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
		// Check if image file is a actual image or fake image
		$check = getimagesize($_FILES["userfile"]["tmp_name"]);
		if($check !== false) {
			move_uploaded_file($_FILES["userfile"]["tmp_name"], $target_file);
		}
	}
	
    updateUser($id, $email, $password, $firstName, $lastName, $description);
    header('Location: ' . $BASE_URL . 'pages/users/?username=' . $_SESSION['username']);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>