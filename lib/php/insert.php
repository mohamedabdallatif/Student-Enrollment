<?php

require_once('dbconfig.php');
error_reporting(E_ALL ^ E_DEPRECATED ^E_NOTICE);

$fname = $_POST['fname'] ?? null;
$lname = $_POST['lname'] ?? null;
$date = $_POST['date'] ?? null;
$dateString = new DateTime($date);

$Address = $_POST['Address'] ?? null;
$religion = $_POST['religion'] ?? null;
$nationality = $_POST['nationality'] ?? null;
$gender = $_POST['gender'] ?? null;
$list = $_POST['list']??null;

$stmt = $conn->prepare("INSERT INTO test (First_Name, Last_Name,Date_Of_Birth,Address,Religion,Nationality, Gender) VALUES (?,?,?,?,?,?,?)");

$stmt->bind_param("sssssss", $fname, $lname,$dateString->format('Y-m-d'),$Address,$religion,$nationality, $gender);


$result = $stmt->execute();
$student_id =  mysqli_insert_id($conn);
$stmt = $conn->prepare("INSERT INTO mycourses (Student_Id,First_Name,Last_Name,Course_Name) VALUES (?,?,?,?)");
$stmt->bind_param("isss",$student_id,$fname,$lname,$list);
$result = $stmt->execute();

if ($result) {
  $response = array(
    'status' => 'success',
    'message' => 'Data inserted successfully'
  );
} else {
  $response = array(
    'status' => 'error',
    'message' => 'Error Updating data'
  );
}

echo json_encode($response);


$stmt->close();
$conn->close();

?>
