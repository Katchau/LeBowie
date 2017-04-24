<?php
    require_once '../../config/init.php';
    require_once $BASE_DIR . 'database/countries.php';
    //Get list of all countries
    $countries = getListCountries();

    $smarty->assign('countries', $countries);
    $smarty->display('user/register.tpl');
?>