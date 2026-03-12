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