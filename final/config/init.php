<?php
  session_set_cookie_params(3600, '/~lbaw1651');
  session_start();

  error_reporting(E_ERROR | E_WARNING); // E_NOTICE by default

  $BASE_DIR = '/opt/lbaw/lbaw1651/public_html/final/';
  $BASE_URL = '/~lbaw1651/final/';

  $conn = new PDO('pgsql:host=dbm;dbname=lbaw1651', 'lbaw1651', 'cr62rv74');
  $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $conn->exec('SET SCHEMA \'public\''); //FIXME?

  require_once $BASE_DIR . 'lib/smarty/Smarty.class.php';
  
  $smarty = new Smarty;
  $smarty->template_dir = $BASE_DIR . 'templates/';
  $smarty->compile_dir = $BASE_DIR . 'templates_c/';
  $smarty->assign('BASE_URL', $BASE_URL);
  
if (is_null($DEF_TOPIC)) {
    
    include $BASE_DIR . 'database/topic.php';
    $headerTopics = getTopics();
    
    $DEF_TOPIC = $headerTopics[0]['topicname'];    
    $smarty->assign('DEF_TOPIC', $DEF_TOPIC);
    $smarty->assign('headerTopics', $headerTopics);
    
}
  
  $smarty->assign('ERROR_MESSAGES', $_SESSION['error_messages']);  
  $smarty->assign('FIELD_ERRORS', $_SESSION['field_errors']);
  $smarty->assign('SUCCESS_MESSAGES', $_SESSION['success_messages']);
  $smarty->assign('FORM_VALUES', $_SESSION['form_values']);
  $smarty->assign('USERNAME', $_SESSION['username']);
  $smarty->assign('USERID', $_SESSION['userid']);
  
  unset($_SESSION['success_messages']);
  unset($_SESSION['error_messages']);  
  unset($_SESSION['field_errors']);
  unset($_SESSION['form_values']);
?>
