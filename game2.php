<!DOCTYPE html>
<html lang="nl">

<head>
    <meta charset="UTF-8">
    <title>Dead by Daylight Snake</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body class="game2-page">

    <h1>Dead by Daylight: Escape the Killer</h1>
    <p>Besturing: pijltjestoetsen — Restart: R</p>

    <div id="terrorRadius"></div>
    <canvas id="game" width="400" height="400"></canvas>

    <p>Score: <span id="score">0</span></p>
    <p id="status"></p>
    <p>Tijd over: <span id="timer">60</span> seconden</p>

    <div id="riddleBox" class="hidden">
        <h2>Totem Ontdekt</h2>
        <p id="riddleText"></p>
        <input id="answerInput" placeholder="Jouw antwoord...">
        <button id="answerButton">Beantwoord</button>
        <p id="hintText"></p>
    </div>

    <?php
    $riddles = [
        [
            'riddle' => 'Ik heb sleutels maar geen sloten. Ik heb ruimte maar geen kamer. Wat ben ik?',
            'answer' => 'toetsenbord',
            'hint' => 'Je gebruikt het om te typen.'
        ],
        [
            'riddle' => 'Hoe meer je van mij afhaalt, hoe groter ik word. Wat ben ik?',
            'answer' => 'gat',
            'hint' => 'Je graaft het.'
        ],
        [
            'riddle' => 'Ik ga rond de wereld maar blijf altijd in een hoek. Wat ben ik?',
            'answer' => 'postzegel',
            'hint' => 'Je plakt mij op een envelop.'
        ]
    ];

    if (file_exists('./dbcon.php')) {
        require_once('./dbcon.php');

        try {
            $stmt = $db_connection->query("SELECT * FROM riddles WHERE roomId = 2");
            $dbRiddles = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($dbRiddles)) {
                $riddles = $dbRiddles;
            }
        } catch (PDOException $e) {
        }
    }
    ?>

    <script>
        // Define the size of each grid box
        const box = 20;

        // Get the canvas and its context
        const canvas = document.getElementById("game");
        const ctx = canvas.getContext("2d");

        // Define the timer element
        const timerElement = document.getElementById("timer");

        // Initialize killerTick for controlling killer movement speed
        let killerTick = 0;

        // Initialize gameReady to false at the start of the script
        let gameReady = false;

        // Initialize movement variables for the snake
        let dx = 0; // Horizontal movement
        let dy = 0; // Vertical movement

        const riddles = <?php echo json_encode($riddles, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); ?>;

        let snake = [];
        let food;
        let totem;
        let killer;
        let score = 0;
        let killerSpeed = 12;
        let currentRiddle = null;
        let timeLeft = 60;
        let timerId = null;
        let solvedRiddles = 0;

        // Initialize riddleActive to false at the start of the script
        let riddleActive = false;

        // Initialize gameOver to false at the start of the script
        let gameOver = false;

        function startTimer() {
            if (timerId) {
                clearInterval(timerId);
            }

            timerId = setInterval(() => {
                if (gameOver || riddleActive) return;

                timeLeft--;
                timerElement.innerText = timeLeft;

                if (timeLeft <= 0) {
                    clearInterval(timerId);
                    endGame("lose");
                }
            }, 1000);
        }

        function restartGame() {
            if (!riddles.length) {
                console.error('Riddles not loaded yet. Cannot start game.');
                return;
            }

            gameReady = true; // Allow game loop to run

            snake = [{
                x: 10 * box,
                y: 10 * box
            }];
            dx = box;
            dy = 0;
            food = randomPosition();
            totem = randomPosition();
            score = 0;
            solvedRiddles = 0;
            gameOver = false;
            riddleActive = false;
            killer = {
                x: 0,
                y: 0
            };
            killerSpeed = 12;
            document.getElementById("score").innerText = score;
            document.getElementById("riddleBox").classList.add("hidden");
            timeLeft = 60; // Reset timer
            timerElement.innerText = timeLeft;
            startTimer(); // Start the timer when the game restarts
        }

        function randomPosition() {
            return {
                x: Math.floor(Math.random() * (canvas.width / box)) * box,
                y: Math.floor(Math.random() * (canvas.height / box)) * box
            };
        }

        document.addEventListener("keydown", function(e) {
            if (riddleActive) return;

            if (e.key === "ArrowUp" && dy === 0) {
                dx = 0;
                dy = -box;
            } else if (e.key === "ArrowDown" && dy === 0) {
                dx = 0;
                dy = box;
            } else if (e.key === "ArrowLeft" && dx === 0) {
                dx = -box;
                dy = 0;
            } else if (e.key === "ArrowRight" && dx === 0) {
                dx = box;
                dy = 0;
            }

            if (gameOver && e.key.toLowerCase() === "r") restartGame();
        });

        setInterval(gameLoop, 120);

        function gameLoop() {
            if (!gameReady || gameOver || riddleActive) return;
            moveSnake();
            moveKiller();
            checkCollision();
            draw();
        }

        function moveSnake() {
            const head = {
                x: snake[0].x + dx,
                y: snake[0].y + dy
            };
            snake.unshift(head);

            if (head.x === food.x && head.y === food.y) {
                score++;
                document.getElementById("score").innerText = score;
                food = randomPosition();

                if (score >= 10) return endGame("win");

            } else if (head.x === totem.x && head.y === totem.y) {
                totem = randomPosition();
                currentRiddle = riddles[Math.floor(Math.random() * riddles.length)];

                triggerRiddle();
            } else {
                snake.pop();
            }
        }

        function moveKiller() {
            killerTick++;
            if (killerTick < killerSpeed) return;
            killerTick = 0;

            if (killer.x < snake[0].x) killer.x += box;
            else if (killer.x > snake[0].x) killer.x -= box;

            if (killer.y < snake[0].y) killer.y += box;
            else if (killer.y > snake[0].y) killer.y -= box;

            updateTerrorRadius();
        }

        function updateTerrorRadius() {
            const dist = Math.abs(killer.x - snake[0].x) + Math.abs(killer.y - snake[0].y);
            const bar = document.getElementById("terrorRadius");

            if (dist < 80) bar.style.opacity = 1;
            else if (dist < 160) bar.style.opacity = 0.5;
            else bar.style.opacity = 0;
        }

        function checkCollision() {
            const head = snake[0];

            if (head.x < 0 || head.x >= canvas.width || head.y < 0 || head.y >= canvas.height)
                return endGame("lose");

            for (let i = 1; i < snake.length; i++)
                if (head.x === snake[i].x && head.y === snake[i].y)
                    return endGame("lose");

            if (head.x === killer.x && head.y === killer.y)
                return endGame("lose");
        }

        function endGame(result) {
            gameOver = true;
            if (timerId) {
                clearInterval(timerId);
            }

            if (result === "win") {
                setTimeout(() => {
                    window.location.href = "win.php";
                }, 1000);
            } else {
                setTimeout(() => {
                    const restart = confirm("Je hebt verloren! Wil je opnieuw spelen?");
                    if (restart) {
                        restartGame();
                    } else {
                        window.location.href = "lose.php";
                    }
                }, 1000);
            }
        }

        function draw() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            ctx.fillStyle = "lime";
            snake.forEach(p => ctx.fillRect(p.x, p.y, box, box));

            ctx.fillStyle = "red";
            ctx.fillRect(food.x, food.y, box, box);

            ctx.fillStyle = "yellow";
            ctx.fillRect(totem.x, totem.y, box, box);

            ctx.fillStyle = "purple";
            ctx.fillRect(killer.x, killer.y, box, box);
        }

        function triggerRiddle() {
            riddleActive = true;
            currentRiddle = riddles[Math.floor(Math.random() * riddles.length)];

            document.getElementById("riddleText").innerText = currentRiddle.riddle;
            document.getElementById("hintText").innerText = "";
            document.getElementById("answerInput").value = "";
            document.getElementById("riddleBox").classList.remove("hidden");
        }

        document.getElementById("answerButton").addEventListener("click", checkAnswer);

        function checkAnswer() {
            const input = document.getElementById("answerInput").value.trim().toLowerCase();
            if (input === currentRiddle.answer.toLowerCase()) {
                solvedRiddles++;
                riddleActive = false;
                document.getElementById("riddleBox").classList.add("hidden");
                // Check if all riddles are solved
                if (solvedRiddles >= riddles.length) {
                    setTimeout(() => {
                        window.location.href = 'Game-Rol-A.php';
                    }, 2000); // Redirect after 2 seconds
                }
            } else {
                document.getElementById("hintText").innerText = "Hint: " + currentRiddle.hint;
                killerSpeed = Math.max(3, killerSpeed - 1); // Reduce killer speed as a penalty
            }
        }

        restartGame();
    </script>

</body>

</html>