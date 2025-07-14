<?php
header('Content-Type: application/json');
require 'db.php';

try {
    $stmt = $pdo->query("SELECT id, platform_name, ip FROM platforms");
    $platforms = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($platforms);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}
?>
