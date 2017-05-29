<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/reports.php';

$method = $_SERVER['REQUEST_METHOD'];
$params = json_decode(file_get_contents('php://input'), true);
switch ($method) {
    case 'GET':
        get($_GET);
        break;
    default:
        http_response_code(405);
}

function get($params)
{
    $reportId = $params['id'];
    try {        
		deleteReport($reportId);
		echo 1;
    } catch (PDOException $e) {
        echo $e->getMessage();
        http_response_code(500);
    }
}

