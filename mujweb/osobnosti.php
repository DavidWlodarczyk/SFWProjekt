<?php
$pageTitle = "Seznam osobností";
$pageDescription = "Prohlédněte si seznam všech osobností v naší databázi.";
$pageKeywords = "osobnosti, herci, režiséři, scénáristi, seznam";
include 'includes/header.php'; // Načítá db_connect.php s $conn
?>

<h2>Seznam osobností</h2>

<?php
// Pro MySQL použijeme DATE_FORMAT pro formátování data
$sql = "SELECT id, jmeno, prijmeni, DATE_FORMAT(narozeni, '%d.%m.%Y') AS narozeni_format, pohlavi, pozice, alergienajahody 
        FROM osobnost 
        ORDER BY prijmeni ASC, jmeno ASC;";
$result = $conn->query($sql);

if ($result === false) {
    die("Chyba dotazu na osobnosti: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<table>";
    echo "<thead><tr><th>Jméno</th><th>Příjmení</th><th>Narození</th><th>Pohlaví</th><th>Pozice</th><th>Alergie na jahody</th></tr></thead>";
    echo "<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr id='osobnost-" . e($row['id']) . "'>";
        echo "<td>" . e($row['jmeno']) . "</td>";
        echo "<td>" . e($row['prijmeni']) . "</td>";
        echo "<td>" . e($row['narozeni_format']) . "</td>";
        echo "<td>" . e($row['pohlavi']) . "</td>";
        echo "<td>" . e($row['pozice']) . "</td>";
        echo "<td>" . ($row['alergienajahody'] ? 'Ano' : 'Ne') . "</td>";
        echo "</tr>";
    }
    echo "</tbody></table>";
} else {
    echo "<p>Nebyly nalezeny žádné osobnosti.</p>";
}
$result->free();
?>

<?php include 'includes/footer.php'; ?>