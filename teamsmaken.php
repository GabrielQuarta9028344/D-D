<?php
require_once('./dbcon.php');

// Create teams table if it doesn't exist
try {
    $sql = "CREATE TABLE IF NOT EXISTS teams (
        id INT AUTO_INCREMENT PRIMARY KEY,
        teamnaam VARCHAR(100) NOT NULL,
        speler1 VARCHAR(100) NOT NULL,
        speler2 VARCHAR(100) NOT NULL,
        speler3 VARCHAR(100),
        score INT DEFAULT 0,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )";
    $db_connection->exec($sql);
} catch (PDOException $e) {
    // Table already exists or other error
}

$error_message = "";
$success_message = "";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    try {
        $teamnaam = $_POST["teamnaam"] ?? "";
        $speler1 = $_POST["speler1"] ?? "";
        $speler2 = $_POST["speler2"] ?? "";
        $speler3 = $_POST["speler3"] ?? "";

        // Validate input
        if (empty($teamnaam) || empty($speler1) || empty($speler2)) {
            $error_message = "Teamnaam en minstens 2 spelers zijn verplicht!";
        } else {
            // Insert team into database
            $stmt = $db_connection->prepare("
                INSERT INTO teams (teamnaam, speler1, speler2, speler3, score) 
                VALUES (?, ?, ?, ?, ?)
            ");
            
            $score = rand(70, 100);
            $stmt->execute([$teamnaam, $speler1, $speler2, $speler3 ?: null, $score]);
            
            $success_message = "Team '" . htmlspecialchars($teamnaam) . "' succesvol aangemaakt!";
            
            // Redirect after 2 seconds
            header("Refresh: 2; url=index.php");
        }
    } catch (PDOException $e) {
        $error_message = "Databasefout: " . $e->getMessage();
    } catch (Exception $e) {
        $error_message = "Er is een fout opgetreden: " . $e->getMessage();
    }
}
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>D-D Raadsels - Teams</title>
    <link rel="stylesheet" href="/css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #1a0033 0%, #002d5c 50%, #00334d 100%);
            font-family: 'Arial', sans-serif;
            color: #fff;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-container {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }

        .form-section {
            flex: 0 0 500px;
            background: rgba(0, 0, 0, 0.6);
            padding: 40px;
            border-radius: 10px;
            border: 2px solid #444;
        }

        .form-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 25px;
        }

        .form-header-text h1 {
            font-size: 28px;
            color: #ffd700;
            margin-bottom: 5px;
            letter-spacing: 2px;
        }

        .form-header-text .subtitle {
            color: #999;
            font-size: 14px;
        }

        .nav-link {
            background: #333;
            border: 1px solid #555;
            color: #ccc;
            padding: 8px 16px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 12px;
            transition: all 0.3s;
            white-space: nowrap;
        }

        .nav-link:hover {
            background: #ffd700;
            color: #000;
            border-color: #ffd700;
        }

        .form-section label {
            display: block;
            margin-top: 20px;
            margin-bottom: 8px;
            font-weight: bold;
            color: #ccc;
            font-size: 14px;
        }

        .form-section input {
            width: 100%;
            padding: 12px;
            margin-bottom: 0;
            background: #222;
            border: 1px solid #555;
            color: #fff;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-section input:focus {
            outline: none;
            border-color: #ffd700;
            background: #2a2a2a;
        }

        .form-section button {
            width: 100%;
            padding: 12px;
            margin-top: 25px;
            background: #ffd700;
            color: #000;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s;
        }

        .form-section button:hover {
            background: #ffed4e;
            transform: scale(1.02);
        }

        .error-message {
            color: #c71b1b;
            background: rgba(199, 27, 27, 0.2);
            padding: 12px;
            border-left: 4px solid #c71b1b;
            margin-bottom: 20px;
            border-radius: 4px;
            font-size: 13px;
        }

        .success-message {
            color: #0f0;
            background: rgba(0, 255, 0, 0.1);
            padding: 12px;
            border-left: 4px solid #0f0;
            margin-bottom: 20px;
            border-radius: 4px;
            font-size: 13px;
        }
    </style>
</head>
<body>

<div class="main-container">
    <!-- FORM SECTION -->
    <div class="form-section">
        <div class="form-header">
            <div class="form-header-text">
                <h1>D-D Raadsels</h1>
                <p class="subtitle">Team aanmaken</p>
            </div>
            <a href="beheer.php" class="nav-link">Beheer →</a>
        </div>

        <?php if (!empty($error_message)): ?>
            <div class="error-message">
                <strong>Fout:</strong> <?php echo $error_message; ?>
            </div>
        <?php endif; ?>

        <?php if (!empty($success_message)): ?>
            <div class="success-message">
                <strong>Succes!</strong> <?php echo $success_message; ?>
            </div>
        <?php endif; ?>

        <form method="POST">
            <label>Teamnaam</label>
            <input type="text" name="teamnaam" required>

            <label>Speler 1</label>
            <input type="text" name="speler1" required>

            <label>Speler 2</label>
            <input type="text" name="speler2" required>

            <label>Speler 3 (optioneel)</label>
            <input type="text" name="speler3">

            <button type="submit">Team aanmaken</button>
        </form>
    </div>
</div>

</body>
</html>
