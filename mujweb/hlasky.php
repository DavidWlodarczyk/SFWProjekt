<?php
$pageTitle = "Seznam hlášek";
$pageDescription = "Najděte nejlepší hlášky z filmů a seriálů.";
$pageKeywords = "hlášky, citáty, filmy, seriály, seznam";
include 'includes/header.php'; // Načítá db_connect.php s $conn
?>

<h2>Seznam hlášek</h2>

<?php
$sql = "SELECT h.id, h.hlaska, o.jmeno AS osobnost_jmeno, o.prijmeni AS osobnost_prijmeni, p.nazev AS porad_nazev 
        FROM hlaska h
        JOIN osobnost o ON h.osobnost_id = o.id
        JOIN porad p ON h.porad_id = p.id
        ORDER BY p.nazev ASC, h.id ASC;";
$result = $conn->query($sql);

if ($result === false) {
    die("Chyba dotazu na hlášky: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<table>";
    echo "<thead><tr><th>Hláška</th><th>Osobnost</th><th>Pořad</th></tr></thead>";
    echo "<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr id='hlaska-" . e($row['id']) . "'>";
        echo "<td>\"" . e($row['hlaska']) . "\"</td>";
        echo "<td>" . e($row['osobnost_jmeno']) . " " . e($row['osobnost_prijmeni']) . "</td>";
        echo "<td>" . e($row['porad_nazev']) . "</td>";
        echo "</tr>";
    }
    echo "</tbody></table>";
} else {
    echo "<p>Nebyly nalezeny žádné hlášky.</p>";
}
$result->free();
?>

<?php include 'includes/footer.php'; ?>