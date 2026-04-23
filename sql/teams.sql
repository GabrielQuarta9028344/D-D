CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teamnaam VARCHAR(100) NOT NULL,
    speler1 VARCHAR(100) NOT NULL,
    speler2 VARCHAR(100) NOT NULL,
    speler3 VARCHAR(100),
    score INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Voorbeeldgegevens:
INSERT INTO teams (teamnaam, speler1, speler2, speler3, score)
VALUES 
    ('Team Alpha', 'Jan Jansen', 'Marie Müller', 'Hans Huber', 85),
    ('Team Beta', 'Lisa Schmidt', 'Marco Bianchi', NULL, 92),
    ('Team Gamma', 'Sophie Dupont', 'Pietro Rossi', 'Ana Silva', 78);
