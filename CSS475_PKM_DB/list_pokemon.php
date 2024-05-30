<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

// Handle the search
$searchTerm = isset($_GET['search']) ? $_GET['search'] : '';
$searchField = isset($_GET['field']) ? $_GET['field'] : 'name';

$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
<html>
<head>
    <title>CSS 475 Pokemon Database - Pokemon List</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Pokemon List</h2>
    <form method="get">
        <select name="field">
            <option value="national_pokedex_id" <?= $searchField == 'national_pokedex_id' ? 'selected' : '' ?>>National Pokedex ID</option>
            <option value="name" <?= $searchField == 'name' ? 'selected' : '' ?>>Name</option>
        </select>
        <input type="text" name="search" placeholder="Search by <?= htmlspecialchars($searchField) ?>" value="<?= htmlspecialchars($searchTerm) ?>">
        <input type="submit" value="Search">
    </form>
    <a href="insert_pokemon.php">Add New Pokemon</a>
    <?php
    // Prepare SQL Statement based on search field
    if ($searchTerm) {
        if ($searchField == 'national_pokedex_id') {
            $sql = "SELECT MIN(p.national_pokedex_id) AS national_pokedex_id, p.name, COUNT(*) AS num_pokemon
                    FROM Pokemon p
                    WHERE p.national_pokedex_id = ?
                    GROUP BY p.name";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                $stmt->bind_param('i', $searchTerm);
            }
        } elseif ($searchField == 'name') {
            $sql = "SELECT MIN(p.national_pokedex_id) AS national_pokedex_id, p.name, COUNT(*) AS num_pokemon
                    FROM Pokemon p
                    WHERE p.name LIKE ?
                    GROUP BY p.name";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                $searchTerm = '%' . $searchTerm . '%';
                $stmt->bind_param('s', $searchTerm);
            }
        } elseif ($searchField == 'type') {
            $sql = "SELECT MIN(p.national_pokedex_id) AS national_pokedex_id, p.name, COUNT(*) AS num_pokemon
                    FROM Pokemon p
                    LEFT JOIN Pkmn_type pt ON p.u_id = pt.u_id
                    WHERE pt.type_name LIKE ?
                    GROUP BY p.name";
            $stmt = $conn->prepare($sql);
            if ($stmt) {
                $searchTerm = '%' . $searchTerm . '%';
                $stmt->bind_param('s', $searchTerm);
            }
        }
    } else {
        $sql = "SELECT MIN(p.national_pokedex_id) AS national_pokedex_id, p.name, COUNT(*) AS num_pokemon
                FROM Pokemon p
                GROUP BY p.name";
        $stmt = $conn->prepare($sql);
    }

    if (!$stmt) {
        echo "Failed to prepare the statement: " . htmlspecialchars($conn->error);
    } else {
        // Execute the Statement
        $stmt->execute();
        $stmt->bind_result($pokedex_id, $name, $num_pokemon);

        // Loop Through Result
        echo "<ul>";
        while ($stmt->fetch()) {
            echo "<li><strong><a href='show_pokemon.php?name=" . urlencode($name) . "'>" . htmlspecialchars($name) . "</a></strong> (ID: " . htmlspecialchars($pokedex_id) . ") - Num Pokemon Out There: " . htmlspecialchars($num_pokemon) . "</li>";
        }
        echo "</ul>";
        $stmt->close();
    }

    // Close Connection
    $conn->close();
    ?>
</div>
</body>
</html>


