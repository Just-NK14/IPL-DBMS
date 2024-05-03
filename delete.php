<?php
if(isset($_GET['pos']) && isset($_GET['table'])) {
    $pos = $_GET['pos'];
    $table = $_GET['table'];

    $servername = "localhost:3307";
    $username = "root";
    $password = "";
    $database = "ipl";

    $conn = new mysqli($servername, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    $pos = mysqli_real_escape_string($conn, $pos);
    $table = mysqli_real_escape_string($conn, $table);

    $sql = "DELETE FROM `$table` WHERE POS = '$pos'";

    if ($conn->query($sql) === TRUE) {
        $sql = "CALL update_positions()";
        $conn->query($sql);

        echo "<script>
                alert('Record deleted successfully');
                window.location.href = 'admin.php';
              </script>";
    } else {
        echo "Error deleting record: " . $conn->error;
    }

    $conn->close();
} else {
    echo  '<script>window.location.href = "error404.html";</script>';
}
?>
