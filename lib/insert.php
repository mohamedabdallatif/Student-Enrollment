<?php

// include config php script to connect database
require_once('dbconfig.php');

// insert student data into table students
$sql = "INSERT INTO `student`(`First Name`, `Last Name`, `Phone`) VALUES ('Mohamed', 'Mamdouh','01024713801')";
$response = mysqli_query($conn, $sql);

// Convert the MySQL result into a JSON-encoded string
if ($response == false)
    $result = false;
else
    $result = true;

echo json_encode($result);

// Close the MySQL connection
mysqli_close($conn);

?>
