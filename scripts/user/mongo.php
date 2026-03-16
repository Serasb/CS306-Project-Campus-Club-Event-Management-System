<?php
// user/mongo.php
// MongoDB\Driver\Manager kullanımı (Phase 3 beklentisi)

function mongo_manager(): MongoDB\Driver\Manager {
    static $manager = null;
    if ($manager === null) {
        $manager = new MongoDB\Driver\Manager("mongodb://localhost:27017");
    }
    return $manager;
}

function mongo_ns(): string {
    // namespace: database.collection
    return "cs306_phase3.tickets";
}

function now_str(): string {
    return date("Y-m-d H:i:s");
}

function h($s): string {
    return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8');
}
?>
