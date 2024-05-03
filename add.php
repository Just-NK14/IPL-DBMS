<?php
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_GET['table'])) {
    $table = $_GET['table'];

    $player = $_POST['player'];
    $team = $_POST['team'];
    $mat = $_POST['mat'];
    $inns = $_POST['inns'];

    if ($table === 'batstats') {
        $no = $_POST['no'];
        $runs = $_POST['runs'];
        $hs = $_POST['hs'];
        $bf = $_POST['BF'];
        $hundred = $_POST['100'];
        $fifty = $_POST['50'];
        $fours = $_POST['4s'];
        $sixes = $_POST['6s'];

        $sql = "INSERT INTO batstats (Player, Team, Mat, Inns, NO, Runs, HS, BF,`100`, `50`, `4s`, `6s`) 
            VALUES ('$player', '$team', '$mat', '$inns', '$no', '$runs', '$hs', '$bf','$hundred', '$fifty', '$fours', '$sixes')";
    } elseif ($table === 'bowlstats') {
        $overs = $_POST['Ov'];
        $runs = $_POST['Runs'];
        $wkts = $_POST['wkts'];
        $bbi = $_POST['bbi'];
        $avg = $_POST['Avg'];
        $ecom = $_POST['Ecom'];
        $sr = $_POST['SR'];
        $fourWickets = $_POST['4w'];
        $fiveWickets = $_POST['5w'];

        $sql = "INSERT INTO bowlstats (Player, Team, Mat, Inns, Ov, Runs, Wkts, BBI, 4w, 5w) 
                VALUES ('$player', '$team', '$mat', '$inns', '$overs', '$runs', '$wkts', '$bbi', '$fourWickets', '$fiveWickets')";
    }

    $servername = "localhost:3307";
    $username = "root";
    $password = "";
    $database = "ipl";

    $conn = new mysqli($servername, $username, $password, $database);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    if ($conn->query($sql) === TRUE) {
        $sql = "CALL update_positions()";
        $conn->query($sql);

        echo "<script>
                alert('New record created successfully');
                window.location.href = 'admin.php';
              </script>";
    } else {
        echo  '<script>window.location.href = "error404.html";</script>';
    }

    $conn->close();
} else {
    echo  '<script>window.location.href = "error404.html";</script>';
}
