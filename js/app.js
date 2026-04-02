//game1
 const canvas = document.getElementById('gameCanvas');
    const ctx = canvas.getContext('2d');
    const tileSize = 18;
    const cols = 20;
    const rows = 20;

    let grid, pacman, direction, score, collected, totalPellets;
    let monster; // traag achtervolgende vijand
    let pacmanTimer = 5;
    let monsterTimer = 0;
    let riddleTimer = 0;
    let riddles = [0];
    let riddleState = null;
    let paused = false;
    let showingRiddles = false;
    let riddleIndex = 0;

    function resetGame() {
      grid = Array(rows).fill(null).map(() => Array(cols).fill(1));
      for (let y = 1; y < rows - 1; y++) {
        for (let x = 1; x < cols - 1; x++) {
          grid[y][x] = 0;
        }
      }
      // Maak een klein doolhof met randen en enkele muren
      for (let i = 1; i < cols - 1; i++) {
        grid[1][i] = grid[rows-2][i] = 1;
      }
      for (let i = 1; i < rows - 1; i++) {
        grid[i][1] = grid[i][cols-2] = 1;
      }
      for (let i = 4; i < cols-4; i++) {
        grid[6][i] = grid[rows-7][i] = 1;
      }

      // Plaats pellets en koppel raadsels op speciale pelletes
      collected = 0;
      score = 0;
      totalPellets = 0;
      let riddleIndex = 0;
      for (let y = 1; y < rows - 1; y++) {
        for (let x = 1; x < cols - 1; x++) {
          if (grid[y][x] === 0) {
            grid[y][x] = 2;
            totalPellets++;
          }
        }
      }
      // steek hier riddle-markers in de eerste riddle
      for (let y = 2; y < rows - 2 && riddleIndex < riddles.length; y += 3) {
        for (let x = 2; x < cols - 2 && riddleIndex < riddles.length; x += 3) {
          if (grid[y][x] === 2) {
            grid[y][x] = 3; // speciale pellet
            riddleIndex++;
          }
        }
      }
      totalPellets = totalPellets;
      document.getElementById('total').innerText = totalPellets;

      pacman = { x: 2, y: 2 };
      direction = { x: 1, y: 0 };
      monster = { x: cols - 3, y: rows - 3 };
      pacmanTimer = 0;
      monsterTimer = 0;
      riddleTimer = 0;
      paused = false;
      riddleState = null;
      updateScoreboard();
    }

    function loadRiddles() {
      fetch('rooms/riddles_json.php')
        .then(response => response.json())
        .then(data => {
          console.log('Riddles geladen:', data);
          riddles = data;
          resetGame();
          requestAnimationFrame(gameLoop);
        })
        .catch(error => {
          console.error('Kan raadsels laden:', error);
          riddles = [{ riddle: 'No raadsels geladen', answer: 'test' }];
          resetGame();
          requestAnimationFrame(gameLoop);
        });
    }

    function updateScoreboard() {
      document.getElementById('score').innerText = score;
      document.getElementById('collected').innerText = collected;
      document.getElementById('total').innerText = totalPellets;
    }

    function drawGame() {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      for (let y = 0; y < rows; y++) {
        for (let x = 0; x < cols; x++) {
          const val = grid[y][x];
          if (val === 1) {
            ctx.fillStyle = 'blue';
            ctx.fillRect(x * tileSize, y * tileSize, tileSize, tileSize);
          } else if (val === 2 || val === 3) {
            ctx.fillStyle = val === 3 ? 'blue' : 'white';
            ctx.beginPath();
            ctx.arc(x * tileSize + tileSize/2, y * tileSize + tileSize/2, 3, 0, Math.PI * 2);
            ctx.fill();
          }
        }
      }
      // draw pacman
      ctx.fillStyle = 'yellow';
      ctx.beginPath();
      ctx.arc(pacman.x * tileSize + tileSize/2, pacman.y * tileSize + tileSize/2, tileSize/2 - 2, 0, Math.PI * 2);
      ctx.fill();

      // draw monster
      ctx.fillStyle = 'red';
      ctx.beginPath();
      ctx.arc(monster.x * tileSize + tileSize/2, monster.y * tileSize + tileSize/2, tileSize/2 - 2, 0, Math.PI * 2);
      ctx.fill();
    }

    function openModal(index) {
      console.log('openModal called, index:', index, 'riddles:', riddles, 'riddles.length:', riddles.length);
      if (!riddles[index]) {
        console.error('Riddle not found at index:', index);
        return;
      }
      riddleState = index;
      const riddle = riddles[index];
      console.log('Setting riddle:', riddle);
      document.getElementById('riddle').innerText = riddle.riddle;
      document.getElementById('answer').value = '';
      document.getElementById('feedback').innerText = '';
      document.getElementById('modal').dataset.answer = riddle.answer;
      document.getElementById('overlay').style.display = 'block';
      document.getElementById('modal').style.display = 'block';
      document.getElementById('answer').focus();
      paused = true;
      console.log('Modal opened, paused set to true');
    }

    function closeModal() {
      document.getElementById('overlay').style.display = 'none';
      document.getElementById('modal').style.display = 'none';
      document.getElementById('feedback').innerText = '';
      if (riddleState === null) return;

      paused = false;
      showingRiddles = false;
      riddleState = null;
    }

    function checkAnswer() {
      const userAnswer = document.getElementById('answer').value.trim();
      const correctAnswer = document.getElementById('modal').dataset.answer.trim();
      const feedback = document.getElementById('feedback');
      if (userAnswer.toLowerCase() === correctAnswer.toLowerCase()) {
        feedback.style.color = 'lightgreen';
        feedback.innerText = 'Correct! De game gaat verder.';
        setTimeout(closeModal, 900);
      } else {
        feedback.style.color = 'red';
        feedback.innerText = 'Fout, probeer nog een keer.';
      }
    }

    function gameLoop() {
      if (!paused) {
        // Pacman beweegt elke 5 frames (sneller dan monster maar nog steeds langzaam)
        pacmanTimer++;
        if (pacmanTimer >= 5) {
          pacmanTimer = 0;
          const nextX = pacman.x + direction.x;
          const nextY = pacman.y + direction.y;
          if (nextX >= 0 && nextX < cols && nextY >= 0 && nextY < rows && grid[nextY][nextX] !== 1) {
            pacman.x = nextX;
            pacman.y = nextY;
            const cell = grid[nextY][nextX];
            if (cell === 2 || cell === 3) {
              grid[nextY][nextX] = 0;
              collected++;
              score += (cell === 3 ? 50 : 10);
              console.log('Coin collected, type:', cell, 'collected:', collected, 'cell === 3:', cell === 3);
              // Als blauwe coin en genoeg coins verzameld: raadsel tonen
              if (cell === 3 && collected >= 10) {
                console.log('Blue coin raadsel trigger - showing riddle');
                paused = true;
                showingRiddles = true;
                riddleIndex = Math.floor(Math.random() * riddles.length);
                openModal(riddleIndex);
              }
              updateScoreboard();
            }
          }
        }

        // Monster beweegt heel traag (1 elke 20 frames)
        monsterTimer++;
        if (monsterTimer >= 20) {
          monsterTimer = 0;
          let dx = pacman.x - monster.x;
          let dy = pacman.y - monster.y;
          let stepX = 0, stepY = 0;
          if (Math.abs(dx) > Math.abs(dy)) {
            stepX = dx > 0 ? 1 : -1;
          } else if (dy !== 0) {
            stepY = dy > 0 ? 1 : -1;
          }

          let tryX = monster.x + stepX;
          let tryY = monster.y + stepY;
          if (tryX >= 0 && tryX < cols && tryY >= 0 && tryY < rows && grid[tryY][tryX] !== 1) {
            monster.x = tryX;
            monster.y = tryY;
          } else {
            // fallback: probeer andere richting
            if (stepX !== 0 && monster.y + (dy > 0 ? 1 : -1) >= 0 && monster.y + (dy > 0 ? 1 : -1) < rows && grid[monster.y + (dy > 0 ? 1 : -1)][monster.x] !== 1) {
              monster.y += (dy > 0 ? 1 : -1);
            } else if (stepY !== 0 && monster.x + (dx > 0 ? 1 : -1) >= 0 && monster.x + (dx > 0 ? 1 : -1) < cols && grid[monster.y][monster.x + (dx > 0 ? 1 : -1)] !== 1) {
              monster.x += (dx > 0 ? 1 : -1);
            }
          }
        }

        // Blauwe coins (raadsels) verplaatsen elke 60 frames
        riddleTimer++;
        if (riddleTimer >= 60) {
          riddleTimer = 0;
          for (let y = 0; y < rows; y++) {
            for (let x = 0; x < cols; x++) {
              if (grid[y][x] === 3) {
                // Probeer willekeurig te verplaatsen
                const directions = [
                  {dx: 1, dy: 0}, {dx: -1, dy: 0}, 
                  {dx: 0, dy: 1}, {dx: 0, dy: -1}
                ];
                const randomDir = directions[Math.floor(Math.random() * directions.length)];
                const newX = x + randomDir.dx;
                const newY = y + randomDir.dy;
                
                if (newX >= 0 && newX < cols && newY >= 0 && newY < rows && grid[newY][newX] === 2) {
                  grid[y][x] = 2;
                  grid[newY][newX] = 3;
                }
              }
            }
          }
        }

        // Botsing check
        if (monster.x === pacman.x && monster.y === pacman.y) {
          paused = true;
          setTimeout(() => alert('Het monster heeft je te pakken! Probeer opnieuw.'), 50);
        }

        drawGame();
      }
      requestAnimationFrame(gameLoop);
    }

    window.addEventListener('keydown', e => {
      if (paused) return;
      switch (e.key) {
        case 'ArrowUp': direction = { x: 0, y: -1 }; break;
        case 'ArrowDown': direction = { x: 0, y: 1 }; break;
        case 'ArrowLeft': direction = { x: -1, y: 0 }; break;
        case 'ArrowRight': direction = { x: 1, y: 0 }; break;
      }
    });

    document.getElementById('submitAnswer').addEventListener('click', checkAnswer);
    document.getElementById('newGame').addEventListener('click', () => {
      resetGame();
    });

    loadRiddles();
















// Deze functie opent de modal en toont de vraag
function openModal(index) {
  // Zoek het element met de class 'box' en het bijbehorende data-index
  let box = document.querySelector(`.box[data-index='${index}']`);

  // Haal de vraag en het juiste antwoord uit de dataset van de box
  let riddleText = box.dataset.riddle;
  let correctAnswer = box.dataset.answer;

  // Zet de vraagtekst in het modalvenster
  document.getElementById('riddle').innerText = riddleText;

  // Zet het correcte antwoord in de modal, zodat we het later kunnen vergelijken
  document.getElementById('modal').dataset.answer = correctAnswer;

  // Maak het antwoordveld leeg
  document.getElementById('answer').value = '';

  // Toon de overlay en de modal door de display-stijl te veranderen naar 'block'
  document.getElementById('overlay').style.display = 'block';
  document.getElementById('modal').style.display = 'block';
}

// Deze functie sluit de modal en de overlay
function closeModal() {
  // Zet de overlay en modal weer op 'none' zodat ze niet meer zichtbaar zijn
  document.getElementById('overlay').style.display = 'none';
  document.getElementById('modal').style.display = 'none';

  // Maak de feedback tekst leeg
  document.getElementById('feedback').innerText = '';
}

// Deze functie controleert of het ingevoerde antwoord correct is
function checkAnswer() {
  // Haal het antwoord van de gebruiker op uit het invoerveld en verwijder onnodige spaties
  let userAnswer = document.getElementById('answer').value.trim();

  // Haal het juiste antwoord op uit de modal
  let correctAnswer = document.getElementById('modal').dataset.answer;

  // Haal het feedback element op om de gebruiker te informeren
  let feedback = document.getElementById('feedback');

  // Vergelijk het antwoord van de gebruiker met het juiste antwoord (hoofdlettergevoeligheid negeren)
  if (userAnswer.toLowerCase() === correctAnswer.toLowerCase()) {
    // Als het antwoord juist is, geef positieve feedback
    feedback.innerText = 'Correct! Goed gedaan!';
    feedback.style.color = 'green';

    // Sluit de modal na 1 seconde
    setTimeout(closeModal, 1000);
  } else {
    // Als het antwoord fout is, geef negatieve feedback
    feedback.innerText = 'Fout, probeer opnieuw!';
    feedback.style.color = 'red';
  }
}

/* Timer  */
const timerEl = document.getElementById('timer');
    const statusEl = document.getElementById('statusText');
    const minutesInput = document.getElementById('minutesInput');
    const bloodFill = document.getElementById('bloodFill');

    const startBtn = document.getElementById('startBtn');
    const pauseBtn = document.getElementById('pauseBtn');
    const resetBtn = document.getElementById('resetBtn');

    let totalSeconds = 5 * 60;
    let remainingSeconds = totalSeconds;
    let intervalId = null;
    let isRunning = false;

    function formatTime(sec) {
      const m = Math.floor(sec / 60);
      const s = sec % 60;
      return (m < 10 ? '0' + m : m) + ':' + (s < 10 ? '0' + s : s);
    }

    function updateDisplay() {
      timerEl.textContent = formatTime(remainingSeconds);
      const ratio = remainingSeconds / totalSeconds;
      bloodFill.style.transform = 'scaleX(' + ratio + ')';

      if (remainingSeconds <= 10 && remainingSeconds > 0) {
        statusEl.textContent = 'De Killer is vlakbij... REN!';
      } else if (remainingSeconds === 0) {
        statusEl.textContent = 'Je bent geofferd aan de Entiteit.';
      } else {
        statusEl.textContent = '';
      }
    }

    function startTimer() {
      if (isRunning) return;
      if (remainingSeconds <= 0) return;

      isRunning = true;
      startBtn.disabled = true;
      pauseBtn.disabled = false;

      intervalId = setInterval(() => {
        remainingSeconds--;
        updateDisplay();

        if (remainingSeconds <= 0) {
          clearInterval(intervalId);
          isRunning = false;
          remainingSeconds = 0;
          updateDisplay();
          startBtn.disabled = true;
          pauseBtn.disabled = true;
        }
      }, 1000);
    }

    function pauseTimer() {
      if (!isRunning) return;
      clearInterval(intervalId);
      isRunning = false;
      startBtn.disabled = false;
      pauseBtn.disabled = true;
    }

    function resetTimer() {
      clearInterval(intervalId);
      isRunning = false;

      const mins = Math.max(1, Math.min(60, parseInt(minutesInput.value) || 5));
      totalSeconds = mins * 60;
      remainingSeconds = totalSeconds;

      startBtn.disabled = false;
      pauseBtn.disabled = true;
      updateDisplay();
    }

    startBtn.addEventListener('click', startTimer);
    pauseBtn.addEventListener('click', pauseTimer);
    resetBtn.addEventListener('click', resetTimer);

    // Init
    updateDisplay();
/* Timer  */


/* game2 */

/* game2 */