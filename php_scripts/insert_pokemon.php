<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

$pokemon_inserted = false;
$new_pokemon = null;
$egg_group_name = '';
$type_name = '';

// Fetch egg groups and types for the dropdown menus
$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$egg_groups_result = $conn->query("SELECT egg_group_name FROM Egg_Group");
$types_result = $conn->query("SELECT type_name FROM In_World_Type");

$egg_groups = [];
$types = [];

while ($row = $egg_groups_result->fetch_assoc()) {
    $egg_groups[] = $row['egg_group_name'];
}

while ($row = $types_result->fetch_assoc()) {
    $types[] = $row['type_name'];
}

$egg_groups_result->close();
$types_result->close();

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $national_pokedex_id = $_POST['national_pokedex_id'] ?? 0;
    $name = $_POST['name'] ?? '';
    $ability = $_POST['ability'] ?? '';
    $level = $_POST['level'] ?? 0;
    $health_points = $_POST['health_points'] ?? 0;
    $attack = $_POST['attack'] ?? 0;
    $defense = $_POST['defense'] ?? 0;
    $special_attack = $_POST['special_attack'] ?? 0;
    $special_defense = $_POST['special_defense'] ?? 0;
    $speed = $_POST['speed'] ?? 0;
    $egg_group_name = $_POST['egg_group_name'] ?? '';
    $type_name = $_POST['type_name'] ?? '';

    if (!empty($name) && !empty($egg_group_name) && !empty($type_name)) {
        $stmt = $conn->prepare("INSERT INTO Pokemon (national_pokedex_id, name, ability, level, health_points, attack, defense, special_attack, special_defense, speed) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param('issiiiiiii', $national_pokedex_id, $name, $ability, $level, $health_points, $attack, $defense, $special_attack, $special_defense, $speed);
        if ($stmt->execute()) {
            $pokemon_inserted = true;
            $new_pokemon_id = $stmt->insert_id;
            $stmt->close();

            // Insert into Pokemon_Egg_Groups
            $egg_stmt = $conn->prepare("INSERT INTO Pokemon_Egg_Groups (u_id, egg_group_name) VALUES (?, ?)");
            $egg_stmt->bind_param('is', $new_pokemon_id, $egg_group_name);
            $egg_stmt->execute();
            $egg_stmt->close();

            // Insert into Pkmn_type
            $type_stmt = $conn->prepare("INSERT INTO Pkmn_type (u_id, type_name) VALUES (?, ?)");
            $type_stmt->bind_param('is', $new_pokemon_id, $type_name);
            $type_stmt->execute();
            $type_stmt->close();

            // Fetch the newly inserted Pokemon
            $fetch_stmt = $conn->prepare("SELECT national_pokedex_id, name, ability, level, health_points, attack, defense, special_attack, special_defense, speed FROM Pokemon WHERE u_id = ?");
            $fetch_stmt->bind_param('i', $new_pokemon_id);
            $fetch_stmt->execute();
            $fetch_stmt->bind_result($national_pokedex_id, $name, $ability, $level, $health_points, $attack, $defense, $special_attack, $special_defense, $speed);
            $fetch_stmt->fetch();
            $new_pokemon = [
                'national_pokedex_id' => $national_pokedex_id,
                'name' => $name,
                'ability' => $ability,
                'level' => $level,
                'health_points' => $health_points,
                'attack' => $attack,
                'defense' => $defense,
                'special_attack' => $special_attack,
                'special_defense' => $special_defense,
                'speed' => $speed,
                'egg_group_name' => $egg_group_name,
                'type_name' => $type_name
            ];
            $fetch_stmt->close();
        } else {
            echo "<p>Error adding Pokémon: " . $stmt->error . "</p>";
        }
    } else {
        echo "<p>Error: Name, egg group, and type are required fields.</p>";
    }
    $conn->close();
}
?>

<html>
<head>
    <title>Add New Pokemon</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Add New Pokemon</h2>
    <form action="insert_pokemon.php" method="post">
        National Pokedex ID: <input type="number" name="national_pokedex_id" min="1" required><br>
        Name: <input type="text" name="name" required><br>
        Ability: <input type="text" name="ability" required><br>
        Level: <input type="number" name="level" min="0" required><br>
        Health Points: <input type="number" name="health_points" min="0" required><br>
        Attack: <input type="number" name="attack" min="0" max="250" required><br>
        Defense: <input type="number" name="defense" min="0" max="250" required><br>
        Special Attack: <input type="number" name="special_attack" min="0" max="250" required><br>
        Special Defense: <input type="number" name="special_defense" min="0" max="250" required><br>
        Speed: <input type="number" name="speed" min="0" max="250" required><br>
        Egg Group: 
        <select name="egg_group_name" required>
            <?php foreach ($egg_groups as $egg_group): ?>
                <option value="<?= htmlspecialchars($egg_group) ?>"><?= htmlspecialchars($egg_group) ?></option>
            <?php endforeach; ?>
        </select><br>
        Type: 
        <select name="type_name" required>
            <?php foreach ($types as $type): ?>
                <option value="<?= htmlspecialchars($type) ?>"><?= htmlspecialchars($type) ?></option>
            <?php endforeach; ?>
        </select><br>
        <button type="submit">Add Pokemon</button>
    </form>

    <?php if ($pokemon_inserted && $new_pokemon): ?>
        <h3>New Pokemon Added</h3>
        <p>
            National Pokedex ID: <?= htmlspecialchars($new_pokemon['national_pokedex_id']) ?><br>
            Name: <?= htmlspecialchars($new_pokemon['name']) ?><br>
            Ability: <?= htmlspecialchars($new_pokemon['ability']) ?><br>
            Level: <?= htmlspecialchars($new_pokemon['level']) ?><br>
            Health Points: <?= htmlspecialchars($new_pokemon['health_points']) ?><br>
            Attack: <?= htmlspecialchars($new_pokemon['attack']) ?><br>
            Defense: <?= htmlspecialchars($new_pokemon['defense']) ?><br>
            Special Attack: <?= htmlspecialchars($new_pokemon['special_attack']) ?><br>
            Special Defense: <?= htmlspecialchars($new_pokemon['special_defense']) ?><br>
            Speed: <?= htmlspecialchars($new_pokemon['speed']) ?><br>
            Egg Group: <?= htmlspecialchars($new_pokemon['egg_group_name']) ?><br>
            Type: <?= htmlspecialchars($new_pokemon['type_name']) ?>
        </p>
    <?php endif; ?>
</div>
</body>
</html>
