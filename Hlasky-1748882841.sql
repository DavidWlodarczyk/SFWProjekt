CREATE TABLE [osobnost] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[jmeno] nvarchar(50) NOT NULL,
	[prijmeni] nvarchar(50) NOT NULL,
	[narozeni] date NOT NULL,
	[pohlavi] nvarchar(1) NOT NULL,
	[pozice] nvarchar(50) NOT NULL,
	[alergienajahody] bit NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [porad] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nazev] nvarchar(50) NOT NULL,
	[rok] int NOT NULL,
	[typ] nvarchar(50) NOT NULL,
	[studio_id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [recenze_porad] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[uzivatel_id] int NOT NULL,
	[hodnoceni] int NOT NULL,
	[komentar] nvarchar(350) NOT NULL DEFAULT 'charsetutf8',
	[porad_id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [studio] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[nazev] nvarchar(50) NOT NULL,
	[vznik] int NOT NULL,
	[obrat] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [uzivatel] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[uzivatelskeJmeno] nvarchar(50) NOT NULL UNIQUE,
	[zalozeni] date NOT NULL,
	[narozeni] date NOT NULL,
	[email] nvarchar(50) NOT NULL UNIQUE,
	[heslo] nvarchar(50) NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [hlaska] (
	[id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[jmeno] nvarchar(50) NOT NULL DEFAULT 'null',
	[porad_id] int NOT NULL,
	[hlaska] nvarchar(150) NOT NULL,
	[osobnost_id] int NOT NULL,
	PRIMARY KEY ([id])
);

CREATE TABLE [recenze_hlaska] (
	[uzivatel_id] int NOT NULL,
	[hodnoceni] int NOT NULL,
	[komentar] nvarchar(350) NOT NULL DEFAULT 'charsetutf8',
	[hlaska_id] int NOT NULL,
	PRIMARY KEY ([uzivatel_id], [hlaska_id])
);


ALTER TABLE [porad] ADD CONSTRAINT [porad_fk4] FOREIGN KEY ([studio_id]) REFERENCES [studio]([id]);
ALTER TABLE [recenze_porad] ADD CONSTRAINT [recenze_porad_fk1] FOREIGN KEY ([uzivatel_id]) REFERENCES [uzivatel]([id]);

ALTER TABLE [recenze_porad] ADD CONSTRAINT [recenze_porad_fk4] FOREIGN KEY ([porad_id]) REFERENCES [porad]([id]);


ALTER TABLE [hlaska] ADD CONSTRAINT [hlaska_fk2] FOREIGN KEY ([porad_id]) REFERENCES [porad]([id]);

ALTER TABLE [hlaska] ADD CONSTRAINT [hlaska_fk4] FOREIGN KEY ([osobnost_id]) REFERENCES [osobnost]([id]);
ALTER TABLE [recenze_hlaska] ADD CONSTRAINT [recenze_hlaska_fk0] FOREIGN KEY ([uzivatel_id]) REFERENCES [uzivatel]([id]);

ALTER TABLE [recenze_hlaska] ADD CONSTRAINT [recenze_hlaska_fk3] FOREIGN KEY ([hlaska_id]) REFERENCES [hlaska]([id]);