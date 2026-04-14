<?php
require_once '../dbcon.php';

header('Content-Type: application/json');

try {
    $stmt = $db_connection->query("SELECT riddle, answer, hint FROM riddles");
    $riddles = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (!$riddles) {
        echo json_encode(['error' => 'Geen raadsels gevonden in de database.']);
        exit;
    }

    echo json_encode($riddles);
} catch (PDOException $e) {
    echo json_encode(['error' => 'Databasefout', 'details' => $e->getMessage()]);
    exit;
} catch (Exception $e) {
    echo json_encode(['error' => 'Onverwachte fout', 'details' => $e->getMessage()]);
    exit;
}
