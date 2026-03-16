<?php
require_once __DIR__ . "/../db_config.php";

$mysqli = db_connect();

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
