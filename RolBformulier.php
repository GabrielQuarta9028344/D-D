<?php
/*************** DATABASE CONNECTIE ***************/
$host = "localhost";
$db   = "escape-room";
$user = "root";
$pass = "";
 
try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die("Database fout: " . $e->getMessage());
}
 
/*************** RAADSEL OPSLAAN ***************/
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $vraag     = $_POST["vraag"];
    $antwoord  = $_POST["antwoord"];
    $hint      = $_POST["hint"];
    $roomId    = $_POST["roomId"];
 
    $stmt = $pdo->prepare("
        INSERT INTO riddles (riddle, answer, hint, roomId)
        VALUES (?, ?, ?, ?)
    ");
    $stmt->execute([$vraag, $antwoord, $hint, $roomId]);
}
 
/*************** DATA OPHALEN ***************/
$raadsels = $pdo->query("
    SELECT id, riddle, answer, hint, roomId
    FROM riddles
")->fetchAll();
?>
 
<!DOCTYPE html>
<html lang="nl">
<head>
<meta charset="UTF-8">
<title>Escape Room Raadsels</title>
<style>
    body {
        background: #0c0e1a;
        color: #fff;
        font-family: Arial;
        padding: 30px;
    }
    h1, h2 {
        color: #f4c400;
    }
    form, table {
        margin-bottom: 40px;
    }
    input, select, button {
        width: 100%;
        padding: 10px;
        margin: 6px 0;
    }
    button {
        background: #f4c400;
        border: none;
        font-weight: bold;
        cursor: pointer;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #444;
        padding: 10px;
    }
    th {
        background: #f4c400;
        color: #000;
    }
</style>
</head>
 
<body>
 
<h1>Beheer – Escape Room Raadsels</h1>
 
<h2>Raadsel toevoegen</h2>
 
<form method="post">
    <input type="text" name="vraag" placeholder="Raadsel vraag" required>
    <input type="text" name="antwoord" placeholder="Antwoord" required>
    <input type="text" name="hint" placeholder="Hint">
 
    <input type="number" name="roomId" placeholder="Room ID" min="1" required>
 
    <button type="submit">Raadsel aanmaken</button>
</form>
 
<h2>Overzicht van alle raadsels</h2>
 
<table>
<tr>
    <th>ID</th>
    <th>Raadsel</th>
    <th>Antwoord</th>
    <th>Hint</th>
    <th>Kamer</th>
</tr>
 
<?php foreach ($raadsels as $r): ?>
<tr>
    <td><?= $r["id"] ?></td>
    <td><?= htmlspecialchars($r["riddle"]) ?></td>
    <td><?= htmlspecialchars($r["answer"]) ?></td>
    <td><?= htmlspecialchars($r["hint"]) ?></td>
    <td><?= htmlspecialchars($r["roomId"]) ?></td>
</tr>
<?php endforeach; ?>
 
</table>
 
</body>
</html>
 
 