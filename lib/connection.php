<?php

try{
    $connection = new PDO ('mysql:host=localhost;dbname=id20681932_students	',
    'id20681932_studentssqlserver123',
    'atxjeQ)*klWvOd7kAdPO');
    $connection ->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo 'yes Connected';
}
catch(PDOException $exp){
     echo $exp ->getMessage();
     die ('could not connect');
}

?>