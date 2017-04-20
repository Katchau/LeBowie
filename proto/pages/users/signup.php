<?php
	include_once('../../config/init.php');
	include_once($BASE_DIR . 'database/countries.php');
	//Get list of all countries
	$countries = getListCountries();

	$smarty->assign('countries',$countries);
	$smarty->display('user/register.tpl');
?>