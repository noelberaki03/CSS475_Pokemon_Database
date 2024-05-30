<?php
/**
 * Created by Group 6, CSS 475 Spring 2024
 * User: Group 6
 * Date: 5/29/2024
 * Time: 3:21 PM
 */
require_once 'config.inc.php';
?>
<html>
<head>
   <title>CSS 475 Pokemon Database - Trainer List</title>
   <link rel="stylesheet" href="base.css">
</head>
<body>
<?php require_once 'header.inc.php'; ?>
<div>
   <h2>Trainer List</h2>
   <form method="GET">
       <select name="searchType">
           <option value="name">Trainer Name</option>
           <option value="archetype">Archetype Name</option>
       </select>
       <input type="text" name="search" placeholder="Enter search...">
       <input type="submit" value="Search">
   </form>
   <a href="insert_trainer.php">Add New Trainer</a>
   <?php
   $conn = new mysqli($servername, $username, $password, $database, $port);
   if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
   }

   $search = isset($_GET['search']) ? $_GET['search'] : '';
   $searchType = isset($_GET['searchType']) ? $_GET['searchType'] : 'name';
   $searchParam = '%' . $search . '%';

   if ($searchType == 'name') {
       $sql = "SELECT DISTINCT t.trainer_id, t.name, a.archetype_name
               FROM Trainer AS t
               LEFT JOIN Trainer_Archetype AS ta ON ta.trainer_id = t.trainer_id
               LEFT JOIN Archetype AS a ON a.archetype_id = ta.archetype_id
               WHERE t.name LIKE ?
               ORDER BY t.name";
   } else {
       $sql = "SELECT DISTINCT t.trainer_id, t.name, a.archetype_name
               FROM Trainer AS t
               LEFT JOIN Trainer_Archetype AS ta ON ta.trainer_id = t.trainer_id
               LEFT JOIN Archetype AS a ON a.archetype_id = ta.archetype_id
               WHERE a.archetype_name LIKE ?
               ORDER BY a.archetype_name";
   }

   $stmt = $conn->prepare($sql);
   $stmt->bind_param('s', $searchParam);
   $stmt->execute();
   $stmt->bind_result($trainer_id, $name, $archetype_name);

   echo "<ul>";
   while ($stmt->fetch()) {
       echo "<li><a href='show_trainer.php?id=" . $trainer_id . "'>" . htmlspecialchars($name) . "</a> - " . htmlspecialchars($archetype_name ?? 'No Archetype') . "</li>";
   }
   echo "</ul>";

   $stmt->close();
   $conn->close();
   ?>
</div>
</body>
</html>


