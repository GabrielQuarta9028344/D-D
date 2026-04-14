<?php
// Retour raadsels als JSON
$riddles = [
    [
        'riddle' => 'Ik hang aan de muur, ik piep als je me aanraakt, en ik laat zien of je nog leeft. Wat ben ik?',
        'answer' => 'hartmonitor',
        'hint' => 'hartmonitor',
        'roomId' => 1
    ],
    [
        'riddle' => 'Ik ben klein, scherp en iedereen is bang voor mij, maar zonder mij kun je niet genezen. Wat ben ik?',
        'answer' => 'naald',
        'hint' => 'Je krijgt me vaak in je arm',
        'roomId' => 1
    ],
    [
        'riddle' => 'Ik zie alles, zelfs wat onder je huid zit, maar ik heb geen ogen. Wat ben ik?',
        'answer' => 'röntgenapparaat',
        'hint' => 'Je moet stil blijven liggen',
        'roomId' => 1
    ]
];

header('Content-Type: application/json');
echo json_encode($riddles);
?>