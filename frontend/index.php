<?php

$pdo = new PDO('mysql:host=localhost; dbname=jokes', 'root', '');

// check if user has seen any jokes
if (isset($_COOKIE['seen_jokes'])) {
    $seen_jokes = explode(',', $_COOKIE['seen_jokes']);
} else {
    $seen_jokes = array();
}

// get a random joke that the user hasn't seen
$stmt = $pdo->prepare('SELECT id, joke_content FROM jokes WHERE id NOT IN (' . str_repeat('?,', count($seen_jokes) - 1) . '?) ORDER BY RAND() LIMIT 1');
$stmt->execute($seen_jokes);
$joke = $stmt->fetch(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="logo">
            <a href="" class="logo">Logo</a>
        </div>
        <div class="user">
            <a href="">
                <img src="./avatar.png" alt="user-img" class ="user img-circle">
            </a>
        </div>
    </header>
    <section>
        <div class="title">
            <h1>A joke a day keeps the doctor away</h1><br>
            <p> If you joke wrong way, your teeth have to pay. (Serious)</p>
        </div>
        <div class="content">
            <?php
            if (!$joke) {
                echo "That's all the jokes for today! Come back another day!";
            } else {
                // set cookie with ID of joke
                $seen_jokes[] = $joke['id'];
                setcookie('seen_jokes', implode(',', $seen_jokes));
            
                // display joke and like/dislike buttons

                echo '<p>' . $joke['joke_content'] . '</p> <br>' ;
                echo '<br><hr style="width: 50%; margin-left: auto; margin-right: auto;  border: 1px solid #f8f8f8;">';
                echo '<button type="button" class="btn btn-yes" onclick="vote(' . $joke['id'] . ', \'like\')">This is funny!</button> &nbsp ';
                echo '<button type="button" class="btn btn-not" onclick="vote(' . $joke['id'] . ', \'dislike\')">Dislike</button>';
            }
            ?>
        </div>
    </section>
    <footer>
        <hr>
        <p style="color: #969696">This website is created as part of Hlsolutions program. The materials contained on this website are provided for general information only and do not constitute any form ofadvice. HLS assumes no responsibility for the accuracy of any particular statement and accepts no liability for any loss or damage which may arise from reliance on the information contained on this site.</p>
        <p>Copyright 2021 HLS</p>
    </footer>

</body>
</html>

<script>
function vote(jokeId, voteType) {
    // send AJAX request to record vote
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'vote.php', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4 && xhr.status == 200) {
            // display next joke
            location.reload();
        }
    };
    xhr.send('joke_id=' + encodeURIComponent(jokeId) + '&vote_type=' + encodeURIComponent(voteType));
}
</script>
