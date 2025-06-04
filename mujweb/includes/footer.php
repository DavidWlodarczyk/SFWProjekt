    </main>
    <footer>
        <p>© 2025 Databáze Hlášek. Vytvořeno s láskou.</p>
    </footer>
    <?php
    // Uzavření připojení k databázi pro mysqli
    if (isset($conn) && $conn instanceof mysqli) { // Přidána kontrola, zda je $conn mysqli objekt
        $conn->close();
    }
    ?><meta name="keywords" content="hlášky, filmy, seriály, osobnosti, pořadyphp
</main>
<footer>
    <!-- ========== OBRÁZEK VE FOOTERU ========== -->
    <, <?php echo isset($pageKeywords) ? e($pageKeywords) : ''; ?>">
<link rel="stylesheet" href="css/style.css">
</body>
</html>