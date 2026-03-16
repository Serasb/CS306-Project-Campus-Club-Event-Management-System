<?php
// scripts/db_config.php
//
// Centralized MySQL configuration for the project.
// Replace the placeholder values below with your own local settings.
//
// Example (local development):
// define("DB_HOST", "127.0.0.1");
// define("DB_USER", "root");
// define("DB_PASS", "");
// define("DB_NAME", "cs306_phase2");
// define("DB_PORT", 3307);

define("DB_HOST", "YOUR_DB_HOST");
define("DB_USER", "YOUR_DB_USER");
define("DB_PASS", "YOUR_DB_PASSWORD");
define("DB_NAME", "YOUR_DB_NAME");
define("DB_PORT", 3306);

/**
 * Create and return a mysqli connection using the configuration above.
 * The caller is responsible for closing the connection when finished.
 */
function db_connect(): mysqli
{
    $mysqli = new mysqli(
        DB_HOST,
        DB_USER,
        DB_PASS,
        DB_NAME,
        DB_PORT
    );

    if ($mysqli->connect_error) {
        // Keep the error message generic to avoid leaking details.
        die("Database connection failed.");
    }

    return $mysqli;
}
?>

