<!DOCTYPE html>
<html>
<head>
    <title>Sponsor Budget Trigger</title>
</head>
<body>

<h2>Trigger 2(by Ismail Memiş): Sponsor Budget Trigger</h2>

<p>
This page tests the sponsor budget trigger written in Phase 2.
If a negative budget is entered, the trigger automatically sets it to 0.
</p>

<form method="post">
    Sponsor ID: <br>
    <input type="text" name="sp_id" required><br><br>

    Sponsor Name: <br>
    <input type="text" name="sp_name" required><br><br>

    Budget: <br>
    <input type="number" name="budget" required><br><br>

    <button type="submit">Insert Sponsor</button>
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = new mysqli("localhost", "root", "", "cs306_phase2", 3307);

    if ($conn->connect_error) {
        die("Connection failed");
    }

    $sp_id = $_POST["sp_id"];
    $sp_name = $_POST["sp_name"];
    $budget = $_POST["budget"];

    $sql = "INSERT INTO sponsor (sp_id, sp_name, budget)
            VALUES ('$sp_id', '$sp_name', $budget)";

    if ($conn->query($sql)) {
        echo "<p><b>Insert successful.</b> Check the database to see trigger effect.</p>";
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
