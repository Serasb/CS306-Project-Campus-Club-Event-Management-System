<!DOCTYPE html>
<html>
<head>
    <title>List Club Events</title>
</head>
<body>

<h2>Stored Procedure 1(by Sera Sinem Baygan): List Club Events</h2>

<p>
This page calls the <b>list_club_events</b> stored procedure and displays
all events of a given club.
</p>

<form method="post">
    Club ID:<br>
    <input type="text" name="club_id" required><br><br>

    <button type="submit">Call Procedure</button>
</form>

<?php
require_once __DIR__ . "/../db_config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = db_connect();

    $club_id_raw = $_POST["club_id"];
    // If the ID is numeric, this keeps behavior but avoids injection.
    $club_id = (int)$club_id_raw;

    $stmt = $conn->prepare("CALL list_club_events(?)");

    if ($stmt) {
        $stmt->bind_param("i", $club_id);
        $ok = $stmt->execute();

        if ($ok) {
            $result = $stmt->get_result();
        } else {
            $result = false;
        }
    } else {
        $result = false;
    }

    if ($result) {
        echo "<h3>Results:</h3>";
        echo "<table border='1'>";
        echo "<tr><th>Event ID</th><th>Name</th><th>Date</th><th>Time</th><th>Venue</th></tr>";

        while ($row = $result->fetch_assoc()) {
            echo "<tr>";
            echo "<td>{$row['e_id']}</td>";
            echo "<td>{$row['e_name']}</td>";
            echo "<td>{$row['e_date']}</td>";
            echo "<td>{$row['e_time']}</td>";
            echo "<td>{$row['v_name']}</td>";
            echo "</tr>";
        }

        echo "</table>";
    }

    if (isset($stmt) && $stmt) {
        $stmt->close();
    }

    $conn->close();
}
?>

<br>
<a href="index.php">Go to homepage</a>

</body>
</html>
