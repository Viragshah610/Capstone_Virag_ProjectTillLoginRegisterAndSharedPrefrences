<?php
 $db = mysqli_connect('localhost','root','','app');
 $name = $_POST['name'];
 $email = $_POST['email'];
 $phone = $_POST['phone'];
 $pincode = $_POST['pincode'];
 $city = $_POST['city'];
 $id = $_POST['id'];
 $sql = "UPDATE users SET name = '".$name."',email = '".$email."',phone = '".$phone."',pincode = '".$pincode."',city = '".$city."' WHERE id = '".$id."'";
 if($db->query($sql) === TRUE){
  $sql1="SELECT * FROM users WHERE id = '".$id."'";
  $result = mysqli_query($db,$sql1);
  $count = mysqli_num_rows($result);
  $data=array();
  $row=mysqli_fetch_assoc($result);
   $data=$row;
   echo json_encode($data);
   
 } 
 else{
    echo json_encode("Error");
 }

?>