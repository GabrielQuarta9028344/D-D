CREATE TABLE riddles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    riddle VARCHAR(255) NOT NULL,
    answer VARCHAR(100) NOT NULL,
    hint VARCHAR(255),
    roomId INT NOT NULL
);


                  INSERT INTO riddles (riddle, hint, answer, roomId)
                  VALUES
                    ('Ik hang aan de muur, ik piep als je me aanraakt, en ik laat zien of je nog leeft. Wat ben ik?', 'hartmonitor', 1),
                 ('Ik ben klein, scherp en iedereen is bang voor mij, maar zonder mij kun je niet genezen. Wat ben ik?', 'Je krijgt me vaak in je arm', 'naald', 1),
                  ('Ik zie alles, zelfs wat onder je huid zit, maar ik heb geen ogen. Wat ben ik?', 'Je moet stil blijven liggen', 'röntgenapparaat', 1);

                  INSERT INTO riddles (riddle,answer, hint, roomId) VALUES
                  ('Ik ben een deur die alleen opengaat als je het juiste patroon kent. Eén fout en het monster hoort je. Wat ben ik?', 'codepaneel', 'Je drukt op mij met je vingers', 2),
                  ('Ik ben een vloeistof die van kleur verandert als er gevaar is. Wat ben ik?', 'chemische indicator', 'Je vindt me in reageerbuisjes', 2),
                  ('Ik bewaak het geheim van het monster. Ik ben geen mens, maar ik heb wel een mond die nooit praat. Wat ben ik?', 'kluis', 'Je opent me met een sleutel of code', 2);

                  INSERT INTO riddles (riddle,answer, hint, roomId) VALUES
                  ('Ik ben een apparaat dat je helpt te ontsnappen, maar ik ben ook een valstrik. Wat ben ik?', 'valdeur', 'Je moet me openen om verder te gaan', 3),
                  ('Ik ben een sleutel die alleen werkt als je de juiste volgorde volgt. Wat ben ik?', 'schakelaar', 'Je drukt op mij in een bepaalde volgorde', 3),
                  ('Ik ben een raadsel dat je moet oplossen om te ontsnappen. Wat ben ik?', 'puzzel', 'Je moet logisch nadenken om me op te lossen', 3);