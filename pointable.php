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
        margin: 0;

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

    select {
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
        font-size: 1.5em;
        padding: .4em 1.4em;
        background-color: rgba(66, 76, 105, 0.4) !important;
        color: white;
        border: 0;
        position: absolute;
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
        text-align: center;
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
    </style>


</head>

<body>

    <?php include 'navbar.html'; ?>
    <div class="head mb-1" id='table'>
        <br>
        <h1 style="color:white;">Points Table</h1>
        <br>
    </div>

    
    <div class="custom-select mt-3" id="drop">
        <select id="yearSelect" onfocus="this.size = 8" onchange="this.blur()" onblur="this.size = 1; this.blur()">
            <option value="2024" <?php if (!isset($_GET['year']) || $_GET['year'] == '2024') echo 'selected'; ?>>2024
            </option>
            <option value="2023" <?php if (isset($_GET['year']) && $_GET['year'] == '2023') echo 'selected'; ?>>2023
            </option>
            <option value="2022" <?php if (isset($_GET['year']) && $_GET['year'] == '2022') echo 'selected'; ?>>2022
            </option>
            <option value="2021" <?php if (isset($_GET['year']) && $_GET['year'] == '2021') echo 'selected'; ?>>2021
            </option>
            <option value="2020" <?php if (isset($_GET['year']) && $_GET['year'] == '2020') echo 'selected'; ?>>2020
            </option>

            <option value="2019" <?php if (!isset($_GET['year']) || $_GET['year'] == '2019') echo 'selected'; ?>>2019
            </option>
            <option value="2018" <?php if (isset($_GET['year']) && $_GET['year'] == '2018') echo 'selected'; ?>>2018
            </option>
            <option value="2017" <?php if (isset($_GET['year']) && $_GET['year'] == '2017') echo 'selected'; ?>>2017
            </option>
            <option value="2016" <?php if (isset($_GET['year']) && $_GET['year'] == '2016') echo 'selected'; ?>>2016
            </option>
            <option value="2015" <?php if (isset($_GET['year']) && $_GET['year'] == '2015') echo 'selected'; ?>>2015
            </option>

            <option value="2014" <?php if (!isset($_GET['year']) || $_GET['year'] == '2014') echo 'selected'; ?>>2014
            </option>
            <option value="2013" <?php if (isset($_GET['year']) && $_GET['year'] == '2013') echo 'selected'; ?>>2013
            </option>
            <option value="2012" <?php if (isset($_GET['year']) && $_GET['year'] == '2012') echo 'selected'; ?>>2012
            </option>
            <option value="2011" <?php if (isset($_GET['year']) && $_GET['year'] == '2011') echo 'selected'; ?>>2011
            </option>
            <option value="2010" <?php if (isset($_GET['year']) && $_GET['year'] == '2010') echo 'selected'; ?>>2010
            </option>

            <option value="2009" <?php if (isset($_GET['year']) && $_GET['year'] == '2009') echo 'selected'; ?>>2009
            </option>
            <option value="2008" <?php if (isset($_GET['year']) && $_GET['year'] == '2008') echo 'selected'; ?>>2008
            </option>
        </select>
    </div>

    <?php 
    if (isset($_GET['year'])) {
       $servername = "localhost:3307";
       $username = "root";
       $password = "";
       $database = "ipl";

       $conn = mysqli_connect($servername, $username, $password,$database);

       if($_SERVER['REQUEST_METHOD'] == 'GET')
       {
            $year = $_GET['year'];

            // Points Table Display
            $sql = "SELECT `Season`,`Rank`,`Team`,`Abbreviation`,`Matches Played`,`Matches Won`,`Matches Lost`,`No Result`,`Match Points`,`NRR` FROM `points_table` WHERE `Season` = '" . $year . "'";
            $result = mysqli_query($conn, $sql);
            echo "<div class='mb-5' style='text-align: center;'>";
            echo "<table class = 'teamtable'>
                <thead
                    <tr>
                        <th>POS</th>
                        <th>TEAM</th>
                        <th>P</th>
                        <th>W</th>
                        <th>L</th>
                        <th>NR</th>
                        <th>NRR</th>
                        <th>PTS</th>
                    </tr>
                </thead>
                <tbody>";
            while($row= mysqli_fetch_assoc($result))
            {
                echo "<tr>
                        <td>" . $row['Rank'] . "</td>
                        <td>" . $row['Team'] . "</td>
                        <td>" . $row['Matches Played'] . "</td>
                        <td>" . $row['Matches Won'] . "</td>
                        <td>" . $row['Matches Lost'] . "</td>
                        <td>" . $row['No Result'] . "</td>
                        <td>" . $row['NRR'] . "</td>
                        <td>" . $row['Match Points']."</td>
                    </tr>";
            }
            echo "</tbody></table></div>";
        }
    }else{
        echo  '<script>window.location.href = "pointable.php?year=2024";</script>';
    }
    ?>

    <script>
    document.getElementById('yearSelect').addEventListener('change', function() {
        var year = this.value;
        if (year !== '') {
            window.location.href = 'pointable.php?year=' + year; 
        }
    });
    </script>

</body>

</html>