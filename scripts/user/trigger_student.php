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
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = new mysqli("localhost", "root", "", "cs306_phase2", 3307);

    if ($conn->connect_error) {
        die("Connection failed");
    }

    $student_id = $_POST["student_id"];
    $name = $_POST["name"];
    $email = $_POST["email"];
    $department = $_POST["department"];

    $sql = "INSERT INTO student (student_id, name, email, department)
            VALUES ('$student_id', '$name', '$email', '$department')";

    if ($conn->query($sql)) {
        echo "<p><b>Student inserted.</b> If name was empty, trigger set it to 'Unknown'.</p>";
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
