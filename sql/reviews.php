<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reviews</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="rebody">
    <?php

// Databaseverbinding
$pdo = new PDO("mysql:host=localhost;dbname=escape-room", "root", "");

// Zorg ervoor dat de tabel bestaat
$pdo->exec("
    CREATE TABLE IF NOT EXISTS `reviews` (
      `id` int NOT NULL AUTO_INCREMENT,
      `team` varchar(255) NOT NULL,
      `rating` int NOT NULL,
      `difficulty` varchar(50) NOT NULL,
      `review` text NOT NULL,
      `created_at` datetime NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
");

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $team = $_POST["team"];
    $rating = $_POST["rating"];
    $difficulty = $_POST["difficulty"];
    $review = $_POST["review"];

    $stmt = $pdo->prepare("
        INSERT INTO reviews (team, rating, difficulty, review, created_at)
        VALUES (:team, :rating, :difficulty, :review, NOW())
    ");

    $stmt->execute([
        ":team" => $team,
        ":rating" => $rating,
        ":difficulty" => $difficulty,
        ":review" => $review
    ]);

    echo "<p>Review succesvol opgeslagen!</p>";
}
?>

<form method="POST">
    <label>Teamnaam</label><br>
    <input type="text" name="team" required><br><br>

    <label>Beoordeling (1 t/m 5)</label><br>
    <select name="rating" required>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select><br><br>

    <label>Moeilijkheid</label><br>
    <select name="difficulty" required>
        <option value="">-- Kies --</option>
        <option value="makkelijk">makkelijk</option>
        <option value="normaal">normaal</option>
        <option value="moeilijk">moeilijk</option>
    </select><br><br>

    <label>Review</label><br>
    <textarea name="review" rows="4" required></textarea><br><br>

    <button type="submit">Review opslaan</button>
</form>
<?php
// Reviews ophalen
$stmt = $pdo->query("SELECT * FROM reviews ORDER BY created_at DESC");
$reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<h2>Overzicht van Reviews</h2>

<table border="1" cellpadding="8" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Team</th>
        <th>Beoordeling</th>
        <th>Moeilijkheid</th>
        <th>Review</th>
        <th>Datum</th>
    </tr>

    <?php foreach ($reviews as $r): ?>
    <tr>
        <td><?= $r["id"] ?></td>
        <td><?= htmlspecialchars($r["team"]) ?></td>
        <td><?= $r["rating"] ?> / 5</td>
        <td><?= htmlspecialchars($r["difficulty"]) ?></td>
        <td><?= htmlspecialchars($r["review"]) ?></td>
        <td><?= $r["created_at"] ?></td>
    </tr>
    <?php endforeach; ?>
</table>
</body>
</html>


