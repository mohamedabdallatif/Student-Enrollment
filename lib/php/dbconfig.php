<?php

// Replace these variables with your MySQL database credentials
$host = 'localhost';
$username = 'id20681932_studentssqlserver123';
$password = 'atxjeQ)*klWvOd7kAdPO';
$database = 'id20681932_students';

// Create a new MySQL connection
$conn = mysqli_connect($host, $username, $password, $database);
// Check for connection errors
if (mysqli_connect_errno()) {
  die('Failed to connect to MySQL: ' . mysqli_connect_error());
}

?>
