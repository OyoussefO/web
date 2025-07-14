<?php
header('Content-Type: application/json');
require 'db.php';

$stmt = $pdo->query("SELECT id, name, logo, description FROM platforms");
$platforms = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($platforms);
?>
