-- Drop les tables si elles existent (va donner une erreur si utilisé la première fois, c'est normal)
DROP TABLE films_acteurs;
DROP TABLE commentaires;
DROP TABLE films;
DROP TABLE acteurs;
DROP TABLE maisons_edition;

-- Contient les infos de la maisons d'édition
CREATE TABLE maisons_edition (
    maison_edition_id NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    annee_fondation NUMBER
);

-- Table des acteurs
CREATE TABLE acteurs (
    acteur_id NUMBER PRIMARY KEY,
    nom VARCHAR2(100),
    prenom VARCHAR2(100),
    age NUMBER
);

-- Table des films
CREATE TABLE films (
    film_id NUMBER PRIMARY KEY,
    titre VARCHAR2(100),
    genres VARCHAR2(100),
    annee_publication NUMBER,
    maison_edition_id NUMBER,
    FOREIGN KEY (maison_edition_id) REFERENCES maisons_edition(maison_edition_id)
);

-- Table des commentaires
CREATE TABLE commentaires (
    commentaire_id NUMBER PRIMARY KEY,
    film_id NUMBER,
    score NUMBER,
    description VARCHAR2(500),
    FOREIGN KEY (film_id) REFERENCES films(film_id)
);

-- Table pour lister plusieurs acteurs à un seul film
CREATE TABLE films_acteurs (
    film_id NUMBER,
    acteur_id NUMBER,
    FOREIGN KEY (film_id) REFERENCES films(film_id),
    FOREIGN KEY (acteur_id) REFERENCES acteurs(acteur_id),
    PRIMARY KEY (film_id, acteur_id)
);

-- Maisons d'édition
INSERT INTO maisons_edition (maison_edition_id, nom, annee_fondation) VALUES (1, 'Warner Bros.', 1923);
INSERT INTO maisons_edition (maison_edition_id, nom, annee_fondation) VALUES (2, 'Paramount Pictures', 1912);
INSERT INTO maisons_edition (maison_edition_id, nom, annee_fondation) VALUES (3, 'Universal Pictures', 1912);
INSERT INTO maisons_edition (maison_edition_id, nom, annee_fondation) VALUES (4, '20th Century Fox', 1935);
INSERT INTO maisons_edition (maison_edition_id, nom, annee_fondation) VALUES (5, 'Columbia Pictures', 1924);

-- Liste d'acteurs connus
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (1, 'DiCaprio', 'Leonardo', 46);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (2, 'Reeves', 'Keanu', 57);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (3, 'McConaughey', 'Matthew', 52);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (4, 'Brando', 'Marlon', 80);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (5, 'Bale', 'Christian', 47);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (6, 'Hanks', 'Tom', 64);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (7, 'Roberts', 'Julia', 53);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (8, 'Pitt', 'Brad', 57);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (9, 'Jolie', 'Angelina', 45);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (10, 'De Niro', 'Robert', 77);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (11, 'Streep', 'Meryl', 71);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (12, 'Freeman', 'Morgan', 83);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (13, 'Clooney', 'George', 59);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (14, 'Lawrence', 'Jennifer', 30);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (15, 'Smith', 'Will', 52);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (16, 'Johansson', 'Scarlett', 36);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (17, 'Washington', 'Denzel', 66);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (18, 'Hemsworth', 'Chris', 37);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (19, 'Evans', 'Chris', 39);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (20, 'Downey Jr.', 'Robert', 55);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (21, 'Blanchett', 'Cate', 51);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (22, 'Holland', 'Tom', 24);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (23, 'Lively', 'Blake', 33);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (24, 'Adams', 'Amy', 46);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (25, 'Johnson', 'Dwayne', 48);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (26, 'Theron', 'Charlize', 45);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (27, 'Gadot', 'Gal', 35);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (28, 'Pratt', 'Chris', 41);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (29, 'Tatum', 'Channing', 40);
INSERT INTO acteurs (acteur_id, nom, prenom, age) VALUES (30, 'Affleck', 'Ben', 48);

-- Liste films populaires
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (1, 'Inception', 'Science Fiction', 2010, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (2, 'The Matrix', 'Action', 1999, 2);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (3, 'Interstellar', 'Science Fiction', 2014, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (4, 'The Godfather', 'Crime', 1972, 2);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (5, 'The Dark Knight', 'Action', 2008, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (6, 'Titanic', 'Romance', 1997, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (7, 'Pulp Fiction', 'Crime', 1994, 3);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (8, 'Forrest Gump', 'Drama', 1994, 4);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (9, 'The Shawshank Redemption', 'Drama', 1994, 5);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (10, 'The Lord of the Rings: The Return of the King', 'Fantasy', 2003, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (11, 'Gladiator', 'Action', 2000, 2);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (12, 'Braveheart', 'History', 1995, 3);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (13, 'The Avengers', 'Action', 2012, 4);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (14, 'The Lion King', 'Animation', 1994, 5);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (15, 'Jurassic Park', 'Science Fiction', 1993, 1);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (16, 'Star Wars: Episode IV - A New Hope', 'Science Fiction', 1977, 2);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (17, 'Avatar', 'Science Fiction', 2009, 3);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (18, 'Black Panther', 'Action', 2018, 4);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (19, 'Joker', 'Crime', 2019, 5);
INSERT INTO films (film_id, titre, genres, annee_publication, maison_edition_id) VALUES (20, 'Avengers: Endgame', 'Action', 2019, 1);

-- Plsql, vous verrez cela en automne
DECLARE
--Valeurs de départ
    i NUMBER := 1;
BEGIN
    --Il y a 20 films, boucle for de 1-20
    FOR film IN 1..20 LOOP
        --Je veux 30 commentaires par film, donc boucle for de 1-30
        FOR comm IN 1..30 LOOP
            --Partie sql classique
            INSERT INTO commentaires (commentaire_id, film_id, score, description)
            --Ce sera un truc du style (1, 1, 3, 'Commentaire 1 pour le film 1')
            VALUES (i, film, DBMS_RANDOM.VALUE(1, 5), 'Commentaire ' || comm || ' pour le film ' || film);
            i := i + 1;
        END LOOP;
    END LOOP;
END;
/

-- Insert into films_acteurs
BEGIN
    FOR film IN 1..20 LOOP
        FOR acteur IN 1..10 LOOP
            INSERT INTO films_acteurs (film_id, acteur_id)
             --Un peu plus tricky, le film suit un schéma régulier de 1-20, mais les acteurs suivront un schméma 1-30, une fois à 30 ils reviendront à 1
            VALUES (film, MOD((acteur - 1) + (film - 1) * 10, 30) + 1);
        END LOOP;
    END LOOP;
END;
/




-- Démarre le ORDS pour restscott
BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'RESTSCOTT',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'films', --Utile à l'url, ce sera http://localhost:8080/ords/films
    p_auto_rest_auth      => FALSE
  );
  COMMIT;
END;
/

-- Active le ORDS pour chaque table
BEGIN
  ORDS.enable_object(
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'MAISONS_EDITION',
    p_object_type  => 'TABLE',
    p_object_alias => 'maisons_edition' --http://localhost:8080/ords/films/maisons_edition
  );
  COMMIT;
END;
/

BEGIN
  ORDS.enable_object(
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'ACTEURS',
    p_object_type  => 'TABLE',
    p_object_alias => 'acteurs' --http://localhost:8080/ords/films/acteurs etc pour le reste
  );
  COMMIT;
END;
/

BEGIN
  ORDS.enable_object(
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'FILMS',
    p_object_type  => 'TABLE',
    p_object_alias => 'films'
  );
  COMMIT;
END;
/

BEGIN
  ORDS.enable_object(
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'COMMENTAIRES',
    p_object_type  => 'TABLE',
    p_object_alias => 'commentaires'
  );
  COMMIT;
END;
/

BEGIN
  ORDS.enable_object(
    p_enabled      => TRUE,
    p_schema       => 'RESTSCOTT',
    p_object       => 'FILMS_ACTEURS',
    p_object_type  => 'TABLE',
    p_object_alias => 'films_acteurs'
  );
  COMMIT;
END;
/
