<?php

require_once('dbconfig.php');




$selectStatement = $_POST['selectStatement'];
$result = mysqli_query($conn, $selectStatement);


$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
  $rows[] = $row;
}
echo json_encode($rows);

// Close the MySQL connection
mysqli_close($conn);

// Encode the result as a JSON string and return it
?>
