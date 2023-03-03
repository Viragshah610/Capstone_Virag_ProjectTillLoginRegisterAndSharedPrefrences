<?php
 $db = mysqli_connect('localhost','root','','app');
 $username = $_POST['username'];
 $password = $_POST['password'];
 $sql = "SELECT * FROM users WHERE username = '".$username."' AND password = '".$password."'";
 $result = mysqli_query($db,$sql);
 $count = mysqli_num_rows($result);
 $data=array();
 header('Content-Type: application/json');
 if($count == 1){
   $row=mysqli_fetch_assoc($result);
   $data=$row;
  
   echo json_encode($data);
 } 
 else{
    echo json_encode("Error");
 }
?>