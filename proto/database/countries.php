<?php

function getListCountries(){
	global $conn;
	$stmt = $conn->prepare("SELECT * 
                            FROM Country
                            ORDER BY name");
	$stmt->execute();
	return $stmt->fetchAll();
}

?>