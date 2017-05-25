<?php
try{
    require_once '../../config/init.php';
    require_once $BASE_DIR .'database/users.php';

    if (!$_POST['email']) {
        $_SESSION['error_messages'][] = 'Invalid login';
        header('Location: ' . $_SERVER['HTTP_REFERER']);
        exit;
    }

    $email = $_POST['email'];

    // TODO:
    // 1. Procurar o utilizador na base de dados, pelo email

    // SE O UTILIZADOR ESTIVER NA BASE DE DADOS:
    // 2.a. Se useracc.google == True entao fazer login e redirectonar
    // 2.b. useracc.google == False entao dar erro

    // SE O UTILIZADOR NAO ESTIVER NA BASE DE DADOS:
    // 2. Redirecionar para uma pagina com um form para escolher o nome de utilizador
    // 3. Quando esse form for submetido, criar a conta com os dados do utilizador + uma password gerada automaticamente
    
    $user = getUserInfo($username);

    if ($user != false && ($user['password'] === getHash($_POST['password'], $user['salt']))) {
        $_SESSION['username'] = $user['username'];
        $_SESSION['userid'] = $user['id'];
        $_SESSION['success_messages'][] = 'Login successful';

        $_SESSION['moderator'] = false;
        $_SESSION['administrator'] = false;

        if($user['user_type'] == 'Moderator')
            $_SESSION['moderator'] = true;
        else if ($user['user_type'] == 'Administrator'){
            $_SESSION['moderator'] = true;
            $_SESSION['administrator'] = true;
        }
    } else {
        $_SESSION['error_messages'][] = 'Login failed';
    }
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
catch(Exception $e){
    $_SESSION['error_messages'][] = 'Internal server error, try again later.';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>