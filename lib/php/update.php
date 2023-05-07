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
$sql = "UPDATE test SET test.First_name=?, test.Last_name=?, test.Date_Of_Birth=?, test.Address=?, test.Religion=?, test.Nationality=?, test.gender=? WHERE test.Id=?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the parameters to the statement
mysqli_stmt_bind_param($stmt, "sssssssi", $fname, $lname,$dateString->format('Y-m-d'),$Address,$religion,$nationality ,$gender,$id);

$result = $stmt->execute();

$sql = "UPDATE mycourses SET mycourses.First_Name=?, mycourses.Last_Name=?, mycourses.Course_Name=? WHERE mycourses.Student_Id=?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the parameters to the statement
mysqli_stmt_bind_param($stmt, "sssi", $fname, $lname, $clist, $id);

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
