<?php
require_once('dbconfig.php');

$idstr = $_POST['id']??null;
$id = intval($idstr);
$sql = "DELETE FROM test WHERE id=?";

// Prepare the query statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the ID parameter to the prepared statement
mysqli_stmt_bind_param($stmt, "i", $id);

$result = $stmt->execute();

$sql = "DELETE FROM mycourses WHERE Student_Id=?";

// Prepare the query statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the ID parameter to the prepared statement
mysqli_stmt_bind_param($stmt, "i", $id);

$result = $stmt->execute();

if ($result) {
  $response = array(
    'status' => 'success',
    'message' => 'Student Deleted successfully'
  );
} else {
  $response = array(
    'status' => 'error',
    'message' => 'Error Deleted data'
  );
}

echo json_encode($response);

$stmt->close();
$conn->close();

?>