<?php
$serverName = "localhost";
$username = "root"; // Výchozí uživatel XAMPP MySQL
$password = "";     // Výchozí heslo XAMPP MySQL je prázdné
$dbName = "databaze"; // NEBO název, který jste dali databázi v phpMyAdmin, např. hlasky_db

// Vytvoření připojení
$conn = new mysqli($serverName, $username, $password, $dbName);

// Kontrola připojení
if ($conn->connect_error) {
    die("Chyba připojení k databázi: " . $conn->connect_error);
}

// Nastavení kódování pro komunikaci na utf8
if (!$conn->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $conn->error);
    exit();
}

function e($string) {
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}
?>