<?php
require_once __DIR__ . "/../db_config.php";

$mysqli = db_connect();

$result = $mysqli->query(
    "SELECT * FROM tickets WHERE status = 1 ORDER BY created_at DESC"
);
?>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Tickets</title>
</head>
<body>

<h1>Admin Ticket List</h1>

<?php if ($result->num_rows === 0): ?>
    <p>No active tickets.</p>
<?php endif; ?>

<?php while ($row = $result->fetch_assoc()): ?>
    <div style="border:1px solid #000; margin:10px; padding:10px;">
        <b>User:</b> <?= htmlspecialchars($row['username']) ?><br>
        <b>Message:</b> <?= htmlspecialchars($row['message']) ?><br>
        <b>Status:</b> Active<br>
        <a href="ticket_detail.php?id=<?= $row['id'] ?>">Detail</a>
    </div>
<?php endwhile; ?>

</body>
</html>
