<?php
require_once('../dbcon.php');
header('Content-Type: application/json; charset=utf-8');

try {
    $stmt = $db_connection->prepare("SELECT riddle, answer FROM riddles WHERE roomId = 1");
    $stmt->execute();
    $riddles = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($riddles, JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Databasefout: ' . $e->getMessage()]);
}
