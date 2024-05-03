<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="style.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <link href="teamcard.css" rel="stylesheet">

    <title>Indian Premier League Unofficial Website</title>
    <link rel="icon" type="image/x-icon" href="https://www.iplt20.com/img/favicon.ico">

    <style>
    body {
        background: rgba(16, 23, 43, 1);

    }

    body>.navbar {
        background-color: #e0ecfc !important;
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

    .list-group-item {
        background-color: transparent; 
        background-color: rgba(66, 76, 105,0.2);
        border-color: color; 
        color: white;
        font-size:14px;
        /* font-weight:bold; */
        border-radius:15px 0px;
    }

    .list-group{
        min-width:350px;
        max-height:140px;
    }

    .detailtable{
        border-collapse: collapse;
        color: white;
        font-size: 1.3em;
        min-width: 1000px;
        margin-left: auto;
        margin-right: auto;
    }

    .site{
        opacity:0.7;
        border-radius: 50px 15px;
        left-margin: 100px;
        transform: translateX(5%);
    }

    .site:hover{
        opacity:1;
    }
    </style>

</head>

<body>

    <?php include 'navbar.html'; ?>
    <center>
        <img class="mt-4" src="https://www.iplt20.com/assets/images/IPL_LOGO_CORPORATE_2024.png" alt="..."
            width="145.49" height="90">
    </center>

    <!-- Main grid -->
    <div class="row row-cols-1 row-cols-md-4 g-4 mt-4 mx-5">

        <div class="col">
            <a href="teams.php?team=CSK#teamtable">
                <div class="rounded csk">
                    <img class="teamcards" src="img\cskcard.png" alt="..." width='300' height='300'>
                </div>
            </a>
        </div>

        <div class="col">
            <a href="teams.php?team=DC#teamtable">
                <div class="rounded">
                    <img class="teamcards" src="img\dccard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=GT#teamtable">
                <div class="rounded gt">
                    <img class="teamcards" src="img\gtcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=KKR#teamtable">
                <div class="rounded kkr">
                    <img class="teamcards" src="img\kkrcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
    </div>


    <div class="row row-cols-1 row-cols-md-4 g-4 mt-2 mx-5">
        <div class="col">
            <a href="teams.php?team=LSG#teamtable">

                <div class="rounded">
                    <img class="teamcards" src="img\lsgcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=MI#teamtable">

                <div class="rounded mi">
                    <img class="teamcards" src="img\micard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=PBKS#teamtable">

                <div class="rounded">
                    <img class="teamcards" src="img\pbkscard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=RR#teamtable">

                <div class="rounded rr">
                    <img class="teamcards" src="img\rrcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-4 g-4 mt-2 mb-5 mx-5">
        <div class="col">

            <div class="rounded">
                <img class="teamcards" src="img\glass.png" alt="" width='300' height='300'>
            </div>
        </div>
        <div class="col">
            <a href="teams.php?team=RCB#teamtable">

                <div class="rounded">
                    <img class="teamcards" src="img\rcbcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <a href="teams.php?team=SRH#teamtable">

                <div class="rounded srh">
                    <img class="teamcards" src="img\srhcard.png" alt="..." width='300' height='300'>
                </div>
            </a>

        </div>
        <div class="col">
            <div class="rounded">
                <img class="teamcards" src="img\glass.png" alt="" width='300' height='300'>
            </div>
        </div>
    </div>

    <?php 
       if(isset($_GET['team'])) {
       $servername = "localhost:3307";
       $username = "root";
       $password = "";
       $database = "ipl";

       $conn = mysqli_connect($servername, $username, $password,$database);

       if($_SERVER['REQUEST_METHOD'] == 'GET')
       {
            $team = $_GET['team'];

            $sql = "SELECT * FROM `teams` where `Abbreviation` = '". $team."'";
            $result = mysqli_query($conn, $sql);
            $row= mysqli_fetch_assoc($result);

            //Team Details Display
            echo '
            <h1 align="center" id="teamtable"  style="color:white;">Team Details</h1>
            <hr style="color:white;width:50%;margin-left:auto;margin-right:auto;">
            <table class="detailtable mt-3 mb-5">
                <tr>
                    <td>
                        <img src="'.$row['logo'] .'"
                        alt="..." height="150" width="150">
                    </td>
                    <td style="color:white;">
                        <h2>'.$row['Team'].'</h2>'.
                        (($row['Year'] != '-') ? '<div class="d-flex align-items-center">
                        <div>
                            <img src="https://www.iplt20.com/assets/images/team-trophy.png" class="img-fluid" alt="...">
                        </div>
                        <div class="ms-0">
                            <h5>'.$row['Year'].'</h5>
                        </div>
                    </div>' : '').
                        '<a href="'. $row['links'] .'">
                            <img class="site" width="170px" src="img/site.png" alt="...">
                        </a>
                    </td>
                    <td>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span style="color:gold;font-weight:bold">OWNER   </span> - '. $row['Owner'] .'</li>
                            <li class="list-group-item"><span style="color:gold;font-weight:bold">COACH   </span> - '. $row['Coach'] .'</li>
                            <li class="list-group-item"><span style="color:gold;font-weight:bold">VENUE   </span> - '. $row['Home Ground'] .'</li>
                            <li class="list-group-item"><span style="color:gold;font-weight:bold">CAPTAIN </span> - '. $row['Captain'] .'</li>
                        </ul>
                    </td>
                </tr>
            </table>
            <h2 align=center style="color:white;">SQUAD:</h2>
            ';

            // Team Players Table Query and Displaying
            $sql = "SELECT `Player Name`,`Position`,`Country`,`Captain` FROM players WHERE Team = '" . $team . "'";
            $result = mysqli_query($conn, $sql);
            echo "<div class='mb-5' style='text-align: center;'>";
            echo "<table class = 'teamtable'>
                <thead
                    <tr>
                        <th>PLAYER NAME</th>
                        <th>POSITION</th>
                        <th>NATIONALITY</th>
                    </tr>
                </thead>
                <tbody>";
            while($row= mysqli_fetch_assoc($result))
            {
                echo "<tr>
                        <td>" . $row['Player Name'] . ($row['Captain'] == 'Yes'?' (C)':'') . "</td>
                        <td>" . $row['Position'] . "</td>
                        <td>" . $row['Country'] . "</td>
                    </tr>";
            }
            echo "</tbody></table></div>";
        }
        }
    
    ?>

    <script>
    document.addEventListener('DOMContentLoaded', function() {
        var myCarousel = new bootstrap.Carousel(document.querySelector('#carouselExampleFade'), {
            interval: 1000,
            wrap: true
        });
    });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
    </script>



</body>

</html>