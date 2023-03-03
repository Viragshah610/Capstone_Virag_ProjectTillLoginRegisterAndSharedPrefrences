<?php
$db = mysqli_connect('localhost','root','','app');
if(!$db)
{
    echo "Database connection failed";
}
$username = $_POST['username'];
$name = $_POST['name'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$pincode = $_POST['pincode'];
$city = $_POST['city'];
$password = $_POST['password'];

$sql = "SELECT username FROM users WHERE username = '".$username."'";
$result = mysqli_query($db,$sql);
$count = mysqli_num_rows($result);
if($count == 1){
    echo json_encode("Error");
}
else{
    $insert = "INSERT INTO users(username,name,email,phone,pincode,city,password) VALUES ('".$username."','".$name."','".$email."','".$phone."','".$pincode."','".$city."','".$password."')";
        $query = mysqli_query($db,$insert);
        if($query){
            echo json_encode("Success");
        }
}
?>