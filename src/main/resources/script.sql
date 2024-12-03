--CREATE DATABASE IF NOT EXISTS equiposfutbol
CREATE TABLE IF NOT EXISTS LIGA
(
    id     INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS EQUIPO
(
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre        VARCHAR(50)  NOT NULL,
    lugar         VARCHAR(50)  NOT NULL,
    mejor_jugador VARCHAR(50)  NOT NULL,
    imagen        VARCHAR(200) NOT NULL,
    liga_id       INT,
    FOREIGN KEY (liga_id) REFERENCES LIGA (id)
);


CREATE TABLE IF NOT EXISTS ESTADIO
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre    VARCHAR(50) NOT NULL,
    capacidad INT         NOT NULL,
    equipo_id INT UNIQUE,
    FOREIGN KEY (equipo_id) REFERENCES EQUIPO (id)
);


CREATE TABLE IF NOT EXISTS JUGADOR
(
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre    VARCHAR(50) NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES EQUIPO (id)
);


CREATE TABLE IF NOT EXISTS JUGADOR_LIGA
(
    jugador_id INT,
    liga_id    INT,
    PRIMARY KEY (jugador_id, liga_id),
    FOREIGN KEY (jugador_id) REFERENCES JUGADOR (id),
    FOREIGN KEY (liga_id) REFERENCES LIGA (id)
);


INSERT INTO LIGA (nombre)
VALUES ('LaLiga'),
       ('PremierLeague');


INSERT INTO EQUIPO (nombre, lugar, mejor_jugador, imagen, liga_id)
VALUES ('Real_Madrid', 'Madrid', 'Vinícius Júnior',
        'https://assets.laliga.com/squad/2024/t186/p246333/256x278/p246333_t186_2024_1_001_000.png', 1),
       ('FC_Barcelona', 'Barcelona', 'Robert Lewandowski',
        'https://assets.laliga.com/squad/2024/t178/p56764/256x278/p56764_t178_2024_1_001_000.png', 1),
       ('Villarreal_CF', 'Vila-real', 'Alex Baena',
        'https://assets.laliga.com/squad/2024/t449/p248501/256x278/p248501_t449_2024_1_001_000.png', 1),
       ('Real_Betis_Balompie', 'Sevilla', 'Giovani Lo Celso',
        'https://assets.laliga.com/squad/2024/t185/p200826/2048x2048/p200826_t185_2024_1_002_000.jpg', 1),
       ('Valencia_CF', 'Valencia', 'Gaya',
        'https://assets.laliga.com/squad/2024/t191/p132105/2048x2048/p132105_t191_2024_1_002_000.jpg', 1),
       ('Manchester_City', 'Manchester', 'Erling Haaland',
        'https://resources.premierleague.com/premierleague/photos/players/250x250/p223094.png', 2),
       ('Arsenal', 'Londres', 'Bukayo Saka',
        'https://resources.premierleague.com/premierleague/photos/players/250x250/p223340.png', 2),
       ('Manchester_United', 'Manchester', 'Bruno Fernandes',
        'https://resources.premierleague.com/premierleague/photos/players/250x250/p141746.png', 2),
       ('Liverpool_FC', 'Liverpool', 'Mohamed Salah',
        'https://resources.premierleague.com/premierleague/photos/players/250x250/p118748.png', 2),
       ('Chelsea_FC', 'Londres', 'Cole Palmer',
        'https://resources.premierleague.com/premierleague/photos/players/250x250/p244851.png', 2);


INSERT INTO ESTADIO (nombre, capacidad, equipo_id)
VALUES ('Santiago Bernabéu', 81044, 1),
       ('Camp Nou', 99354, 2),
       ('Estadio de la Cerámica', 23000, 3),
       ('Estadio Benito Villamarín', 60000, 4),
       ('Estadio de Mestalla', 55000, 5),
       ('Etihad Stadium', 55017, 6),
       ('Emirates Stadium', 60000, 7),
       ('Old Trafford', 74879, 8),
       ('Anfield', 54074, 9),
       ('Stamford Bridge', 40848, 10);

    ('Vinicius Jr', 1)
    ,
    ('Robert Lewandowski', 2),
    ('Alex Baena', 3),
    ('Giovani Lo Celso', 4),
    ('Gaya', 5),
    ('Erling Haaland', 6),
    ('Bukayo Saka', 7),
    ('Bruno Fernandes', 8),
    ('Mohamed Salah', 9),
    ('Cole Palmer', 10);

INSERT INTO JUGADOR (nombre, equipo_id)
VALUES ('Vinicius Jr', 1),
       ('Robert Lewandowski', 2),
       ('Alex Baena', 3),
       ('Giovani Lo Celso', 4),
       ('Gaya', 5),
       ('Erling Haaland', 6),
       ('Bukayo Saka', 7),
       ('Bruno Fernandes', 8),
       ('Mohamed Salah', 9),
       ('Cole Palmer', 10);


INSERT INTO JUGADOR_LIGA (jugador_id, liga_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (5, 1),
       (6, 2),
       (7, 2),
       (8, 2),
       (9, 2),
       (10, 2);


