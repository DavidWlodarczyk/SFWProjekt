<?php
$pageTitle = "Vítejte";
$pageDescription = "Hlavní stránka databáze filmových a seriálových hlášek, pořadů a osobností.";
$pageKeywords = "domovská stránka, přehled";
include 'includes/header.php'; // Tady se načítá db_connect.php s $conn (mysqli objekt)
?>

<div class="welcome-section">
    <h2>Vítejte v Databázi Hlášek!</h2>
    <p>Prohlížejte si informace o vašich oblíbených pořadech, osobnostech a jejich nezapomenutelných hláškách.</p>
</div>

<h3>Několik posledních pořadů:</h3>
<?php
// Původní SQL dotaz je v pořádku, jen změníme TOP 3 na LIMIT 3 pro MySQL
$sql = "SELECT id, nazev, rok FROM porad ORDER BY rok DESC, id DESC LIMIT 3;";
$result = $conn->query($sql); // Nahrazení sqlsrv_query() -> $conn->query()

if ($result === false) {
    die("Chyba dotazu na pořady: " . $conn->error); // Zobrazení mysqli chyby
}

if ($result->num_rows > 0) { // Nahrazení sqlsrv_has_rows() -> $result->num_rows > 0
    echo "<ul>";
    while ($row = $result->fetch_assoc()) { // Nahrazení sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) -> $result->fetch_assoc()
        echo "<li><a href='porady.php#porad-" . e($row['id']) . "'>" . e($row['nazev']) . " (" . e($row['rok']) . ")</a></li>";
    }
    echo "</ul>";
} else {
    echo "<p>Nebyly nalezeny žádné pořady.</p>";
}
$result->free(); // Nahrazení sqlsrv_free_stmt() -> $result->free()
?>

<h3>Několik osobností:</h3>
<?php
$sql_osobnosti = "SELECT id, jmeno, prijmeni FROM osobnost ORDER BY id DESC LIMIT 3;"; // LIMIT 3 pro MySQL
$result_osobnosti = $conn->query($sql_osobnosti); // Nahrazení sqlsrv_query()

if ($result_osobnosti === false) {
    die("Chyba dotazu na osobnosti: " . $conn->error); // Zobrazení mysqli chyby
}

if ($result_osobnosti->num_rows > 0) { // Nahrazení sqlsrv_has_rows()
    echo "<ul>";
    while ($row_osobnost = $result_osobnosti->fetch_assoc()) { // Nahrazení sqlsrv_fetch_array()
        echo "<li><a href='osobnosti.php#osobnost-" . e($row_osobnost['id']) . "'>" . e($row_osobnost['jmeno']) . " " . e($row_osobnost['prijmeni']) . "</a></li>";
    }
    echo "</ul>";
} else {
    echo "<p>Nebyly nalezeny žádné osobnosti.</p>";
}
$result_osobnosti->free(); // Nahrazení sqlsrv_free_stmt()
?>

<?php include 'includes/footer.php'; ?>