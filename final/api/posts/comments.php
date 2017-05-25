<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/comments.php';

$method = $_SERVER['REQUEST_METHOD'];
$params = json_decode(file_get_contents('php://input'), true);
switch ($method) {
    case 'GET':
        get($_GET, $smarty);
        break;
    default:
        http_response_code(405);
}

function get($params, $smarty)
{
    $answerId = $params['answer'];
    try {        
		$comments = getComments($answerId);
		if ($comments == null || sizeof($comments)== 0) {
            http_response_code(404);
            return;
        }
		$smarty->assign('comments', $comments);
		$smarty->display('comments/list.tpl');
		
    } catch (PDOException $e) {
        echo $e->getMessage();
        http_response_code(500);
    }
}

