<?php

require_once('dbconfig.php');
error_reporting(E_ALL & ~E_NOTICE);

$fname = $_POST['fname'] ?? null;
$lname = $_POST['lname'] ?? null;
$date = $_POST['date'] ?? null;
$dateString = new DateTime($date);

$Address = $_POST['Address'] ?? null;
$religion = $_POST['religion'] ?? null;
$nationality = $_POST['nationality'] ?? null;

$gender = $_POST['gender'] ?? null;



$stmt = $conn->prepare("INSERT INTO student (First_Name, Last_Name,Date_Of_Birth,Address,Religion,Nationality, Gender) VALUES (?,?,?,?,?,?,?)");
$stmt->bind_param("sssssss", $fname, $lname,$dateString->format('Y-m-d'),$Address,$religion,$nationality, $gender);

$result = $stmt->execute();

if ($result) {
  $response = array(
    'status' => 'success',
    'message' => 'Data inserted successfully'
  );
} else {
  $response = array(
    'status' => 'error',
    'message' => 'Error inserting data'
  );
}

echo json_encode($response);

$stmt->close();
$conn->close();

?>
