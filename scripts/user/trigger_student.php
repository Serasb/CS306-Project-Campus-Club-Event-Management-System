<!DOCTYPE html>
<html>
<head>
    <title>Student Name Default Trigger</title>
</head>
<body>

<h2>Trigger 1(by Sera Sinem Baygan): Student Name Default Trigger</h2>

<p>
If the student name is left empty, the trigger automatically sets it to
<b>'Unknown'</b>.
</p>

<form method="post">
    Student ID:<br>
    <input type="text" name="student_id" required><br><br>

    Name (leave empty to test trigger):<br>
    <input type="text" name="name"><br><br>

    Email:<br>
    <input type="email" name="email"><br><br>

    Department:<br>
    <input type="text" name="department"><br><br>

    <button type="submit">Insert Student</button>
</form>

<?php
require_once __DIR__ . "/../db_config.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = db_connect();

    $student_id = $_POST["student_id"];
    $name       = $_POST["name"];
    $email      = $_POST["email"];
    $department = $_POST["department"];

    $stmt = $conn->prepare(
        "INSERT INTO student (student_id, name, email, department)
         VALUES (?, ?, ?, ?)"
    );

    if ($stmt) {
        $stmt->bind_param("ssss", $student_id, $name, $email, $department);
        $ok = $stmt->execute();
        $stmt->close();
    } else {
        $ok = false;
    }

    if ($ok) {
        echo "<p><b>Student inserted.</b> If name was empty, trigger set it to 'Unknown'.</p>";
    } else {
        echo "<p>Error: " . htmlspecialchars($conn->error) . "</p>";
    }

    $conn->close();
}
?>

<br>
<a href="index.php">Go to homepage</a>

</body>
</html>
