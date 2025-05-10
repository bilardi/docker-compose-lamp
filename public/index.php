<?php
echo "RealPath: " . realpath(".") . "</br>";

require __DIR__ . "/../config/database.php";

$stmt = $conn->prepare("SHOW tables");
$stmt->execute();
$results = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo "MySQL tables number: " . count($results);
?>
