
 <?php
header('Content-Type: application/json; charset=utf-8');

$riddles = [
    [
        'riddle' => 'Ik hang aan de muur, ik piep als je me aanraakt, en ik laat zien of je nog leeft. Wat ben ik?',
        'answer' => 'hartmonitor'
    ],
    [
        'riddle' => 'Ik ben klein, scherp en iedereen is bang voor mij, maar zonder mij kun je niet genezen. Wat ben ik?',
        'answer' => 'naald'
    ],
    [
        'riddle' => 'Ik zie alles, zelfs wat onder je huid zit, maar ik heb geen ogen. Wat ben ik?',
        'answer' => 'röntgenapparaat'
    ]
];

echo json_encode($riddles, JSON_UNESCAPED_UNICODE);