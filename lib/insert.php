<?php

// include config php script to connect database
require_once('dbconfig.php');

// get student data from requested url query
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $fname = $_GET['fname'];
    $lname = $_GET['lname'];
    $dateofbirth = date_format($_GET['dateofbirth'], "Y-m-d");
    $address = $_GET['address'];
    $religion = $_GET['religion'];
    $nationality = $_GET['nationality'];
    $gender = $_GET['gender'];
}
else{
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $dateofbirth = date_format($_POST['dateofbirth'], "Y-m-d");
    $address = $_POST['address'];
    $religion = $_POST['religion'];
    $nationality = $_POST['nationality'];
    $gender = $_POST['gender'];
}
// insert student data into table students
$sql = "INSERT INTO `student`(`First Name`, `Last Name`, `Date Of Birth`, `Address`, `Religion`, `Nationality`, `Gender`) VALUES ('$fname', '$lname','$dateofbirth', '$address', '$religion', '$nationality', '$gender')";
$response = mysqli_query($conn, $sql);

// Convert the MySQL result into a JSON-encoded string
if ($response == false || mysqli_error($conn) !== null)
    $result = false;
else
    $result = true;

echo json_encode($result);

// Close the MySQL connection
mysqli_close($conn);

?>
