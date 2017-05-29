require_once '../../config/init.php';
require_once $BASE_DIR . 'database/answers.php';

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
    $id = params['id'];
    acceptAnswer($id);
}