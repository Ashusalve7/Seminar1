index.php
<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<link rel="stylesheet" href="styling/styles.css">
</head>
<body>
<div class="container">
<form method="post" action="handle/login.php">
<h3>Admin Login</h3>
<div class="form-space">
<label for="email">Username: </label>
<input type="text" id="username" name="username" class="form-control" required>
</div>
<div class="form-space">
<label for="password">Password:</label>
<input type="password" id="password" name="password" class="form-control"
required>
</div>
<div class="buttons">
<button type="submit" name="submit" value="submitted"
class="btn">Submit</button>
</div>
</form>
</div>
</body>
</html>
login.php
<?php
// Database connection configuration
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'prac8';
// Create connection
$conn = new mysqli($host, $username, $password, $database);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
// checking in the database
$username = mysqli_real_escape_string($conn, $_POST['username']);
$password = mysqli_real_escape_string($conn, $_POST['password']);
// table selection
$sql = "SELECT * FROM user WHERE username = '$username' AND password =
'$password'";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) == 1) {
// User credentials are correct
$_SESSION['username'] = $username;
header('Location: ../index.html');
} else {
// Invalid credentials
echo "Invalid username or password.";
}
$_SESSION['username'] = $username;
mysqli_close($conn);
?>
logout.php:
<?php
session_start();
unset($_SESSION['username']);
header("Location: ../index.php")
?>
