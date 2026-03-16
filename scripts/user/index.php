<!DOCTYPE html>
<html>
<head>
    <title>Campus Club & Event Management System</title>
    <style>
        body {
            font-family: Times New Roman, serif;
        }
        .section {
            border-top: 1px solid black;
            padding: 6px 0;
            margin-bottom: 10px;
        }
        .item {
            border: 1px solid #999;
            padding: 8px;
            margin: 8px 0;
        }
        a {
            color: purple;
            text-decoration: underline;
        }
    </style>
</head>

<body>

<h1>Campus Club & Event Management System</h1>

<div class="section">
    <h2>Triggers:</h2>

    <div class="item">
        <strong>Trigger 1 (by Sera Sinem Baygan):</strong><br>
        Student Name Default Trigger – Sets student name to <em>'Unknown'</em> if left empty.<br>
        <a href="trigger_student.php">Go to the trigger's page</a>
    </div>

    <div class="item">
        <strong>Trigger 2 (by İsmail Memiş):</strong><br>
        Sponsor Budget Trigger – Prevents negative sponsor budgets by setting them to 0.<br>
        <a href="trigger_sponsor.php">Go to the trigger's page</a>
    </div>
</div>

<div class="section">
    <h2>Stored Procedures:</h2>

    <div class="item">
        <strong>Stored Procedure 1 (by Sera Sinem Baygan):</strong><br>
        List Club Events – Lists all events organized by a given club.<br>
        <a href="sp_list_club_events.php">Go to the procedure's page</a>
    </div>

    <div class="item">
        <strong>Stored Procedure 2 (by İsmail Memiş):</strong><br>
        Register Student to Event – Registers a student to an event using a stored procedure.<br>
        <a href="sp_register_student.php">Go to the procedure's page</a>
    </div>
</div>

<a href="support.php">Support Page</a>

</body>
</html>
