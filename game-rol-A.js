class Maze {
    constructor() {
        this.grid = [
            [0,0,0,1,0,0,0,0,0,0],
            [1,1,0,1,0,1,0,1,0,0],
            [0,0,0,0,0,1,0,0,0,0],
            [0,1,1,1,0,0,0,1,0,0],
            [0,0,0,1,0,1,0,0,0,0],
            [0,1,0,0,0,1,0,1,0,0],
            [0,0,0,1,0,0,0,0,0,0],
            [0,1,0,0,0,1,0,1,0,0],
            [0,0,0,1,0,0,0,0,0,0],
            [0,0,0,1,0,0,0,0,0,0]
        ];

        this.goal = { x: 9, y: 9 };

        this.riddleSpots = [
            { x: 2, y: 2 },
            { x: 7, y: 4 },
            { x: 5, y: 8 }
        ];
    }

    isWalkable(x, y) {
        return (
            x >= 0 &&
            y >= 0 &&
            y < this.grid.length &&
            x < this.grid[0].length &&
            this.grid[y][x] === 0
        );
    }
}

class Player {
    constructor() {
        this.x = 0;
        this.y = 0;
    }

    move(dx, dy, maze) {
        const nx = this.x + dx;
        const ny = this.y + dy;
        if (maze.isWalkable(nx, ny)) {
            this.x = nx;
            this.y = ny;
        }
    }
}

class Entity {
    constructor() {
        this.x = 9;
        this.y = 0;
    }

    chase(player, maze) {
        let dx = player.x > this.x ? 1 : player.x < this.x ? -1 : 0;
        let dy = player.y > this.y ? 1 : player.y < this.y ? -1 : 0;

        const nx = this.x + dx;
        const ny = this.y + dy;

        if (maze.isWalkable(nx, ny)) {
            this.x = nx;
            this.y = ny;
        }
    }
}

class Game {
    constructor() {
        this.maze = new Maze();
        this.player = new Player();
        this.entity = new Entity();

        this.riddles = [];
        this.currentRiddle = 0;
        this.solved = 0;
        this.riddleActive = false;

        this.boardEl = document.getElementById("board");
        this.posEl = document.getElementById("player-pos");
        this.entityPosEl = document.getElementById("entity-pos");
        this.solvedEl = document.getElementById("riddles-solved");
        this.riddleBox = document.getElementById("riddle-box");
        this.riddleQuestion = document.getElementById("riddle-question");
        this.riddleAnswer = document.getElementById("riddle-answer");
        this.riddleFeedback = document.getElementById("riddle-feedback");
        this.winMessage = document.getElementById("win-message");
        this.loseMessage = document.getElementById("lose-message");

        this.loadRiddles().then(() => this.drawBoard());
        this.setupControls();
    }

    async loadRiddles() {
        const res = await fetch("riddles.php");
        this.riddles = await res.json();
    }

    drawBoard() {
        this.boardEl.innerHTML = "";

        for (let y = 0; y < this.maze.grid.length; y++) {
            for (let x = 0; x < this.maze.grid[0].length; x++) {
                const tile = document.createElement("div");
                tile.classList.add("tile");

                if (this.maze.grid[y][x] === 1) tile.classList.add("wall");
                if (x === this.maze.goal.x && y === this.maze.goal.y) tile.classList.add("goal");

                if (this.maze.riddleSpots.some(s => s.x === x && s.y === y)) {
                    tile.classList.add("riddle-spot");
                }

                if (x === this.player.x && y === this.player.y) {
                    tile.classList.add("player");
                    const dot = document.createElement("div");
                    dot.classList.add("player-dot");
                    tile.appendChild(dot);
                }

                if (x === this.entity.x && y === this.entity.y) {
                    tile.classList.add("entity");
                    const dot = document.createElement("div");
                    dot.classList.add("entity-dot");
                    tile.appendChild(dot);
                }

                this.boardEl.appendChild(tile);
            }
        }

        this.updateStatus();
    }

    updateStatus() {
        this.posEl.textContent = `${this.player.x},${this.player.y}`;
        this.entityPosEl.textContent = `${this.entity.x},${this.entity.y}`;
        this.solvedEl.textContent = this.solved;
    }

    setupControls() {
        document.querySelectorAll(".arrows button").forEach(btn => {
            btn.addEventListener("click", () => {
                this.handleMove(btn.dataset.dir);
            });
        });

        document.addEventListener("keydown", e => {
            const map = {
                ArrowUp: "up",
                ArrowDown: "down",
                ArrowLeft: "left",
                ArrowRight: "right"
            };
            if (map[e.key]) this.handleMove(map[e.key]);
        });

        document.getElementById("submit-answer").addEventListener("click", () => {
            this.checkRiddle();
        });
    }

    handleMove(dir) {
        if (this.riddleActive) return;

        const moves = {
            up: [0, -1],
            down: [0, 1],
            left: [-1, 0],
            right: [1, 0]
        };

        const [dx, dy] = moves[dir];
        this.player.move(dx, dy, this.maze);

        this.entity.chase(this.player, this.maze);

        this.drawBoard();
        this.checkTriggers();
    }

    checkTriggers() {
        if (this.entity.x === this.player.x && this.entity.y === this.player.y) {
            this.loseMessage.classList.remove("hidden");
            return;
        }

        const spot = this.maze.riddleSpots.find(s => s.x === this.player.x && s.y === this.player.y);

        if (spot && this.solved < 3) {
            this.startRiddle();
            return;
        }

        if (this.player.x === this.maze.goal.x && this.player.y === this.maze.goal.y) {
            if (this.solved >= 3) {
                this.winMessage.classList.remove("hidden");
            }
        }
    }

    startRiddle() {
    this.riddleActive = true;

    // Toon de riddle box
    this.riddleBox.classList.remove("hidden");

    // Reset feedback en input
    this.riddleFeedback.textContent = "";
    this.riddleAnswer.value = "";

    //  Direct de vraag tonen ONDER de tekst "Raadsel"
    this.riddleQuestion.textContent = this.riddles[this.currentRiddle].question;

    // Focus op het antwoordveld
    this.riddleAnswer.focus();

    }

    checkRiddle() {
        const user = this.riddleAnswer.value.trim().toLowerCase();
        const correct = this.riddles[this.currentRiddle].answer.toLowerCase();

        if (user === correct) {
            this.solved++;
            this.currentRiddle++;
            this.riddleActive = false;
            this.riddleBox.classList.add("hidden");
        } else {
            this.riddleFeedback.textContent = "Fout, probeer opnieuw.";
        }

        this.updateStatus();
    }
}

new Game();