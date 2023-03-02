<?php
// connect to database
$pdo = new PDO('mysql:host=localhost;dbname=jokes', 'root', '');

// get POST data
$joke_id = $_POST['joke_id'];
$vote_type = $_POST['vote_type'];

// record vote in database
$stmt = $pdo->prepare('INSERT INTO votes (joke_id, vote_type) VALUES (?, ?)');
$stmt->execute(array($joke_id, $vote_type));

// get another joke
$stmt = $pdo->prepare('SELECT id FROM jokes WHERE id NOT IN (SELECT joke_id FROM votes WHERE joke_id IS NOT NULL) ORDER BY RAND() LIMIT 1');
$stmt->execute();
$joke = $stmt->fetch(PDO::FETCH_ASSOC);

// set cookie with ID of joke
$seen_jokes = explode(',', $_COOKIE['seen_jokes']);
$seen_jokes[] = $joke['id'];
setcookie('seen_jokes', implode(',', $seen_jokes));

// return response
echo 'success';
?>
