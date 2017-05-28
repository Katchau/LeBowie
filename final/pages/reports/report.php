<?php
require_once '../../config/init.php';
require_once $BASE_DIR . 'database/questions.php';

$postId = $_GET['id'];
$questionId = $_GET['question'];

// TODO: A estrategia para saber se estamos a reportar uma pergunta e comparar
// o postId com o questionId. Caso sejam iguais então trata-se de um report a uma
// pergunta, logo deve imprimir-se nao so o conteudo mas tambem o titulo da pergunta
// Caso contrário, trata-se de um report a um comentario ou a uma resposta, pelo
// que apenas e preciso imprimir o conteudo

if ($postId == $questionId) {
    $question = getQuestionInfo($questionId);
    $smarty->assign('question', $question);
} else {
    $content = getPostById($postId);
    $smarty->assign('content', $content);
}

$smarty->assign('post_id', $postId);
$smarty->assign('question_id', $questionId);
$smarty->display('reports/report.tpl');
?>