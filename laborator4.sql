CREATE TABLE adresa(
    id            INT PRIMARY KEY,
    tara          VARCHAR(100) NOT NULL,
    oras          VARCHAR(100) NOT NULL,
    strada        VARCHAR(100),
    nr_casa       INT,
    nr_apartament INT
);

CREATE TABLE persoana(
    id         INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name  VARCHAR(100) NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE,
    gender     CHAR,
    adresa_id  INT,
    FOREIGN KEY (adresa_id) REFERENCES adresa (id)
);

CREATE TABLE carte(
    id       INT PRIMARY KEY,
    denumire VARCHAR(100) NOT NULL,
    autor    VARCHAR(100) NOT NULL,
    an       INT          NOT NULL
);

-- Adaugare

INSERT INTO carte(id, denumire, autor, an)
    VALUES (1, 'Dennumire1', 'Autor1', 1991);
INSERT INTO carte(id, denumire, autor, an)
    VALUES (2, 'Dennumire2', 'Autor2', 1992);
INSERT INTO carte(id, denumire, autor, an)
    VALUES (3, 'Dennumire3', 'Autor3', 1993);
INSERT INTO carte(id, denumire, autor, an)
    VALUES (4, 'Dennumire4', 'Autor4', 1994);
INSERT INTO carte(id, denumire, autor, an)
    VALUES (5, 'Dennumire5', 'Autor5', 1995);
INSERT INTO carte(id, denumire, autor, an)
    VALUES (6, 'Dennumire6', 'Autor6', 1996);

INSERT INTO adresa(id, tara, oras, strada, nr_casa, nr_apartament)
    VALUES (1, 'Moldova', 'Chisinau', 'Decebal', 3, 45);
INSERT INTO adresa(id, tara, oras, strada, nr_casa, nr_apartament)
    VALUES (2, 'Moldova', 'Ungheni', 'Eminescu', 5, 25);
INSERT INTO adresa(id, tara, oras, strada, nr_casa, nr_apartament)
    VALUES (3, 'Moldova', 'Chisinau', 'Eminescu', 1, 7);
INSERT INTO adresa(id, tara, oras, strada, nr_casa, nr_apartament)
    VALUES (4, 'Moldova', 'Nisporeni', 'Decebal', 7, 4);
INSERT INTO adresa(id, tara, oras, strada, nr_casa, nr_apartament)
    VALUES (5, 'Moldova', 'Chisinau', 'Decebal', 2, 5);

INSERT INTO persoana(id, first_name, last_name, email, gender, adresa_id)
    VALUES (1, 'Test1', 'Test11', 'asdasf@gmail.com', 'M', 2);
INSERT INTO persoana(id, first_name, last_name, email, gender, adresa_id)
    VALUES (2, 'Test2', 'Test22', 'wqe11@mail.md', 'M', 2);
INSERT INTO persoana(id, first_name, last_name, email, gender)
    VALUES (3, 'Test3', 'Test33', 'afff@gmail.md', 'M');
INSERT INTO persoana(id, first_name, last_name, email, gender, adresa_id)
    VALUES (4, 'Test4', 'Test44', 'adsasf@mail.ru', 'M', 5);
INSERT INTO persoana(id, first_name, last_name, email, gender, adresa_id)
    VALUES (5, 'Test5', 'Test55', 'dsaaa@mail.com', 'M', 1);

-- Selectare

SELECT * FROM adresa WHERE oras = 'Chisinau';
SELECT * FROM adresa WHERE id = 1;
SELECT * FROM carte WHERE an = 1991;
SELECT * FROM persoana WHERE adresa_id = 2;
SELECT * FROM adresa WHERE oras LIKE '%u%' or oras LIKE '%U%';

SELECT * FROM adresa;
SELECT * FROM persoana;
SELECT * FROM carte;

-- Modificare

UPDATE persoana SET first_name = 'Test111' WHERE id = 1;
UPDATE persoana SET email = 'wqe1122@mail.md' where id = 2;
UPDATE persoana SET gender = 'F' where id = 3;
UPDATE adresa SET nr_apartament = 14 WHERE id = 4;
UPDATE persoana SET adresa_id = 4 WHERE id = 3;

-- Stergere

DELETE FROM carte WHERE an = 1991;
DELETE FROM carte WHERE an = 1994;
DELETE FROM carte WHERE denumire LIKE '%2';
DELETE FROM carte WHERE id = 5;
DELETE FROM carte WHERE autor LIKE 'Autor%';

-- JOIN-uri

SELECT * FROM persoana INNER JOIN adresa on persoana.adresa_id = adresa.id;
SELECT * FROM persoana LEFT JOIN adresa on persoana.adresa_id = adresa.id;
SELECT * FROM persoana RIGHT JOIN adresa on persoana.adresa_id = adresa.id;
SELECT * FROM persoana FULL JOIN adresa on persoana.adresa_id = adresa.id;

SELECT * FROM persoana INNER JOIN adresa on persoana.adresa_id = adresa.id
         WHERE persoana.email LIKE '%.com';
SELECT * FROM persoana LEFT JOIN adresa on persoana.adresa_id = adresa.id
         WHERE persoana.email LIKE '%gmail%';
SELECT * FROM persoana RIGHT JOIN adresa on persoana.adresa_id = adresa.id
         WHERE adresa.oras LIKE 'Ungheni';
SELECT * FROM persoana FULL JOIN adresa on persoana.adresa_id = adresa.id
         WHERE adresa.oras LIKE 'Chisinau';
