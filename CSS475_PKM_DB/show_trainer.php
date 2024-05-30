<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

$trainer_id = $_GET['id'] ?? null;
if (!$trainer_id) {
    header("Location: list_trainers.php");
    exit();
}

$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch trainer basic information and archetype
$trainer_query = $conn->prepare("
    SELECT t.name, a.archetype_name
    FROM Trainer t
    LEFT JOIN Trainer_Archetype ta ON ta.trainer_id = t.trainer_id
    LEFT JOIN Archetype a ON a.archetype_id = ta.archetype_id
    WHERE t.trainer_id = ?");
$trainer_query->bind_param('i', $trainer_id);
$trainer_query->execute();
$trainer_query->bind_result($trainer_name, $archetype_name);
$trainer_query->fetch();
$trainer_query->close();

// Fetch all badges information
$badges_query = $conn->prepare("
    SELECT b.badge_name
    FROM Badge b
    JOIN Trainer_Badges tb ON tb.badge_id = b.badge_id
    WHERE tb.trainer_id = ?");
$badges_query->bind_param('i', $trainer_id);
$badges_query->execute();
$badges = [];
$badge_name = null;
$badges_query->bind_result($badge_name);
while ($badges_query->fetch()) {
    $badges[] = $badge_name;
}
$badges_query->close();

// Fetch all items information
$items_query = $conn->prepare("
    SELECT i.item_id, i.name
    FROM Item i
    JOIN Trainer_Item ti ON ti.item_id = i.item_id
    WHERE ti.trainer_id = ?");
$items_query->bind_param('i', $trainer_id);
$items_query->execute();
$items = [];
$item_id = null;
$item_name = null;
$items_query->bind_result($item_id, $item_name);
while ($items_query->fetch()) {
    $items[] = ['item_id' => $item_id, 'name' => $item_name];
}
$items_query->close();

// Fetch all Pokémon information
$pokemon_query = $conn->prepare("
    SELECT p.u_id, p.name
    FROM Pokemon p
    JOIN Trainer_pkmn tp ON tp.u_id = p.u_id
    WHERE tp.trainer_id = ?");
$pokemon_query->bind_param('i', $trainer_id);
$pokemon_query->execute();
$pokemon = [];
$pokemon_id = null;
$pokemon_name = null;
$pokemon_query->bind_result($pokemon_id, $pokemon_name);
while ($pokemon_query->fetch()) {
    $pokemon[] = ['u_id' => $pokemon_id, 'name' => $pokemon_name];
}
$pokemon_query->close();

$conn->close();
?>
<html>
<head>
    <title>View Trainer Details</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Trainer Details</h2>
    <p>Trainer Name: <?= htmlspecialchars($trainer_name) ?><br>
       Archetype: <?= htmlspecialchars($archetype_name) ?><br>
       Badges (<?= count($badges) ?>): <?= implode(', ', $badges) ?><br>
       Items (<?= count($items) ?>): <?php foreach ($items as $item) echo $item['name'] . " (ID: " . $item['item_id'] . "), "; ?><br>
       Pokémon: <?php foreach ($pokemon as $pkm) echo $pkm['name'] . " (ID: " . $pkm['u_id'] . "), "; ?></p>
</div>
</body>
</html>


