<?php
session_start();
include 'db.php';

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit;
}

// Fetch names from the database
$sql = "SELECT username FROM users";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
            gap: 10px;
        }
        .grid-item {
            background-color: #f0f0f0;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Welcome, <?php echo $_SESSION['username']; ?></h1>
    <div class="grid-container">
        <?php while ($row = $result->fetch_assoc()): ?>
            <div class="grid-item">
                <?php echo $row['username']; ?>
            </div>
        <?php endwhile; ?>
    </div>
    <a href="logout.php">Logout</a>
</body>
</html>
