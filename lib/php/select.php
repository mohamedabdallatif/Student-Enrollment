<?php
require_once('dbconfig.php');

$selectStatement = $_POST['selectStatement'] ?? null;
$val = $_POST['val'] ?? null;
$sort = $_POST['sort'] ??null;

if (!$selectStatement || !$val ||!$sort) {
  die('Missing parameters');
}

$sql = "SELECT * FROM test
INNER JOIN mycourses ON test.Id=mycourses.Student_Id
 WHERE $selectStatement = ?
ORDER BY $sort";

$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "s", $val);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

$rows = array();
while ($row = mysqli_fetch_assoc($result)) {
  $rows[] = $row;
}
echo json_encode($rows);

mysqli_stmt_close($stmt);
mysqli_close($conn);

?>