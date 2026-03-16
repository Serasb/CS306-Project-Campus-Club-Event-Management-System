<?php
$mysqli = new mysqli(
    "127.0.0.1",
    "root",
    "",
    "cs306_phase2",
    3307
);

if ($mysqli->connect_error) {
    die("DB Error");
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = $_POST["username"];
    $message  = $_POST["message"];

    $stmt = $mysqli->prepare(
        "INSERT INTO tickets (username, message) VALUES (?, ?)"
    );
    $stmt->bind_param("ss", $username, $message);
    $stmt->execute();

    header("Location: support.php");
    exit;
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Create Ticket</title>
</head>
<body>

<a href="index.php">Home</a> |
<a href="support.php">View Tickets</a>

<h2>Create a Ticket</h2>

<form method="post">
    <input type="text" name="username" placeholder="username" required><br><br>

    <textarea name="message" rows="4" cols="40"
              placeholder="ticket message" required></textarea><br><br>

    <button type="submit">Create Ticket</button>
</form>

</body>
</html>
