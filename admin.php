<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For all the css file import -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- For the title and the favicon -->
    <title>Indian Premier League Unofficial Website</title>
    <link rel="icon" type="image/x-icon" href="https://www.iplt20.com/img/favicon.ico">

    <style>
        .varchar {
            color: black;
        }

        @import url('https://fonts.googleapis.com/css2?family=Poppins&display=swap');

        body {
            font-family: 'Poppins' sans-serif;
            font-weight: 7px;
            /* overflow: hidden; */
        }

        div>.accordion-body {
            overflow: hidden;
        }

        .body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .table {
            width: 100%;
            font-family: 'Poppins' sans-serif;
            font-weight: 7px;
        }

        .table_header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            padding: 20px;
            background-color: rgb(240, 240, 240);
        }

        .table_header p {
            color: black;
        }

        button {
            outline: none;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            padding: 10px;
        }

        td button:nth-child(1) {
            background-color: #0298cf;
        }

        td button:nth-child(2) {
            background-color: #f80000;
        }

        div .add_new {
            padding: 10px 20px;
            color: white;
            background-color: #0298cf;
        }

        input {
            padding: 10px 20px;
            margin: 0 10px;
            outline: none;
            border: 1px solid #0298cf;
            border-radius: 6px;
            color: #0298cf;
        }

        .pagination {
            display: flex;
            justify-content: center;
            width: 100%;
            padding: 10px 20px;
            background: #8493a5;
        }


        ::placeholder {
            color: #0298cf;
        }

        ::-webkit-scrollbar {
            height: 5px;
            width: 5px;
        }

        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        }

        ::-webkit-scrollbar-thumb {
            box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
        }

        .table_section {
            margin: 0;
            padding: 0;
            height: 650px;
            overflow-x: auto;
            overflow-y: auto;
        }

        table {
            margin: 0;
            padding: 0;
            width: 155%;
            table-layout: fixed;
            min-width: 1000px;
            border-collapse: collapse;
        }

        thead th {
            position: sticky;
            top: 0;
            background-color: #f6f9fc;
            color: #8493a5;
            font-size: 15px;
        }

        th,
        td {
            border-bottom: 1px solid #dddddd;
            padding: 10px 20px;
            word-break: break-all;
            text-align: center;
        }

        tr:hover td {
            color: #0298cf;
            cursor: pointer;
            background-color: #f6f9fc;
        }

        .edit-btn,
        .delete-btn {
            background: none;
            border: none;
            cursor: pointer;
        }

        .edit-btn:hover,
        .delete-btn:hover {
            color: white;
        }

        .extra table {
            max-width: 100%;
        }

        .extra th,
        .extra td {
            padding: 8px 12px;
        }
    </style>

</head>

<body>
    <!--Custom Navbar -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary" id="navbar">
        <div class="container-fluid" id="nav">
            <a class="navbar-brand" href="#"><img src="img/logo.png" alt="Logo" width="45" height="37.17" class="d-inline-block align-text-top"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href>Admin Dashboard</a>
                    </li>
                </ul>
                <a href="main.php">
                    <button type="Logout" class="btn btn-outline-danger">Logout</button>
                </a>
            </div>
        </div>
    </nav>
    <hr class="mt-0">
    <!-- Navbar ends here -->

    <div class="body accordion accordion-flush mx-5" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button varchar collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                    <strong>UPDATE BATSMAN STATS</strong>
                    <pre> </pre> <img src="img\game.png" width="30" height="30" alt>
                </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <!-- Matter 2 -->
                    <div class="table">
                        <div class="table_header">
                            <h5>Player Details</h5>
                            <div>
                                <button id="addBatsman" class='add_new'>+ Add Batsman</button>
                            </div>
                        </div>
                    </div>
                    <div class="table_section">
                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>POS</th>
                                    <th>Player</th>
                                    <th>Team</th>
                                    <th>Mat</th>
                                    <th>Inns</th>
                                    <th>NO</th>
                                    <th>Runs</th>
                                    <th>HS</th>
                                    <th>Avg</th>
                                    <th>BF</th>
                                    <th>SR</th>
                                    <th>100</th>
                                    <th>50</th>
                                    <th>4s</th>
                                    <th>6s</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $servername = "localhost:3307";
                                $username = "root";
                                $password = "";
                                $database = "ipl";

                                $conn = mysqli_connect($servername, $username, $password, $database);

                                $sql = "SELECT * FROM `batstats` order by POS ASC";
                                $result = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "
                                        <tr data-pos='" . $row['POS'] . "'>
                                            <td>
                                                <button class='edit-btn' data-table='batstats'><i class='fa-solid fa-pen-to-square'></i></button>
                                                <button class='delete-btn' data-table='batstats'><i class='fa-solid fa-trash'></i></button>
                                            </td>
                                            <td>" . $row['POS'] . "</td>
                                            <td>" . $row['Player'] . "</td>
                                            <td>" . $row['Team'] . "</td>
                                            <td>" . $row['Mat'] . "</td>
                                            <td>" . $row['Inns'] . "</td>
                                            <td>" . $row['NO'] . "</td>
                                            <td>" . $row['Runs'] . "</td>
                                            <td>" . $row['HS'] . "</td>
                                            <td>" . $row['Avg'] . "</td>
                                            <td>" . $row['BF'] . "</td>
                                            <td>" . $row['SR'] . "</td>
                                            <td>" . $row['100'] . "</td>
                                            <td>" . $row['50'] . "</td>
                                            <td>" . $row['4s'] . "</td>
                                            <td>" . $row['6s'] . "</td>
                                        </tr>
                                        ";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button varchar collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                    <strong>UPDATE BOWLER STATS</strong>
                    <pre> </pre> <img src="img\cricket.png" width="30" height="30" alt>
                </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    <!-- Matter 3 -->
                    <div class="table">
                        <div class="table_header">
                            <h5>Player Details</h5>
                            <div>
                                <button id="addBowler" class='add_new'>+ Add Bowler</button>
                            </div>
                        </div>
                    </div>
                    <div class="table_section">
                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>POS</th>
                                    <th>Player</th>
                                    <th>Team</th>
                                    <th>Mat</th>
                                    <th>Inns</th>
                                    <th>Ov</th>
                                    <th>Runs</th>
                                    <th>Wkts</th>
                                    <th>BBI</th>
                                    <th>Avg</th>
                                    <th>Ecom</th>
                                    <th>SR</th>
                                    <th>4w</th>
                                    <th>5w</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $servername = "localhost:3307";
                                $username = "root";
                                $password = "";
                                $database = "ipl";

                                $conn = mysqli_connect($servername, $username, $password, $database);

                                $sql = "SELECT * FROM `bowlstats` order by POS ASC";
                                $result = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($result)) {
                                    echo "
                                        <tr data-pos='" . $row['POS'] . "'>
                                            <td>
                                                <button class='edit-btn' data-table='bowlstats'><i class='fa-solid fa-pen-to-square'></i></button>
                                                <button class='delete-btn' data-table='bowlstats'><i class='fa-solid fa-trash'></i></button>                                            
                                            </td>
                                            <td>" . $row['POS'] . "</td>
                                            <td>" . $row['Player'] . "</td>
                                            <td>" . $row['Team'] . "</td>
                                            <td>" . $row['Mat'] . "</td>
                                            <td>" . $row['Inns'] . "</td>
                                            <td>" . $row['Ov'] . "</td>
                                            <td>" . $row['Runs'] . "</td>
                                            <td>" . $row['Wkts'] . "</td>
                                            <td>" . $row['BBI'] . "</td>
                                            <td>" . $row['Avg'] . "</td>
                                            <td>" . $row['Ecom'] . "</td>
                                            <td>" . $row['SR'] . "</td>
                                            <td>" . $row['4w'] . "</td>
                                            <td>" . $row['5w'] . "</td>
                                        </tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var editButtons = document.querySelectorAll('.edit-btn');
            var deleteButtons = document.querySelectorAll('.delete-btn');

            editButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                    var pos = button.closest('tr').getAttribute('data-pos');
                    var tableName = button.getAttribute('data-table');
                    window.location.href = 'edit.php?pos=' + pos + '&table=' + tableName;
                });
            });

            deleteButtons.forEach(function(button) {
                button.addEventListener('click', function() {
                    var pos = button.closest('tr').getAttribute('data-pos');
                    var tableName = button.getAttribute('data-table');
                    if (confirm("Are you sure you want to delete this item?")) {
                        window.location.href = 'delete.php?pos=' + pos + '&table=' + tableName;
                    }
                });
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            var addBatsmanBtn = document.getElementById('addBatsman');
            var addBowlerBtn = document.getElementById('addBowler');

            function openPlayerForm() {
                var buttonClicked = this.id;
                if (buttonClicked === 'addBatsman') {
                    window.location.href = 'addplayer.php?table=batstats';
                } else if (buttonClicked === 'addBowler') {
                    window.location.href = 'addplayer.php?table=bowlstats';
                }
            }

            addBatsmanBtn.addEventListener('click', openPlayerForm);
            addBowlerBtn.addEventListener('click', openPlayerForm);
        });
    </script>


</body>

</html>
