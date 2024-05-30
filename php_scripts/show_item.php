<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

// Get the item ID from the query string
$item_id = $_GET['id'] ?? null;
if (!$item_id) {
    header("Location: list_items.php");
    exit();
}

$conn = new mysqli($servername, $username, $password, $database, $port);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch item details
$stmt = $conn->prepare("SELECT name, cost, effect, item_description FROM Item WHERE item_id = ?");
$stmt->bind_param('i', $item_id);
$stmt->execute();
$stmt->bind_result($name, $cost, $effect, $description);
$item_found = $stmt->fetch();
$stmt->close();
$conn->close();

if (!$item_found) {
    echo "<p>Item not found.</p>";
    exit();
}
?>
<html>
<head>
    <title>View Item Details</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Item Details</h2>
    <p>
        Name: <?= htmlspecialchars($name) ?><br>
        Cost: <?= htmlspecialchars($cost) ?><br>
        Effect: <?= htmlspecialchars($effect) ?><br>
        Description: <?= htmlspecialchars($description) ?>
    </p>
    <a href="list_items.php">Back to Item List</a>
</div>
</body>
</html>


