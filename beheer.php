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
    // Table already exists
}
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="UTF-8">
    <title>D-D Raadsels - Beheer</title>
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
        }

        .main-container {
            padding: 40px;
            max-width: 1400px;
            margin: 0 auto;
        }

        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .header-section h1 {
            font-size: 32px;
            color: #ffd700;
            letter-spacing: 2px;
        }

        .nav-buttons {
            display: flex;
            gap: 10px;
        }

        .nav-btn {
            padding: 10px 20px;
            background: #333;
            border: 1px solid #555;
            color: #ccc;
            cursor: pointer;
            border-radius: 4px;
            text-decoration: none;
            font-size: 13px;
            transition: all 0.3s;
        }

        .nav-btn:hover, .nav-btn.active {
            background: #ffd700;
            color: #000;
            border-color: #ffd700;
        }

        .admin-section {
            background: rgba(0, 0, 0, 0.6);
            padding: 30px;
            border-radius: 10px;
            border: 2px solid #444;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            border-bottom: 2px solid #444;
            padding-bottom: 15px;
        }

        .admin-header h2 {
            color: #ffd700;
            font-size: 24px;
            letter-spacing: 1px;
        }

        .tab-buttons {
            display: flex;
            gap: 10px;
        }

        .tab-btn {
            padding: 8px 16px;
            background: #333;
            border: 1px solid #555;
            color: #ccc;
            cursor: pointer;
            border-radius: 4px;
            font-size: 13px;
            transition: all 0.3s;
        }

        .tab-btn.active {
            background: #ffd700;
            color: #000;
            border-color: #ffd700;
        }

        .tab-btn:hover {
            border-color: #ffd700;
            color: #ffd700;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        .content-title {
            color: #ffd700;
            font-size: 18px;
            margin-bottom: 15px;
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(0, 0, 0, 0.4);
            border-radius: 5px;
            overflow: hidden;
        }

        thead {
            background: #ffd700;
            color: #000;
        }

        th {
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #333;
            color: #ddd;
            font-size: 13px;
        }

        tr:hover {
            background: rgba(255, 215, 0, 0.05);
        }
    </style>
</head>
<body>

<div class="main-container">
    <div class="header-section">
        <h1>D-D Raadsels - Beheer</h1>
        <div class="nav-buttons">
            <a href="teamsmaken.php" class="nav-btn">← Terug naar Teams</a>
        </div>
    </div>

    <!-- ADMIN SECTION -->
    <div class="admin-section">
        <div class="admin-header">
            <h2>Beheer Overzicht</h2>
            <div class="tab-buttons">
                <button class="tab-btn active" onclick="switchTab('teams')">Teams</button>
                <button class="tab-btn" onclick="switchTab('raadsels')">Raadsels</button>
                <button class="tab-btn" onclick="switchTab('reviews')">Reviews</button>
            </div>
        </div>

        <!-- Teams Tab -->
        <div id="teams" class="tab-content active">
            <div class="content-title">Overzicht teams</div>
            <?php
            try {
                $stmt = $db_connection->query("SELECT teamnaam, speler1, speler2, speler3, score FROM teams ORDER BY score DESC");
                $teams = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                if (!empty($teams)):
            ?>
            <table>
                <thead>
                    <tr>
                        <th>Team</th>
                        <th>Leden</th>
                        <th>Score</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($teams as $team): 
                        $leden = trim($team['speler1'] . 
                                     (isset($team['speler2']) ? ", " . $team['speler2'] : "") .
                                     (isset($team['speler3']) && $team['speler3'] ? ", " . $team['speler3'] : ""));
                    ?>
                    <tr>
                        <td><?php echo htmlspecialchars($team['teamnaam']); ?></td>
                        <td><?php echo htmlspecialchars($leden); ?></td>
                        <td><?php echo (int)$team['score']; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <?php else: ?>
                <p style="color: #999; margin-top: 20px;">Nog geen teams aangemaakt.</p>
            <?php endif;
            } catch (Exception $e) {
                echo '<p style="color: #c71b1b;">Fout bij laden teams: ' . $e->getMessage() . '</p>';
            }
            ?>
        </div>

        <!-- Raadsels Tab -->
        <div id="raadsels" class="tab-content">
            <div class="content-title">Overzicht raadsels</div>
            <?php
            try {
                $stmt = $db_connection->query("SELECT riddle, answer, hint, roomId FROM riddles ORDER BY roomId");
                $riddles = $stmt->fetchAll(PDO::FETCH_ASSOC);
                
                if (!empty($riddles)):
            ?>
            <table>
                <thead>
                    <tr>
                        <th>Raadsel</th>
                        <th>Antwoord</th>
                        <th>Hint</th>
                        <th>Kamer</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($riddles as $riddle): ?>
                    <tr>
                        <td><?php echo htmlspecialchars(substr($riddle['riddle'], 0, 50)) . '...'; ?></td>
                        <td><?php echo htmlspecialchars($riddle['answer']); ?></td>
                        <td><?php echo htmlspecialchars($riddle['hint']); ?></td>
                        <td><?php echo (int)$riddle['roomId']; ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <?php else: ?>
                <p style="color: #999; margin-top: 20px;">Geen raadsels gevonden.</p>
            <?php endif;
            } catch (Exception $e) {
                echo '<p style="color: #c71b1b;">Fout bij laden raadsels</p>';
            }
            ?>
        </div>

        <!-- Reviews Tab -->
        <div id="reviews" class="tab-content">
            <div class="content-title">Overzicht reviews</div>
            <p style="color: #999; margin-top: 20px;">Reviews functie nog niet ingebouwd.</p>
        </div>
    </div>
</div>

<script>
function switchTab(tabName) {
    // Hide all tabs
    document.querySelectorAll('.tab-content').forEach(tab => {
        tab.classList.remove('active');
    });
    
    // Remove active class from all buttons
    document.querySelectorAll('.tab-btn').forEach(btn => {
        btn.classList.remove('active');
    });
    
    // Show selected tab
    document.getElementById(tabName).classList.add('active');
    
    // Add active class to clicked button
    event.target.classList.add('active');
}
</script>

</body>
</html>
