CREATE TABLE `osobnost` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`jmeno` VARCHAR(50) NOT NULL,
	`prijmeni` VARCHAR(50) NOT NULL,
	`narozeni` DATE NOT NULL,
	`pohlavi` VARCHAR(1) NOT NULL,
	`pozice` VARCHAR(50) NOT NULL,
	`alergienajahody` TINYINT(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `studio` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`nazev` VARCHAR(50) NOT NULL,
	`vznik` INT NOT NULL,
	`obrat` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `porad` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`nazev` VARCHAR(50) NOT NULL,
	`rok` INT NOT NULL,
	`typ` VARCHAR(50) NOT NULL,
	`studio_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `uzivatel` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`uzivatelskeJmeno` VARCHAR(50) NOT NULL UNIQUE,
	`zalozeni` DATE NOT NULL,
	`narozeni` DATE NOT NULL,
	`email` VARCHAR(50) NOT NULL UNIQUE,
	`heslo` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `recenze_porad` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`uzivatel_id` INT NOT NULL,
	`hodnoceni` INT NOT NULL,
	`komentar` VARCHAR(350) NOT NULL DEFAULT '',
	`porad_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `hlaska` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
	`jmeno` VARCHAR(50) NOT NULL DEFAULT 'null',
	`porad_id` INT NOT NULL,
	`hlaska` VARCHAR(150) NOT NULL,
	`osobnost_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `recenze_hlaska` (
	`uzivatel_id` INT NOT NULL,
	`hodnoceni` INT NOT NULL,
	`komentar` VARCHAR(350) NOT NULL DEFAULT '',
	`hlaska_id` INT NOT NULL,
	PRIMARY KEY (`uzivatel_id`, `hlaska_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `porad` ADD CONSTRAINT `porad_fk_studio` FOREIGN KEY (`studio_id`) REFERENCES `studio`(`id`);
ALTER TABLE `recenze_porad` ADD CONSTRAINT `recenze_porad_fk_uzivatel` FOREIGN KEY (`uzivatel_id`) REFERENCES `uzivatel`(`id`);
ALTER TABLE `recenze_porad` ADD CONSTRAINT `recenze_porad_fk_porad` FOREIGN KEY (`porad_id`) REFERENCES `porad`(`id`);
ALTER TABLE `hlaska` ADD CONSTRAINT `hlaska_fk_porad` FOREIGN KEY (`porad_id`) REFERENCES `porad`(`id`);
ALTER TABLE `hlaska` ADD CONSTRAINT `hlaska_fk_osobnost` FOREIGN KEY (`osobnost_id`) REFERENCES `osobnost`(`id`);
ALTER TABLE `recenze_hlaska` ADD CONSTRAINT `recenze_hlaska_fk_uzivatel` FOREIGN KEY (`uzivatel_id`) REFERENCES `uzivatel`(`id`);
ALTER TABLE `recenze_hlaska` ADD CONSTRAINT `recenze_hlaska_fk_hlaska` FOREIGN KEY (`hlaska_id`) REFERENCES `hlaska`(`id`);

INSERT INTO `studio` (`id`, `nazev`, `vznik`, `obrat`) VALUES
(1, 'Studio Alfa', 1995, 100000),
(2, 'Studio Beta', 2001, 150000),
(3, 'Studio Gamma', 1987, 200000),
(4, 'Studio Delta', 2010, 90000),
(5, 'Studio Epsilon', 1999, 110000),
(6, 'Studio Zeta', 2005, 130000),
(7, 'Studio Eta', 2012, 80000);

INSERT INTO `uzivatel` (`id`, `uzivatelskeJmeno`, `zalozeni`, `narozeni`, `email`, `heslo`) VALUES
(1, 'karel123', '2020-01-01', '1990-05-10', 'karel@domena.cz', 'heslo1'),
(2, 'petr456', '2021-02-15', '1988-07-22', 'petr@domena.cz', 'heslo2'),
(3, 'eva789', '2022-03-10', '1995-03-30', 'eva@domena.cz', 'heslo3'),
(4, 'jana321', '2023-04-05', '1992-12-12', 'jana@domena.cz', 'heslo4'),
(5, 'marek654', '2019-05-20', '1998-11-01', 'marek@domena.cz', 'heslo5'),
(6, 'lucie987', '2018-06-25', '1985-08-19', 'lucie@domena.cz', 'heslo6'),
(7, 'adam111', '2024-07-30', '1993-09-03', 'adam@domena.cz', 'heslo7');

INSERT INTO `osobnost` (`id`, `jmeno`, `prijmeni`, `narozeni`, `pohlavi`, `pozice`, `alergienajahody`) VALUES
(1, 'Jan', 'Novák', '1970-01-01', 'M', 'herec', 0),
(2, 'Petra', 'Svobodová', '1980-02-02', 'F', 'herečka', 1),
(3, 'Karel', 'Dvořák', '1965-03-03', 'M', 'režisér', 0),
(4, 'Eva', 'Horáková', '1975-04-04', 'F', 'scénáristka', 1),
(5, 'Marek', 'Bartoš', '1982-05-05', 'M', 'herec', 0),
(6, 'Lucie', 'Králová', '1990-06-06', 'F', 'herečka', 0),
(7, 'Tomáš', 'Urban', '1985-07-07', 'M', 'herec', 1);

INSERT INTO `porad` (`id`, `nazev`, `rok`, `typ`, `studio_id`) VALUES
(1, 'Dobrodružství v čase', 2010, 'seriál', 1),
(2, 'Město snů', 2012, 'film', 2),
(3, 'Tajemství lesa', 2015, 'seriál', 3),
(4, 'Ztracený svět', 2018, 'film', 4),
(5, 'Hrdinové noci', 2020, 'seriál', 5),
(6, 'Cesta domů', 2021, 'film', 6),
(7, 'Stíny minulosti', 2022, 'seriál', 7);

INSERT INTO `recenze_porad` (`id`, `uzivatel_id`, `hodnoceni`, `komentar`, `porad_id`) VALUES
(1, 1, 8, 'Skvělý pořad!', 1),
(2, 2, 7, 'Dobrý film.', 2),
(3, 3, 9, 'Výborný příběh.', 3),
(4, 4, 6, 'Mohl být lepší.', 4),
(5, 5, 10, 'Super!', 5),
(6, 6, 5, 'Průměrné.', 6),
(7, 7, 8, 'Zajímavý seriál.', 7);

INSERT INTO `hlaska` (`id`, `jmeno`, `porad_id`, `hlaska`, `osobnost_id`) VALUES
(1, 'Jan', 1, 'Tohle je začátek něčeho velkého.', 1),
(2, 'Petra', 2, 'Nikdy se nevzdávej.', 2),
(3, 'Karel', 3, 'Pravda vždy vyjde najevo.', 3),
(4, 'Eva', 4, 'Všechno má svůj čas.', 4),
(5, 'Marek', 5, 'Na konci tunelu je světlo.', 5),
(6, 'Lucie', 6, 'Naděje umírá poslední.', 6),
(7, 'Tomáš', 7, 'Každý den je nový začátek.', 7);

INSERT INTO `recenze_hlaska` (`uzivatel_id`, `hodnoceni`, `komentar`, `hlaska_id`) VALUES
(1, 9, 'Tato hláška mě inspirovala.', 1),
(2, 8, 'Dobrá hláška.', 2),
(3, 7, 'Celkem vtipné.', 3),
(4, 10, 'Perfektní!', 4),
(5, 6, 'Moc se mi nelíbí.', 5),
(6, 8, 'Zajímavé.', 6),
(7, 9, 'Skvělá hláška.', 7);
Use code with caution.
SQL
Jak importovat do XAMPP MySQL:
Uložte výše uvedený kód do souboru s příponou .sql (např. hlasky_mysql_import.sql).
Spusťte XAMPP Control Panel.
Ujistěte se, že služby Apache a MySQL jsou spuštěné (klikněte na "Start" vedle nich).
Klikněte na tlačítko "Admin" vedle "MySQL". Tím se v prohlížeči otevře phpMyAdmin.
V levém panelu phpMyAdmin klikněte na "Nová" (nebo "New") pro vytvoření nové databáze.
Zadejte název databáze (např. hlasky_db) a jako porovnávání (Collation) vyberte utf8mb4_unicode_ci nebo utf8mb4_general_ci. Klikněte na "Vytvořit".
Po vytvoření databáze ji vyberte v levém panelu (klikněte na její název).
V horním menu klikněte na záložku "Import".
V sekci "Soubor k importu" klikněte na "Vybrat soubor" a najděte váš uložený .sql soubor (např. hlasky_mysql_import.sql).
Ostatní nastavení obvykle můžete nechat výchozí.
Sjeďte dolů a klikněte na tlačítko "Proveď" (nebo "Go").
Pokud vše proběhne v pořádku, tabulky se vytvoří a data se naimportují do vaší MySQL databáze. Nezapomeňte také upravit PHP skripty pro připojení k databázi, aby používaly ovladače pro MySQL (mysqli nebo PDO_mysql) a správné přihlašovací údaje.