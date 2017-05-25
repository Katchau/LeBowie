<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/countries.php';
require_once $BASE_DIR . 'database/users.php';
//Get list of all countries
$countries = getListCountries();

$email = $_POST['email'];
$first_name = $_POST['first-name'];
$last_name = $_POST['last-name'];
$image = $_POST['image'];

$user = getUserEmail($email);
if ($user != null) {
    header('Location: ' . $BASE_DIR . 'actions/users/google-login.php');
}

$smarty->assign('countries', $countries);
$smarty->assign('email', $email);
$smarty->assign('first_name', $first_name);
$smarty->assign('last_name', $last_name);
$smarty->assign('image', $image);

$smarty->display('users/register_google.tpl');
?>