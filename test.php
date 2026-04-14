<?php

class RiddleProvider {
    private array $riddles = [
        ["question" => "Ik ben een apparaat dat je helpt te ontsnappen, maar ik ben ook een valstrik. Wat ben ik?", "answer" => "valdeur"],
        ["question" => "Ik ben een sleutel die alleen werkt als je de juiste volgorde volgt. Wat ben ik?", "answer" => "schakelaar"],
        ["question" => "Ik ben een raadsel dat je moet oplossen om te ontsnappen. Wat ben ik?", "answer" => "puzzel"],

    ];

    public function getRiddles(int $count = 3): array {
        shuffle($this->riddles);
        return array_slice($this->riddles, 0, $count);
    }
}

header("Content-Type: application/json");

$provider = new RiddleProvider();
echo json_encode($provider->getRiddles(), JSON_UNESCAPED_UNICODE);