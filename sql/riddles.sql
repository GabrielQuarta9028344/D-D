CREATE TABLE riddles (
    roomId =1
    roomId=2
);

-- Let op, dit is een voorbeeld!
INSERT INTO riddles (riddle, answer, hint, roomId)
VALUES
  ('Ik hang aan de muur, ik piep als je me aanraakt, en ik laat zien of je nog leeft. Wat ben ik?', 'Je ziet een lijn die op en neer gaat', 'hartmonitor', 1),
('Ik ben klein, scherp en iedereen is bang voor mij, maar zonder mij kun je niet genezen. Wat ben ik?', 'Je krijgt me vaak in je arm', 'naald', 1),
('Ik zie alles, zelfs wat onder je huid zit, maar ik heb geen ogen. Wat ben ik?', 'Je moet stil blijven liggen', 'röntgenapparaat', 1);
INSERT INTO questions (riddle, hint, answer, roomId) VALUES
('Ik ben een deur die alleen opengaat als je het juiste patroon kent. Eén fout en het monster hoort je. Wat ben ik?', 'Je drukt op mij met je vingers', 'codepaneel', 2),
('Ik ben een vloeistof die van kleur verandert als er gevaar is. Wat ben ik?', 'Je vindt me in reageerbuisjes', 'chemische indicator', 2),
('Ik bewaak het geheim van het monster. Ik ben geen mens, maar ik heb wel een mond die nooit praat. Wat ben ik?', 'Je opent me met een sleutel of code', 'kluis', 2);