<?php
$pageTitle = "Seznam studií";
$pageDescription = "Přehled filmových a televizních studií.";
$pageKeywords = "studia, produkce, film, televize, seznam";
include 'includes/header.php'; // Načítá db_connect.php s $conn
?>

<h2>Seznam studií</h2>

<?php
$sql = "SELECT id, nazev, vznik, obrat FROM studio ORDER BY nazev ASC;";
$result = $conn->query($sql);

if ($result === false) {
    die("Chyba dotazu na studia: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<table>";
    echo "<thead><tr><th>Název</th><th>Rok vzniku</th><th>Obrat</th></tr></thead>";
    echo "<tbody>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr id='studio-" . e($row['id']) . "'>";
        echo "<td>" . e($row['nazev']) . "</td>";
        echo "<td>" . e($row['vznik']) . "</td>";
        echo "<td>" . number_format(e($row['obrat']), 0, ',', ' ') . " Kč</td>"; // Formátování čísla
        echo "</tr>";
    }
    echo "</tbody></table>";
} else {
    echo "<p>Nebyly nalezena žádná studia.</p>";
}
$result->free();
?>

<?php include 'includes/footer.php'; ?>