
<?php
$dns = 'mysql:host=localhost;dbname=id20681932_students';
$user = 'id20681932_studentssqlserver123';
$password = 'atxjeQ)*klWvOd7kAdPO';
try{
 $db = new PDO ($dns, $user, $pass);
}catch( PDOException $e){
 $error = $e->getMessage();
 echo $error;
}
?>