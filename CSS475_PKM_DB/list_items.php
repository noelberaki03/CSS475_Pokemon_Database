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

$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

?>
<html>
<head>
    <title>CSS 475 Pokemon Database - Item List</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Item List</h2>
    <form method="get">
        <input type="text" name="search" placeholder="Search items by name" value="<?= htmlspecialchars($searchTerm) ?>">
        <input type="submit" value="Search">
    </form>
    <a href="insert_item.php">Add New Item</a>
    <?php
    // Prepare SQL Statement
    if ($searchTerm) {
        $sql = "SELECT name, MIN(cost) AS cost, MIN(effect) AS effect, MIN(item_description) AS item_description, COUNT(*) AS item_count, MIN(item_id) AS item_id
                FROM Item
                WHERE name LIKE ?
                GROUP BY name";
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            echo "Failed to prepare the statement: " . htmlspecialchars($conn->error);
        } else {
            $searchTerm = '%' . $searchTerm . '%';
            $stmt->bind_param('s', $searchTerm);
        }
    } else {
        $sql = "SELECT name, MIN(cost) AS cost, MIN(effect) AS effect, MIN(item_description) AS item_description, COUNT(*) AS item_count, MIN(item_id) AS item_id
                FROM Item
                GROUP BY name";
        $stmt = $conn->prepare($sql);
        if ($stmt === false) {
            echo "Failed to prepare the statement: " . htmlspecialchars($conn->error);
        }
    }

    if (!$stmt) {
        echo "Failed to prepare the statement.";
    } else {
        // Execute the Statement
        $stmt->execute();
        $stmt->bind_result($item_name, $cost, $effect, $description, $item_count, $item_id);

        // Loop Through Result
        echo "<ul>";
        while ($stmt->fetch()) {
            echo "<li><strong><a href='show_item.php?id=" . $item_id . "'>" . htmlspecialchars($item_name) . "</a></strong> - Cost: " . htmlspecialchars($cost) . ", Effect: " . htmlspecialchars($effect) . ", Description: " . htmlspecialchars($description) . " (Count: " . htmlspecialchars($item_count) . ")</li>";
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


