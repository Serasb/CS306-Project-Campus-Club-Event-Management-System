<?php
require_once __DIR__ . "/../db_config.php";

$mysqli = db_connect();

$id = $_GET["id"] ?? null;
if (!$id) { die("Invalid ticket."); }

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    if (isset($_POST["comment"]) && trim($_POST["comment"]) !== "") {
        $comment = trim($_POST["comment"]);

        $stmt = $mysqli->prepare("INSERT INTO ticket_comments (ticket_id, username, comment) VALUES (?, 'admin', ?)");
        $stmt->bind_param("is", $id, $comment);
        $stmt->execute();
    }

    if (isset($_POST["resolve"])) {
        $stmt = $mysqli->prepare("UPDATE tickets SET status=0 WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        header("Location: index.php");
        exit;
    }
}

$stmt = $mysqli->prepare("SELECT id, username, message, status, created_at FROM tickets WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$ticket = $stmt->get_result()->fetch_assoc();
if (!$ticket) { die("Ticket not found."); }

$stmt = $mysqli->prepare("SELECT username, comment, created_at FROM ticket_comments WHERE ticket_id=? ORDER BY created_at ASC");
$stmt->bind_param("i", $id);
$stmt->execute();
$comments = $stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Detail</title>
    <style>
        body { font-family: Times New Roman, serif; }
        .section { border-top: 1px solid black; border-bottom: 1px solid black; padding: 10px 0; }
        .item { border: 1px solid #999; padding: 8px; margin: 8px 0; }
        a { color: purple; text-decoration: underline; }
        textarea { width: 300px; height: 60px; }
    </style>
</head>
<body>

<a href="index.php">Back to Tickets</a>

<h2>Ticket Details</h2>

<p><b>Username:</b> <?= htmlspecialchars($ticket["username"]) ?></p>
<p><b>Body:</b> <?= htmlspecialchars($ticket["message"]) ?></p>
<p><b>Status:</b> <?= $ticket["status"] ? "Active" : "Resolved" ?></p>
<p><b>Created At:</b> <?= htmlspecialchars($ticket["created_at"]) ?></p>

<div class="section">
    <h3>Comments:</h3>

    <?php if ($comments->num_rows === 0): ?>
        <p>No comments.</p>
    <?php else: ?>
        <?php while($c = $comments->fetch_assoc()): ?>
            <div class="item">
                <div><b>Created At:</b> <?= htmlspecialchars($c["created_at"]) ?></div>
                <div><b>Username:</b> <?= htmlspecialchars($c["username"]) ?></div>
                <div><b>Comment:</b> <?= nl2br(htmlspecialchars($c["comment"])) ?></div>
            </div>
        <?php endwhile; ?>
    <?php endif; ?>

    <form method="POST">
        <textarea name="comment" placeholder="Add a comment"></textarea><br><br>
        <button type="submit">Add Comment</button>
    </form>

    <br>

    <form method="POST">
        <button type="submit" name="resolve">Deactivate Ticket</button>
    </form>
</div>

</body>
</html>
