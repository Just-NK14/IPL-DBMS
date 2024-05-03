<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    <title>Indian Premier League Unofficial Website</title>
    <link rel="icon" type="image/x-icon" href="https://www.iplt20.com/img/favicon.ico">

    <style>
    body {
        background: rgba(16, 23, 43, 255);

    }

    body>.navbar {
        background-color: #e0ecfc !important;
    }

    .head {
        background-color: rgba(66, 76, 105, 0.2);
    }

    .head>h1 {
        margin-left: 5%;
    }

    .teamtable {
        border-collapse: collapse;
        color: white;
        font-size: 1.3em;
        min-width: 1000px;
        margin-left: auto;
        margin-right: auto;
    }

    .teamtable thead tr {
        background: rgba(224, 84, 52, 0.9);
        /* color #1 */
        color: white;
        text-align: center;
        font-weight: bold;
    }

    .teamtable th,
    .teamtable td {
        padding: 12px 15px;
        align: center;
    }

    .teamtable tbody tr {
        border-bottom: 1px solid rgba(255, 255, 247, 0.9);
        /* color #2 */
    }

    .teamtable tbody tr:nth-of-type(even) {
        background-color: rgba(255, 255, 247, 0.1);
        /* color #2 */
    }

    .teamtable tbody tr:last-of-type {
        border-bottom: 2px solid rgba(224, 84, 52, 0.9);
        /* color #1 */
    }

    select {
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        font-size: 1.5em;
        padding: .4em 1.4em;
        background-color: rgba(66, 76, 105, 0.4) !important;
        color: white;
        border: 0;
        position: relative;
        z-index: 1;
    }


    option {
        background: rgba(66, 76, 105, 0.4);
        color: white;
    }

    .custom-select {
        margin-left: 5%;
        position: relative;
        width: 200px;
        border: 0;
    }

    .row {
        margin-left: 9%;
    }
    </style>


</head>

<body>

    <?php include 'navbar.html'; ?>
    <div class="head mb-1" id='table'>
        <br>
        <h1 style="color:white;">Stats</h1>
        <br>
    </div>


<table class='row'>
    <tr>
        <td>
            <div class="custom-select mt-3 mb-3" id="drop">
                <select id="typeSelected" onchange="updateType()" onblur="this.size = 1; this.blur()">
                    <option value="batters" <?php if (!isset($_GET['type']) || $_GET['type'] == 'batters') echo 'selected'; ?>>Batters</option>
                    <option value="bowlers" <?php if (isset($_GET['type']) && $_GET['type'] == 'bowlers') echo 'selected'; ?>>Bowlers</option>
                </select>
            </div>
        </td>
        <td>
            <div class="custom-select mt-3 mb-3" id="drop">
                <select id="teamSelected" onchange="updateType()" onblur="this.size = 1; this.blur()">
                    <option value="allteams" <?php if (!isset($_GET['team']) || $_GET['team'] == 'allteams') echo 'selected'; ?>>All Teams</option>
                    <option value="CSK" <?php if (isset($_GET['team']) && $_GET['team'] == 'CSK') echo 'selected'; ?>>CSK</option>
                    <option value="DC" <?php if (isset($_GET['team']) && $_GET['team'] == 'DC') echo 'selected'; ?>>DC</option>
                    <option value="GT" <?php if (isset($_GET['team']) && $_GET['team'] == 'GT') echo 'selected'; ?>>GT</option>
                    <option value="KKR" <?php if (isset($_GET['team']) && $_GET['team'] == 'KKR') echo 'selected'; ?>>KKR</option>
                    <option value="LSG" <?php if (isset($_GET['team']) && $_GET['team'] == 'LSG') echo 'selected'; ?>>LSG</option>
                    <option value="MI" <?php if (isset($_GET['team']) && $_GET['team'] == 'MI') echo 'selected'; ?>>MI</option>
                    <option value="RR" <?php if (isset($_GET['team']) && $_GET['team'] == 'RR') echo 'selected'; ?>>RR</option>
                    <option value="RCB" <?php if (isset($_GET['team']) && $_GET['team'] == 'RCB') echo 'selected'; ?>>RCB</option>
                    <option value="SRH" <?php if (isset($_GET['team']) && $_GET['team'] == 'SRH') echo 'selected'; ?>>SRH</option>
                </select>
            </div>
        </td>
    </tr>
</table>

    <?php 
    if (isset($_GET['type']) && isset($_GET['team'])) {
       $servername = "localhost:3307";
       $username = "root";
       $password = "";
       $database = "ipl";
    
       $conn = mysqli_connect($servername, $username, $password,$database);

       $team = $_GET['team'];
       $add = '';
       if($team != 'allteams' && $team !=''){
            $add = "WHERE `Team` = '" . $team."'";
       }

       if($_SERVER['REQUEST_METHOD'] == 'GET' && $_GET['type'] == 'batters')
       {

            // Stats Batters Table
            $sql = "SELECT * FROM `batstats`". $add . "ORDER BY POS ASC LIMIT 15";
            $result = mysqli_query($conn, $sql);

            echo "<div class='mb-5' style='text-align: center;'>";
            echo "<table class = 'teamtable'>
                <thead
                    <tr>
                        <th>POS</th>
                        <th>PLAYER</th>
                        <th>TEAM</th>
                        <th>MAT</th>
                        <th>INNS</th>
                        <th>NO</th>
                        <th>RUNS</th>
                        <th>HS</th>
                        <th>AVG</th>
                        <th>BF</th>
                        <th>SR</th>
                        <th>100</th>
                        <th>50</th>
                        <th>4s</th>
                        <th>6s</th>
                    </tr>
                </thead>
                <tbody>";
            while($row= mysqli_fetch_assoc($result))
            {
                echo "<tr>
                        <td>" . $row['POS'] . "</td>
                        <td>" . $row['Player'] . "</td>
                        <td>" . $row['Team'] . "</td>
                        <td>" . $row['Mat'] . "</td>
                        <td>" . $row['Inns'] . "</td>
                        <td>" . $row['NO'] . "</td>
                        <td>" . $row['Runs'] . "</td>
                        <td>" . $row['HS']."</td>
                        <td>" . $row['Avg']."</td>
                        <td>" . $row['BF']."</td>
                        <td>" . $row['SR']."</td>
                        <td>" . $row['100']."</td>
                        <td>" . $row['50']."</td>
                        <td>" . $row['4s']."</td>
                        <td>" . $row['6s']."</td>
                    </tr>";
            }
            echo "</tbody></table></div>";
        }else{
            // Stats Bowlers Table
            $sql = "SELECT * FROM `bowlstats`". $add . "ORDER BY POS ASC LIMIT 15";
            $result = mysqli_query($conn, $sql);

            echo "<div class='mb-5' style='text-align: center;'>";
            echo "<table class = 'teamtable'>
                <thead
                    <tr>
                        <th>POS</th>
                        <th>PLAYER</th>
                        <th>TEAM</th>
                        <th>MAT</th>
                        <th>INNS</th>
                        <th>OV</th>
                        <th>RUNS</th>
                        <th>WKTS</th>
                        <th>BBI</th>
                        <th>AVG</th>
                        <th>ECOM</th>
                        <th>SR</th>
                        <th>4W</th>
                        <th>5W</th>
                    </tr>
                </thead>
                <tbody>";
            while($row= mysqli_fetch_assoc($result))
            {
                echo "<tr>
                        <td>" . $row['POS'] . "</td>
                        <td>" . $row['Player'] . "</td>
                        <td>" . $row['Team'] . "</td>
                        <td>" . $row['Mat'] . "</td>
                        <td>" . $row['Inns'] . "</td>
                        <td>" . $row['Ov'] . "</td>
                        <td>" . $row['Runs'] . "</td>
                        <td>" . $row['Wkts']."</td>
                        <td>" . $row['BBI']."</td>
                        <td>" . $row['Avg']."</td>
                        <td>" . $row['Ecom']."</td>
                        <td>" . $row['SR']."</td>
                        <td>" . $row['4w']."</td>
                        <td>" . $row['5w']."</td>
                    </tr>";
            }
            echo "</tbody></table></div>";
        }
    }else{
        echo  '<script>window.location.href = "stats.php?type=batters&team=allteams";</script>';
    }
    ?>

    <script>
    function updateType() {
        var typeSelect = document.getElementById('typeSelected');
        var teamSelect = document.getElementById('teamSelected');
        var type = typeSelect.value;
        var team = teamSelect.value;

        var url = 'stats.php?type=' + type + '&team=' + team;

        window.location.href = url;
    }
    </script>


</body>

</html>