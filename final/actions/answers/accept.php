<?php

require_once $BASE_DIR . "database/answers.php";

$answers_id = strip_tags($_POST("id"));

acceptAnswer($answer_id);
header("Location: $BASE_URL" . "pages/questions/index.php?id=" . $question_id);

 ?>
