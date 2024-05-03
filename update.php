<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_GET['pos'])) {
        $pos = $_GET['pos'];

        if (isset($_GET['table'])) {
            $table = $_GET['table'];

            $servername = "localhost:3307";
            $username = "root";
            $password = "";
            $database = "ipl";

            $conn = new mysqli($servername, $username, $password, $database);

            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            if ($table === 'batstats') {
                $sql = "UPDATE `batstats` SET Player='". $_POST['player']."', Team='". $_POST['team']."', Mat=". $_POST['mat'].", Inns=". $_POST['inns'].", NO=". $_POST['no'].", Runs=". $_POST['runs'].", HS='". $_POST['hs']."', BF=". $_POST['BF'].", `100`=". $_POST['100'].", `50`=". $_POST['50'].", `4s`=". $_POST['4s'].", `6s`=". $_POST['6s']." WHERE POS=". $pos;
            } elseif ($table === 'bowlstats') {
                $sql = "UPDATE `bowlstats` SET Player='". $_POST['player']."',Team='". $_POST['team']."',Mat=". $_POST['mat'].",Inns=". $_POST['inns'].",Ov=". $_POST['Ov'].",Runs=". $_POST['Runs'].",Wkts=". $_POST['wkts'].",BBI='". $_POST['bbi']."',`4w`=". $_POST['4w'].",`5w`=". $_POST['5w']." WHERE POS=". $pos;

            }

            if ($conn->query($sql) === TRUE) {
                $sql = "CALL update_positions()";
                $conn->query($sql);

                echo "<script>
                alert('Record updated successfully');
                window.location.href = 'admin.php';
              </script>";

            } else {
                echo "Error updating record: " . $conn->error;
            }

            $conn->close();
        }
    }
}else{
    echo  '<script>window.location.href = "error404.html";</script>';
}
?>
