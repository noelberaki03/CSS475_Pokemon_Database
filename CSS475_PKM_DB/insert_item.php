<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

$item_inserted = false;
$new_item = null;

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $cost = $_POST['cost'] ?? 0;
    $effect = $_POST['effect'] ?? 0;
    $description = $_POST['description'] ?? '';

    if (!empty($name) && !empty($description)) {
        $conn = new mysqli($servername, $username, $password, $database, $port);
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $stmt = $conn->prepare("INSERT INTO Item (name, cost, effect, item_description) VALUES (?, ?, ?, ?)");
        $stmt->bind_param('sdds', $name, $cost, $effect, $description);
        if ($stmt->execute()) {
            $item_inserted = true;
            $new_item_id = $stmt->insert_id;
            $stmt->close();

            // Fetch the newly inserted item
            $fetch_stmt = $conn->prepare("SELECT name, cost, effect, item_description FROM Item WHERE item_id = ?");
            $fetch_stmt->bind_param('i', $new_item_id);
            $fetch_stmt->execute();
            $fetch_stmt->bind_result($item_name, $item_cost, $item_effect, $item_description);
            $fetch_stmt->fetch();
            $new_item = [
                'name' => $item_name,
                'cost' => $item_cost,
                'effect' => $item_effect,
                'description' => $item_description
            ];
            $fetch_stmt->close();
        } else {
            echo "<p>Error adding item: " . $stmt->error . "</p>";
        }
        $conn->close();
    } else {
        echo "<p>Error: Name and description are required fields.</p>";
    }
}
?>
<html>
<head>
    <title>Add New Item</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Add New Item</h2>
    <form action="insert_item.php" method="post">
        Name: <input type="text" name="name" required><br>
        Cost: <input type="number" name="cost" min="0" required><br>
        Effect: <input type="number" name="effect" min="0" required><br>
        Description: <textarea name="description" required></textarea><br>
        <button type="submit">Add Item</button>
    </form>

    <?php if ($item_inserted && $new_item): ?>
        <h3>New Item Added</h3>
        <p>
            Name: <?= htmlspecialchars($new_item['name']) ?><br>
            Cost: <?= htmlspecialchars($new_item['cost']) ?><br>
            Effect: <?= htmlspecialchars($new_item['effect']) ?><br>
            Description: <?= htmlspecialchars($new_item['description']) ?>
        </p>
    <?php endif; ?>
</div>
</body>
</html>


