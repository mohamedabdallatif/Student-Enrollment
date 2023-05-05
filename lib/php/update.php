<?php
require_once('dbconfig.php');

// Get the data to be updated
$id = $_POST['id'] ?? null;
$firstName = $_POST['firstName'] ?? null;
$lastName = $_POST['lastName'] ?? null;
$gender = $_POST['gender'] ?? null;
$dateOfBirth = $_POST['dateOfBirth'] ?? null;

// Prepare the SQL statement with placeholders for the data
$sql = "UPDATE student SET first_name=?, last_name=?, gender=?, date_of_birth=? WHERE id=?";

// Prepare the statement
$stmt = mysqli_prepare($conn, $sql);

// Bind the parameters to the statement
mysqli_stmt_bind_param($stmt, "ssssi", $firstName, $lastName, $gender, $dateOfBirth, $id);

// Execute the statement
if (mysqli_stmt_execute($stmt)) {
  // Successful update
  echo "Data updated successfully.";
} else {
  // Failed to update
  echo "Error updating data: " . mysqli_error($conn);
}

// Close the MySQL connection and statement
mysqli_stmt_close($stmt);
mysqli_close($conn);



?>