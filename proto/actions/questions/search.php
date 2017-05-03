<?php
require_once "../../config/init.php";

$string = strip_tags($_GET["string"]);

header("Location: $BASE_URL" . "pages/questions/search.php");

?>