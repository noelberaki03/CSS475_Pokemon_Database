<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

// Get the Pokemon name from the query string
$pokemon_name = $_GET['name'] ?? null;
if (!$pokemon_name) {
    header("Location: list_pokemon.php");
    exit();
}

$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch all tuples for the given Pokemon name
$pokemon_query = $conn->prepare("
    SELECT p.u_id, p.national_pokedex_id, p.name, p.ability, p.level, p.health_points, p.attack, p.defense, p.special_attack, p.special_defense, p.speed, 
           GROUP_CONCAT(DISTINCT petg.egg_group_name ORDER BY petg.egg_group_name ASC) AS egg_groups
    FROM Pokemon p
    LEFT JOIN Pokemon_Egg_Groups petg ON p.u_id = petg.u_id
    WHERE p.name = ?
    GROUP BY p.u_id
    ORDER BY p.u_id
");
$pokemon_query->bind_param('s', $pokemon_name);
$pokemon_query->execute();
$pokemon_query->bind_result($u_id, $pokedex_id, $name, $ability, $level, $health_points, $attack, $defense, $special_attack, $special_defense, $speed, $egg_groups);
$pokemon_tuples = [];
while ($pokemon_query->fetch()) {
    $pokemon_tuples[] = [
        'u_id' => $u_id,
        'pokedex_id' => $pokedex_id,
        'name' => $name,
        'ability' => $ability,
        'level' => $level,
        'health_points' => $health_points,
        'attack' => $attack,
        'defense' => $defense,
        'special_attack' => $special_attack,
        'special_defense' => $special_defense,
        'speed' => $speed,
        'egg_groups' => $egg_groups
    ];
}
$pokemon_query->close();

// Fetch trainer for each Pokemon tuple
$trainers = [];
foreach ($pokemon_tuples as $tuple) {
    $trainer_query = $conn->prepare("SELECT t.name FROM Trainer t JOIN Trainer_pkmn tp ON t.trainer_id = tp.trainer_id WHERE tp.u_id = ?");
    $trainer_query->bind_param('i', $tuple['u_id']);
    $trainer_query->execute();
    $trainer_query->bind_result($trainer_name);
    if ($trainer_query->fetch()) {
        $trainers[$tuple['u_id']] = $trainer_name;
    } else {
        $trainers[$tuple['u_id']] = "No trainer/Is a wild pokemon";
    }
    $trainer_query->close();
}

$conn->close();
?>
<html>
<head>
    <title>CSS 475 Pokemon Database - Pokemon Details</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Pokemon Details</h2>
    <?php if ($pokemon_tuples): ?>
        <?php foreach ($pokemon_tuples as $tuple): ?>
            <h3>Pokemon (u_id: <?= htmlspecialchars($tuple['u_id']) ?>)</h3>
            <p>
                National Pokedex ID: <?= htmlspecialchars($tuple['pokedex_id']) ?><br>
                Name: <?= htmlspecialchars($tuple['name']) ?><br>
                Ability: <?= htmlspecialchars($tuple['ability']) ?><br>
                Level: <?= htmlspecialchars($tuple['level']) ?><br>
                Health Points: <?= htmlspecialchars($tuple['health_points']) ?><br>
                Attack: <?= htmlspecialchars($tuple['attack']) ?><br>
                Defense: <?= htmlspecialchars($tuple['defense']) ?><br>
                Special Attack: <?= htmlspecialchars($tuple['special_attack']) ?><br>
                Special Defense: <?= htmlspecialchars($tuple['special_defense']) ?><br>
                Speed: <?= htmlspecialchars($tuple['speed']) ?><br>
                Egg Group(s): <?= htmlspecialchars($tuple['egg_groups']) ?><br>
                Trainer: <?= htmlspecialchars($trainers[$tuple['u_id']]) ?>
            </p>
        <?php endforeach; ?>
    <?php else: ?>
        <p>No details found for this Pokemon.</p>
    <?php endif; ?>
</div>
</body>
</html>


