<?php
$servername = "localhost:3307";
$username = "root";
$password = "";
$db_name  = "logd";
$conn = new mysqli($servername, $username, $password, $db_name);
if($conn->connect_error){
    die("connection in failed". $conn->connect_error);
    echo  '<script>window.location.href = "error404.html";</script>';
}

if(isset($_POST['submit']))
{
    $username = $_POST['user'];
    $password = $_POST['pass'];

    if(empty($username) || empty($password)) {
        echo '<script>alert("Both username and password are required."); window.location.href = "login.php";</script>';
    } else {
        $sql = "SELECT hashed_password FROM login WHERE username = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $hashed_password_from_db = $row['hashed_password'];

        if(password_verify($password, $hashed_password_from_db)) {
            header("Location: success.html");
        } else {
            echo  '<script>alert("Login failed. Invalid username or password"); window.location.href = "login.php";</script>';
        }
    }
}
?>



<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- For all the css file import -->
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


    <!-- For the title and the favicon -->
    <title>ADMIN LOGIN</title>
    <link rel="icon" type="image/x-icon" href="https://www.iplt20.com/img/favicon.ico">

    <style>
    body {
        height: 100vh;
        width: 100vw;
        background-image: url('img/bgf.jpg');
        background-repeat: no-repeat;
        background-position: center;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #form {
        background-color: white;
        width: 30%;
        padding: 50px;
        box-shadow: 10px 10px 5px rgb(82, 11, 77);
        border-radius: 6px;
    }

    input[type="text"],
    input[type="password"],
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 16px;
    }

    #btn {
        color: white;
        background-color: burlywood;
        padding: 10px;
        font-size: 18px;
        border: none;
        border-radius: 5px;
        box-shadow: 2px 2px 2px rgb(82, 11, 77);
        cursor: pointer;
    }

    #form h1 {
        margin-top: 0;
        margin-bottom: 20px;
        font-family: Georgia, 'Times New Roman', Times, serif;
        font-size: 24px;
        text-align: center;
    }

    @media (max-width: 700px) {
        #form {
            width: 80%;
            padding: 30px;
        }
    }
    </style>
</head>

<body>



    <div id="form">
        <h1>Login Page</h1>
        <form name="form" action="login.php" onsubmit="return isvalid()" method="POST">
            <br>
            <div class="form-floating">
                <input type="text" class="form-control" id="u" placeholder="@" name='user'>
                <label for="floatingInput">Username:</label>
            </div>

            <div class="form-floating">
                <input type="password" class="form-control" name='pass' id="pass" placeholder="Password">
                <label id='u' for="pass">Password:</label>
            </div>

            <input type="checkbox" id="showPassword" onchange="togglePassword()"> Show Password<br><br>
            <input type="submit" id="btn" name="submit" value="Login" />
        </form>

    </div>
    <script>
    function isvalid() {

        var userInput = document.form.user;
        var passInput = document.form.pass;

        userInput.classList.remove('is-invalid');
        passInput.classList.remove('is-invalid');

        var isFormValid = true;

        if (userInput.value.trim() === '') {
            userInput.classList.add('is-invalid');
            isFormValid = false;
        }

        if (passInput.value.trim() === '') {
            passInput.classList.add('is-invalid');
            isFormValid = false;
        }

        return isFormValid;
    }


    function togglePassword() {
        var passField = document.getElementById("pass");
        var showPassCheckbox = document.getElementById("showPassword");
        if (showPassCheckbox.checked) {
            passField.type = "text";
        } else {
            passField.type = "password";
        }
    }
    </script>



</body>

</html>