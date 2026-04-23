<!DOCTYPE html>
<html lang="nl">
<head>
<meta charset="UTF-8">
<title>You Escaped</title>
<style>
    body { margin: 0; background: #000; color: #0f0; font-family: Arial; text-align: center; }
    h1 { margin-top: 150px; font-size: 60px; text-shadow: 0 0 20px lime; }
    p { color: #ccc; }
    button { padding: 12px 25px; background: #0f0; border: none; cursor: pointer; margin-top: 30px; }
    .button-row { display: flex; justify-content: center; gap: 16px; flex-wrap: wrap; margin-top: 20px; }
</style>
</head>
<body>

<h1>You Escaped</h1>
<p>Je hebt de proef overleefd. De Entiteit is niet tevreden…</p>

<div class="button-row">
    <button onclick="window.location.href='index.php'">Opnieuw spelen</button>
    <button onclick="window.location.href='review.php'">Naar review</button>
</div>

</body>
</html>