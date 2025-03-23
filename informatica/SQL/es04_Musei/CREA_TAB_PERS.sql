CREATE TABLE "Personaggi" (
	"personaggio"	VARCHAR(50) NOT NULL,
	"codice"	INTEGER,
	PRIMARY KEY("personaggio"),
	FOREIGN KEY ("codice") REFERENCES "Opere"("codice") ON UPDATE CASCADE ON DELETE RESTRICT
);