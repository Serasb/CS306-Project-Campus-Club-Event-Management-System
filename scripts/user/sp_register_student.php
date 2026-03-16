<!DOCTYPE html>
<html>
<head>
    <title>Register Student to Event</title>
</head>
<body>

<h2>Stored Procedure 2(by Ismail Memiş): Register Student to Event</h2>

<p>
Registers a student to an event using a stored procedure.
</p>

<form method="post">
    Student ID:<br>
    <input type="text" name="student_id" required><br><br>

    Event ID:<br>
    <input type="text" name="event_id" required><br><br>

    Registration Date:<br>
    <input type="date" name="r_date" required><br><br>

    <button type="submit">Register Student</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = new mysqli("localhost", "root", "", "cs306_phase2", 3307);

    if ($conn->connect_error) {
        die("Connection failed");
    }

    $student_id = $_POST["student_id"];
    $event_id = $_POST["event_id"];
    $r_date = $_POST["r_date"];

    if ($conn->query("CALL register_student_to_event('$student_id', '$event_id', '$r_date')")) {
        echo "<p><b>Student successfully registered.</b></p>";
    } else {
        echo "<p>Error: " . $conn->error . "</p>";
    }

    $conn->close();
}
?>

<br>
<a href="index.php">Go to homepage</a>

</body>
</html>
