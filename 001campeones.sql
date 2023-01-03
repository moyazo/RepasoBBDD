
CREATE DATABASE campeonesLOL; /* CREATE OUR DDBB */


/* CREATE TABLE */


CREATE TABLE champions(
id INT AUTO_INCREMENT PRIMARY KEY, 
nombre VARCHAR(128) NOT NULL,
rol ENUM("Assassin","Fighter","Wizard","Marksmen","Supports","Tanks"),
difficulty ENUM("Low","Moderate","High"),
descripcion TEXT
);

#DROP TABLE champions;
/* INSERT DATA */

INSERT INTO champions VALUES (0,"KAYN","Assassin","High","Shieda Kayn, un practicante sin par de la mortífera magia sombría, lucha por alcanzar su verdadero destino: llegar a guiar algún día a la Orden de la Sombra hacia una nueva era de supremacía jonia.");

INSERT INTO champions VALUES (0,"AATROX","Fighter","Moderate","Once honored defenders of Shurima against the Void, Aatrox and his brethren would eventually become an even greater threat to Runeterra, and were defeated only by cunning mortal sorcery.");

INSERT INTO champions VALUES (0,"AURELION SOL","Wizard","Moderate","Aurelion Sol once graced the vast emptiness of the cosmos with celestial wonders of his own devising. Now, he is forced to wield his awesome power at the behest of a space-faring empire that tricked him into servitude.");

INSERT INTO champions VALUES (0,"ALISTAR","Tanks","Moderato","Always a mighty warrior with a fearsome reputation, Alistar seeks revenge for the death of his clan at the hands of the Noxian empire. ");

INSERT INTO champions VALUES (0,"APHELIOS","Marksmen","High","Emerging from moonlight's shadow with weapons drawn, Aphelios kills the enemies of his faith in brooding silence—speaking only through the certainty of his aim, and the firing of each gun.");
