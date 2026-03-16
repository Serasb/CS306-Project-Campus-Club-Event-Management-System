<?php
require_once __DIR__ . "/mongo.php";

$manager = mongo_manager();
$ns = mongo_ns();

$id = $_GET['id'] ?? '';
$username_back = $_GET['username'] ?? '';

$error = '';
$ticket = null;

function oid_from_string($id) {
    try { return new MongoDB\BSON\ObjectId($id); }
    catch (Exception $e) { return null; }
}

$oid = oid_from_string($id);
if ($oid === null) {
    $error = "Invalid ticket id.";
} else {

    // Comment ekleme (POST)
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $comment_text = trim($_POST['comment'] ?? '');
        if ($comment_text !== '') {
            try {
                $bulk = new MongoDB\Driver\BulkWrite;
                $bulk->update(
                    ['_id' => $oid],
                    ['$push' => ['comments' => ['by' => ($_POST['by'] ?? 'user'), 'text' => $comment_text, 'at' => now_str()]]]
                );
                $manager->executeBulkWrite($ns, $bulk);
            } catch (Exception $e) {
                $error = $e->getMessage();
            }
        }
    }

    // Ticket çek
    try {
        $query = new MongoDB\Driver\Query(['_id' => $oid]);
        $cursor = $manager->executeQuery($ns, $query);
        foreach ($cursor as $doc) { $ticket = $doc; break; }
        if ($ticket === null) $error = "Ticket not found.";
    } catch (Exception $e) {
        $error = $e->getMessage();
    }
}
?>
<!doctype html>
<html>
<head><meta charset="utf-8"><title>Ticket Detail</title></head>
<body>
<h2>Ticket Detail View</h2>

<p>
  <a href="support.php<?= $username_back !== '' ? ('?username=' . urlencode($username_back)) : '' ?>">Back to ticket list</a>
</p>
<hr>

<?php if ($error !== ''): ?>
  <p><b>Error:</b> <?= h($error) ?></p>
<?php elseif ($ticket !== null): ?>

  <p><b>Username:</b> <?= h($ticket->username ?? '') ?></p>
  <p><b>Created at:</b> <?= h($ticket->created_at ?? '') ?></p>
  <p><b>Status:</b> <?= (!empty($ticket->active) ? 'active' : 'inactive') ?></p>
  <p><b>Body:</b><br><?= nl2br(h($ticket->body ?? '')) ?></p>

  <h3>Comments</h3>
  <?php
    $comments = $ticket->comments ?? [];
    if (empty($comments)) {
        echo "<p><i>No comments yet.</i></p>";
    } else {
        echo "<ul>";
        foreach ($comments as $c) {
            $by = $c->by ?? '';
            $text = $c->text ?? '';
            $at = $c->at ?? '';
            echo "<li><b>" . h($by) . "</b> (" . h($at) . "): " . h($text) . "</li>";
        }
        echo "</ul>";
    }
  ?>

  <?php if (!empty($ticket->active)): ?>
    <h4>Add a comment</h4>
    <form method="post" action="ticket_detail.php?id=<?= h($id) ?>&username=<?= h($username_back) ?>">
      <input type="hidden" name="by" value="user">
      <textarea name="comment" rows="3" cols="60"></textarea><br><br>
      <button type="submit">Submit Comment</button>
    </form>
  <?php else: ?>
    <p><i>This ticket is resolved (inactive). You cannot add comments.</i></p>
  <?php endif; ?>

<?php endif; ?>

</body>
</html>
