<?php

// include config php script to connect database
require_once('dbconfig.php');

// Fetch data from MySQL database
$sql = "SELECT * FROM test INNER JOIN mycourses ON test.Id=mycourses.Student_Id";
$result = mysqli_query($conn, $sql);

// Convert the MySQL result into a JSON-encoded string
$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
  $rows[] = $row;
}
echo json_encode($rows);

// Close the MySQL connection
mysqli_close($conn);

?>
