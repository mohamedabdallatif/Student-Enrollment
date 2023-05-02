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

// Fetch data from MySQL database
$sql = "SELECT * FROM your_table";
$result = mysqli_query($conn, $sql);

// Convert the MySQL result into a JSON-encoded string
$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
  $rows[] = $row;
}
echo json_encode($rows);

// Close the MySQL connection
mysqli_close($conn);

/*
require_once('connection.php');
try
{
    $query_statement = "SELECT Id FROM student";
    $query_response = $pdo->query($query_statement)->fetch(PDO::FETCH_ASSOC);
    if($qres === true) json_encode($query_response);
}
catch(PDOException $e)
{
    echo $e->getMessage();
} 
?>
*/


