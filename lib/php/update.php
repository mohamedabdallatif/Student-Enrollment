<?php
require_once('dbconfig.php');
error_reporting(E_ALL & ~E_NOTICE);

// Get the data to be updated
$idstr = $_POST['id'] ?? null;
$id = intval($idstr)??null;
$fname = $_POST['fname'] ?? null;
$lname = $_POST['lname'] ?? null;
$date = $_POST['date'] ?? null;
$dateString = new DateTime($date);
$Address = $_POST['Address'] ?? null;
$religion = $_POST['religion'] ?? null;
$nationality = $_POST['nationality'] ?? null;
$gender = $_POST['gender'] ?? null;
$clist = $_POST['list'] ?? null;

// Prepare the SQL statement with placeholders for the data
$sql = "UPDATE test SET First_name=?, Last_name=?,Date_Of_Birth=?,Address=?,Religion=?,Nationality=?, gender=? WHERE Id=?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the parameters to the statement
mysqli_stmt_bind_param($stmt, "sssssssi", $fname, $lname,$dateString->format('Y-m-d'),$Address,$religion,$nationality ,$gender,$id);

$result = $stmt->execute();

$sql = "UPDATE mycourses SET Course_Name=? WHERE Student_Id=?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the parameters to the statement
mysqli_stmt_bind_param($stmt, "si", $clist, $id);

$result = $stmt->execute();

if ($result) {
  $response = array(
    'status' => 'success',
    'message' => 'Data Updated successfully'
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
