CREATE TABLE rodzice(
    rodzice_id INT PRIMARY KEY,
    id_rodzic1 INT,
    id_rodzic2 INT
);

CREATE TABLE osoba (
osoba_id INT PRIMARY KEY,
imie VARCHAR(50),
nazwisko VARCHAR(50),
data_urodzenia DATE,
miejsce_urodzenia VARCHAR(50),
data_zgonu DATE,
id_malzonka INT,
rodzice_id INT CONSTRAINT FK_RODZICE REFERENCES rodzice 
);


INSERT INTO rodzice(rodzice_id, id_rodzic1, id_rodzic2) VALUES(1, 1, 2);
INSERT INTO rodzice(rodzice_id, id_rodzic1, id_rodzic2) VALUES(2, 6, 7);
INSERT INTO rodzice(rodzice_id, id_rodzic1, id_rodzic2) VALUES(3, 7, 9);

INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(1, 'Marzena', 'Kowalska', '12-01-1969', 'Krakow', NULL, 2, NULL);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(2, 'Zbigniew', 'Kowalski', '15-07-1968', 'Opole', NULL, 1, NULL);

INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(3, 'Magdalena', 'Kowalska', '11-03-2003', 'Krakow', NULL, NULL, 1);

INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(4, 'Anna', 'Kowalska', '30-06-2000', 'Krakow', NULL, NULL, 1);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(5, 'Jakub', 'Kowalski', '15-10-1998', 'Krakow', NULL, NULL, 1);

INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(6, 'Barbara', 'Mintaj', '19-11-1965', 'Warszawa', NULL,  7, NULL);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(7, 'Marcin', 'Mintaj', '03-08-1964', 'Bialystok', NULL, 6, NULL);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(8, 'Cezary', 'Mintaj', '14-02-1999', 'Warszawa', NULL, NULL, 2);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(9, 'Ewa', 'Szubert', '07-01-1965', 'Sosnowiec', '23-01-2008', NULL, NULL);
INSERT INTO osoba(osoba_id, imie, nazwisko, data_urodzenia, miejsce_urodzenia, data_zgonu, id_malzonka, rodzice_id) VALUES(10, 'Bartosz', 'Mintaj', '01-01-1989', 'Warszawa', NULL, NULL, 3);


SELECT * FROM osoba WHERE osoba_id = 5;
SELECT * FROM osoba WHERE osoba_id = 3;
SELECT * FROM osoba WHERE osoba_id = 8;


SELECT * from osoba WHERE osoba_id = ANY(SELECT id_rodzic1 FROM rodzice WHERE rodzice_id = (SELECT rodzice_id FROM osoba WHERE osoba_id = 5) UNION SELECT id_rodzic2 FROM rodzice WHERE rodzice_id = (SELECT rodzice_id FROM osoba WHERE osoba_id = 5));


SELECT imie from osoba WHERE rodzice_id = ANY(SELECT rodzice_id from rodzice WHERE id_rodzic1 = 2 OR id_rodzic2=2);

SELECT * FROM osoba WHERE rodzice_id = ANY(SELECT rodzice_id from osoba WHERE osoba_id = 5);






