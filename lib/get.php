<?php
require_once('connection.php');
try
{
    $query_statement = "SELECT Id FROM student";
    $query_response = $pdo->query($query_statement)->fetch(PDO::FETCH_ASSOC);
    if($qres === true) json_encode($query_response);
}
catch(PDOException $e)
{
    echo $e->getMessage();
}
?>
