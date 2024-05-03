<!DOCTYPE html>
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
        body {
            padding: 20px;
            background: radial-gradient(circle at -8.9% 51.2%, rgb(255, 124, 0) 0%, rgb(255, 124, 0) 15.9%, rgb(255, 163, 77) 15.9%, rgb(255, 163, 77) 24.4%, rgb(19, 30, 37) 24.5%, rgb(19, 30, 37) 66%);
            color: white;
        }

        .edit-form {
            max-width: 700px;
            margin: 0 auto;
            padding: 50px;
            
            background: rgba(233, 233, 233, 0.21);
            border-radius: 16px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(6.6px);
            -webkit-backdrop-filter: blur(6.6px);
            border: 1px solid rgba(233, 233, 233, 1);
            
        }

        .edit-form label {
            font-weight: bold;
        }
    </style>
</head>

<body>


    <?php
    if (isset($_GET['pos']) && isset($_GET['table'])) {
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

        if ($table === 'batstats') {
            $sql = "SELECT * FROM `batstats` WHERE POS = $pos";
        } elseif ($table === 'bowlstats') {
            $sql = "SELECT * FROM `bowlstats` WHERE POS = $pos";
        }

        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
    ?>

                <div class="edit-form">
                    <h2 style="color:white;">Edit Record</h2>
                    <form action="update.php?table=<?php echo $table; ?>&pos=<?php echo $pos; ?>" method="POST" required>
                        <input type="hidden" name="pos" value="<?php echo $row['POS']; ?>">
                        <div class="mb-3 row">
                            <label for="player" class="col-sm-4 col-form-label">Player</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="player" value="<?php echo $row['Player']; ?>" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="team" class="col-sm-4 col-form-label">Team</label>
                            <div class="col-sm-8">
                                <select class="form-select" name="team">
                                    <option value="CSK" <?php if ($row['Team'] == 'CSK') echo 'selected'; ?>>CSK</option>
                                    <option value="DC" <?php if ($row['Team'] == 'DC') echo 'selected'; ?>>DC</option>
                                    <option value="GT" <?php if ($row['Team'] == 'GT') echo 'selected'; ?>>GT</option>
                                    <option value="KKR" <?php if ($row['Team'] == 'KKR') echo 'selected'; ?>>KKR</option>
                                    <option value="LSG" <?php if ($row['Team'] == 'LSG') echo 'selected'; ?>>LSG</option>
                                    <option value="MI" <?php if ($row['Team'] == 'MI') echo 'selected'; ?>>MI</option>
                                    <option value="PBKS" <?php if ($row['Team'] == 'PBKS') echo 'selected'; ?>>PBKS</option>
                                    <option value="RCB" <?php if ($row['Team'] == 'RCB') echo 'selected'; ?>>RCB</option>
                                    <option value="RR" <?php if ($row['Team'] == 'RR') echo 'selected'; ?>>RR</option>
                                    <option value="SRH" <?php if ($row['Team'] == 'SRH') echo 'selected'; ?>>SRH</option>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="mat" class="col-sm-4 col-form-label">Mat</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="mat" value="<?php echo $row['Mat']; ?>" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inns" class="col-sm-4 col-form-label">Inns</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="inns" value="<?php echo $row['Inns']; ?>" required>
                            </div>
                        </div>
                        <?php if ($table === 'batstats') : ?>
                            <div class="mb-3 row">
                                <label for="no" class="col-sm-4 col-form-label">NO</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="no" value="<?php echo $row['NO']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="runs" class="col-sm-4 col-form-label">Runs</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="runs" value="<?php echo $row['Runs']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="hs" class="col-sm-4 col-form-label">HS</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="hs" value="<?php echo $row['HS']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="BF" class="col-sm-4 col-form-label">BF</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="BF" value="<?php echo $row['BF']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="100" class="col-sm-4 col-form-label">100</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="100" value="<?php echo $row['100']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="50" class="col-sm-4 col-form-label">50</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="50" value="<?php echo $row['50']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="4s" class="col-sm-4 col-form-label">4s</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="4s" value="<?php echo $row['4s']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="6s" class="col-sm-4 col-form-label">6s</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="6s" value="<?php echo $row['6s']; ?>" required>
                                </div>
                            </div>

                        <?php elseif ($table === 'bowlstats') : ?>
                            <div class="mb-3 row">
                                <label for="Ov" class="col-sm-4 col-form-label">Overs</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="Ov" value="<?php echo $row['Ov']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="Runs" class="col-sm-4 col-form-label">Runs</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="Runs" value="<?php echo $row['Runs']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="wkts" class="col-sm-4 col-form-label">Wickets</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="wkts" value="<?php echo $row['Wkts']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="bbi" class="col-sm-4 col-form-label">BBI</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="bbi" value="<?php echo $row['BBI']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="4w" class="col-sm-4 col-form-label">4w</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="4w" value="<?php echo $row['4w']; ?>" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="5w" class="col-sm-4 col-form-label">5w</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="5w" value="<?php echo $row['5w']; ?>" required>
                                </div>
                            </div>
                        <?php endif; ?>

                        <button type="submit" class="btn btn-outline-light">Save</button>
                    </form>
                </div>

    <?php
            }
        } else {
            echo "0 results";
        }

        $conn->close();
    } else {
        echo '<script>window.location.href = "error404.html";</script>';
    }
    ?>


</body>

</html>