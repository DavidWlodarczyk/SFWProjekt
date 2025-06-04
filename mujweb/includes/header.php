<?php require_once 'db_connect.php'; ?>
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Dynamický titulek a popis pro SEO -->
    <title><?php echo isset($pageTitle) ? e($pageTitle) . ' | Databáze Hlášek' : 'Databáze Hlášek'; ?></title>
    <meta name="description" content="<?php echo isset($pageDescription) ? e($pageDescription) : 'Procházejte databázi filmových a seriálových hlášek, pořadů a osobností.'; ?>">
    <meta name="keywords" content="hlášky, filmy, seriály, osobnosti, pořady, <?php echo isset($pageKeywords) ? e($pageKeywords) : ''; ?>">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1><a href="index.php">Databáze Hlášek</a></h1>
        <img src="https://img.csfd.cz/documents/marketing/logos/logo-white-red/logo-white-red.svg" width="10%" alt="Partner webu" class="ora, vycentrování, žádné odsazení dole (pokud header má padding-bottom) */
footer-image">
        <nav>
            <ul>
                <li><a href="index.php">Hlavní stránka</a></li>
                <li><a href="porady.php">Pořady</a></li>
                <li><a href="osobnosti.php">Osobnosti</a></li>
                <li><a href="hlasky.php">Hlášky</a></li>
                <li><a href="studia.php">Studia</a></li>
            </ul>
        </nav>
    </header>
    <main>