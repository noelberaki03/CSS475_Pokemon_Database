<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['name'])) {
    $name = $_POST['name'];
    $archetype_id = $_POST['archetype_id'] ?? null;

    $conn = new mysqli($servername, $username, $password, $database, $port);
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Check for duplicate trainer name
    $check_stmt = $conn->prepare("SELECT COUNT(*) FROM Trainer WHERE name = ?");
    $check_stmt->bind_param('s', $name);
    $check_stmt->execute();
    $check_stmt->bind_result($count);
    $check_stmt->fetch();
    $check_stmt->close();

    if ($count > 0) {
        echo "<p>A trainer with this name already exists.</p>";
    } else {
        // Handle missing archetype selection
        if (empty($archetype_id)) {
            // Assuming there's a default 'None' archetype with a specific ID in the database
            $archetype_id = 1; // Change 1 to the ID of 'None' archetype if exists or insert it first
        }

        // Insert new trainer
        $stmt = $conn->prepare("INSERT INTO Trainer (name) VALUES (?)");
        $stmt->bind_param('s', $name);
        if ($stmt->execute()) {
            $trainer_id = $stmt->insert_id;
            // Link trainer to the selected or default archetype
            $stmt2 = $conn->prepare("INSERT INTO Trainer_Archetype (trainer_id, archetype_id) VALUES (?, ?)");
            $stmt2->bind_param('ii', $trainer_id, $archetype_id);
            $stmt2->execute();
            $stmt2->close();
            echo "<p>Trainer added successfully.</p>";
        } else {
            echo "<p>Error adding trainer: " . $stmt->error . "</p>";
        }
        $stmt->close();
    }
    $conn->close();
}
?>

<html>
<head>
    <title>Add New Trainer</title>
    <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
    <h2>Add New Trainer</h2>
    <form action="insert_trainer.php" method="post">
        Name: <input type="text" name="name" required><br>
        Archetype:
        <select name="archetype_id">
            <option value="">Select Archetype</option>
            <?php
            // Populate the dropdown menu with Archetypes
            $conn = new mysqli($servername, $username, $password, $database, $port);
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }
         
            $result = $conn->query("SELECT archetype_id, archetype_name FROM Archetype");
            while ($row = $result->fetch_assoc()) {
                echo "<option value='" . $row['archetype_id'] . "'>" . htmlspecialchars($row['archetype_name']) . "</option>";
            }
            $conn->close();
            ?>
        </select><br>
        <button type="submit">Add Trainer</button>
    </form>
</div>
</body>
</html>


