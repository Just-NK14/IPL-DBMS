<?php
$servername = "localhost:3307";
$username = "root";
$password = "";
$db_name  = "logd";
$conn = new mysqli($servername, $username, $password, $db_name);
if($conn->connect_error){
    die("connection in failed". $conn->connect_error);
}

$sql_select_passwords = "SELECT username, password FROM login";

$result = mysqli_query($conn, $sql_select_passwords);

while ($row = mysqli_fetch_assoc($result)) {
    $hashed_password = password_hash($row['password'], PASSWORD_DEFAULT);

    $sql_update_hashed_password = "UPDATE login SET hashed_password='$hashed_password' WHERE username='" . $row['username'] . "'";

    if (mysqli_query($conn, $sql_update_hashed_password)) {
        echo "Password for user '" . $row['username'] . "' hashed and updated successfully<br>";
    } else {
        echo  '<script>window.location.href = "error404.html";</script>';
    }
}

mysqli_close($conn);
?>
