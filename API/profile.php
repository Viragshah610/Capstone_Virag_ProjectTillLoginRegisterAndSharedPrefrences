<?php
$db = mysqli_connect('localhost','root','','app');
if(!$db)
{
    echo "Database connection failed";
}
$id = $_POST['id'];
$sql = "SELECT * FROM users WHERE id ='". $id."'";
$result = mysqli_query($db,$sql);
// Return the details in JSON format
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode($row);
} else {
    echo "User not found";
}
$db->close();
?>