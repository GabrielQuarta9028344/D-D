<?php
header('Content-Type: application/json; charset=utf-8');

require_once('./dbcon.php');

try {
    // Haal riddles op voor room 3 (het entity escape spel)
    $stmt = $db_connection->query("SELECT riddle AS question, answer FROM riddles WHERE roomId = 3");
    $riddles = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($riddles, JSON_UNESCAPED_UNICODE);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Databasefout: ' . $e->getMessage()]);
}
?>
