<?php
require_once('connection.php');
$query = 'SELECT Id FROM student';
$stm = $db->prepare($query);
$stm->execute();
$row = $stm->fetch(PDO::FETCH_ASSOC);
echo json_encode($row);