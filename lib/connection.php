<?php
$dns = "mysql:host=localhost;dbname=id20681932_students";
$user = "id20681932_studentssqlserver123";
$password = "atxjeQ)*klWvOd7kAdPO";
$options = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8",);

try {
    $pdo = new PDO("$dns", "$user", "$password", $options);
    echo "Connection Response: Database is Connected Successfully";
} catch (PDOException $e) {
    echo "Connection Response: An Error Happen Within Connecting DataBase... try another time";
}
?>
