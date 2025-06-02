<?php
$pageTitle = "Seznam pořadů";
$pageDescription = "Prohlédněte si seznam všech pořadů v naší databázi.";
$pageKeywords = "pořady, filmy, seriály, seznam";
include 'includes/header.php'; // Načítá db_connect.php s $conn
?>

<h2>Seznam pořadů</h2>

<?php
$sql = "SELECT p.id, p.nazev, p.rok, p.typ, s.nazev AS studio_nazev 
        FROM porad p 
        JOIN studio s ON p.studio_id = s.id 
        ORDER BY p.nazev ASC;";
$result = $conn->query($sql);

if ($result === false) {
    die("Chyba dotazu na pořady: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<table>";
    echo "<thead><tr><th>Název</th><th>Rok</th><th>Typ</th><th>Studio</th></tr></thead>";
    echo "<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr id='porad-" . e($row['id']) . "'>";
        echo "<td>" . e($row['nazev']) . "</td>";
        echo "<td>" . e($row['rok']) . "</td>";
        echo "<td>" . e($row['typ']) . "</td>";
        echo "<td>" . e($row['studio_nazev']) . "</td>";
        echo "</tr>";
    }
    echo "</tbody></table>";
} else {
    echo "<p>Nebyly nalezeny žádné pořady.</p>";
}
$result->free();
?>

<?php include 'includes/footer.php'; ?>