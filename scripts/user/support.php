<?php
$mysqli = new mysqli(
    "localhost",
    "root",
    "",
    "cs306_phase2",
    3307
);

if ($mysqli->connect_error) {
    die("DB Error");
}

$result = $mysqli->query(
    "SELECT id, username, message FROM tickets WHERE status = 1 ORDER BY created_at DESC"
);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Support</title>
</head>
<body>

<h2>Support Page</h2>

<a href="ticket_create.php">Create Ticket</a>

<ul>
<?php while ($row = $result->fetch_assoc()): ?>
    <li>
        <b><?= htmlspecialchars($row['username']) ?></b> :
        <?= htmlspecialchars($row['message']) ?>
        <br>
        <a href="ticket_detail.php?id=<?= $row['id'] ?>">Ticket Detail</a>
    </li>
<?php endwhile; ?>
</ul>

</body>
</html>
