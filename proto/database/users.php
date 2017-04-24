<?php
function getHash($password,$salt)
{
    return hash("sha1", $password . $salt);
}

function getUserById($id) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM useracc WHERE id = ?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}
    
function getUser($username) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM UserAcc WHERE username = ?");
    $stmt->execute(array($username));
    return $stmt->fetch();
}
    
function getUserInfo($userOrEmail) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM UserAcc WHERE username = ? OR email = ?");
    $stmt->execute(array($userOrEmail,$userOrEmail));
    return $stmt->fetch();
}
    
function getUserAnswers($username) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM user_answers_best WHERE username = ?");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
}
    
function getUserQuestions($username) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM user_questions_best WHERE username = ?");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
}
    
function getUserFrequentTopics($userId) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM frequent_topics WHERE id = ?");
    $stmt->execute(array($userId));
    return $stmt->fetchAll();
}

function getUserBadges($userId) 
{
    global $conn;
    $stmt = $conn->prepare("SELECT badge_id FROM useraccbadge WHERE user_id = ?");
    $stmt->execute(array($userId));
    $badgeIds = $stmt->fetchAll();

    $badges = [];
    foreach ($badgeIds as $badgeId) {
        $stmt = $conn->prepare("SELECT * FROM badge WHERE id = ?");
        $stmt->execute(array($badgeId["badge_id"]));
        $badges[] = $stmt->fetch();
    }
    return $badges;
}
    
function generateRandomString($length) 
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}
    
function createUser($firstname, $lastname, $username, $email, $password, $birth, $country) 
{
    global $conn;
    $salt = generateRandomString(8);
    $stmt = $conn->prepare('INSERT INTO useracc (first_name, last_name, salt, username, email, password, birth, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
    $stmt->execute(array($firstname, $lastname, $salt, $username, $email, getHash($password, $salt), $birth, $country));
}

function deleteUser($userId) 
{
    global $conn;
    $stmt = $conn->prepare("DELETE FROM useracc WHERE id = ?");
    $stmt->execute(array($userId));
}

function updateUserEmail($userId, $email) 
{
    global $conn;
    $stmt = $conn->prepare('UPDATE useracc SET email = ? WHERE id = ?');
    $stmt->execute(array($email, $userId));
}

function updateUserPassword($userId, $password) 
{
    global $conn;
    $salt = generateRandomString(8);
    $stmt = $conn->prepare('UPDATE useracc SET password = ?, salt = ? WHERE id = ?');
    $stmt->execute(array(getHash($password, $salt), $salt, $userId));
}

function updateUserFirstName($userId, $firstName) 
{
    global $conn;
    $stmt = $conn->prepare('UPDATE useracc SET first_name = ? WHERE id = ?');
    $stmt->execute(array($firstName, $userId));
}

function updateUserLastName($userId, $lastName) 
{
    global $conn;
    $stmt = $conn->prepare('UPDATE useracc SET last_name = ? WHERE id = ?');
    $stmt->execute(array($lastName, $userId));
}

function updateUserDescription($userId, $description)
{
    global $conn;
    $stmt = $conn->prepare('UPDATE useracc SET description = ? WHERE id = ?');
    $stmt->execute(array($description, $userId));
}

function updateUser($userId, $email, $password, $firstName, $lastName, $description) 
{
    if ($email != NULL) {
        updateUserEmail($userId, $email);
    }
    if ($password != NULL) {
        updateUserPassword($userId, $password);
    }
    if ($firstName != NULL) {
        updateUserFirstName($userId, $firstName);
    }
    if ($lastName != NULL) {
        updateUserLastName($userId, $lastName);
    }
    if ($description != NULL) {
        updateUserDescriptin($userId, $description);
    }
}

function serializeUser($user) 
{
    $badgesObject = [];
    $badges = getUserBadges($id);
    foreach ($badges as $badge) {
        $badgesObject[] = [
            "id" => $badge["id"],
            "color" => $badge["color"],
            "text" => $badge["text"]
        ];
    }
    
    $userObject = [
        "user_id" => $user["id"],
        "username" => $user["username"],
        "email" => $user["email"],
        "first_name" => $user["first_name"],
        "last_name" => $user["last_name"],
        "country" => $user["country"],
        "description" => $user["description"],
        "image" => $user["image"],
        "score" => $user["score"],
        "badges" => $badgesObject
    ];
    
    return json_encode($userObject);
}
?>
