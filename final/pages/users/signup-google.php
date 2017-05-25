<?php
    require_once '../../config/init.php';
    require_once $BASE_DIR . 'database/countries.php';
    require_once $BASE_DIR . 'database/users.php';
    //Get list of all countries
    $countries = getListCountries();

    $user = getUserById();
    if ($user != null) {
        header('Location: ' . $BASE_DIR . 'actions/google-login.php');
    }

    $smarty->assign('countries', $countries);
    $smarty->display('users/register_google.tpl');
?>