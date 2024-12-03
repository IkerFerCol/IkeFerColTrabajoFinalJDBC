-- Crear la tabla LIGA
CREATE TABLE IF NOT EXISTS LIGA (
                                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                                    nombre VARCHAR(50) NOT NULL
    );

-- Crear la tabla EQUIPO
CREATE TABLE IF NOT EXISTS EQUIPO (
                                      id INTEGER PRIMARY KEY AUTOINCREMENT,
                                      nombre VARCHAR(50) NOT NULL,
    lugar VARCHAR(50) NOT NULL,
    mejor_jugador VARCHAR(50) NOT NULL,
    imagen VARCHAR(200) NOT NULL,
    liga_id INT,
    FOREIGN KEY (liga_id) REFERENCES LIGA (id)
    );

-- Crear la tabla ESTADIO
CREATE TABLE IF NOT EXISTS ESTADIO (
                                       id INTEGER PRIMARY KEY AUTOINCREMENT,
                                       nombre VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    equipo_id INT UNIQUE,
    FOREIGN KEY (equipo_id) REFERENCES EQUIPO (id)
    );

-- Crear la tabla JUGADOR
CREATE TABLE IF NOT EXISTS JUGADOR (
                                       id INTEGER PRIMARY KEY AUTOINCREMENT,
                                       nombre VARCHAR(50) NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES EQUIPO (id)
    );

-- Crear la tabla JUGADOR_LIGA
CREATE TABLE IF NOT EXISTS JUGADOR_LIGA (
                                            jugador_id INT,
                                            liga_id INT,
                                            PRIMARY KEY (jugador_id, liga_id),
    FOREIGN KEY (jugador_id) REFERENCES JUGADOR (id),
    FOREIGN KEY (liga_id) REFERENCES LIGA (id)
    );

-- Insertar datos en la tabla LIGA
INSERT INTO LIGA (nombre)
VALUES ('LaLiga'), ('PremierLeague');

-- Insertar datos en la tabla EQUIPO
INSERT INTO EQUIPO (nombre, lugar, mejor_jugador, imagen, liga_id)
VALUES
    ('Real Madrid', 'Madrid', 'Vinícius Júnior', 'https://assets.laliga.com/squad/2024/t186/p246333/256x278/p246333_t186_2024_1_001_000.png', 1),
    ('FC Barcelona', 'Barcelona', 'Robert Lewandowski', 'https://assets.laliga.com/squad/2024/t178/p56764/256x278/p56764_t178_2024_1_001_000.png', 1),
    ('Villarreal CF', 'Vila-real', 'Alex Baena', 'https://assets.laliga.com/squad/2024/t449/p248501/256x278/p248501_t449_2024_1_001_000.png', 1),
    ('Real Betis Balompié', 'Sevilla', 'Giovani Lo Celso', 'https://assets.laliga.com/squad/2024/t185/p200826/2048x2048/p200826_t185_2024_1_002_000.jpg', 1),
    ('Valencia CF', 'Valencia', 'Gaya', 'https://assets.laliga.com/squad/2024/t191/p132105/2048x2048/p132105_t191_2024_1_002_000.jpg', 1),
    ('Manchester City', 'Manchester', 'Erling Haaland', 'https://resources.premierleague.com/premierleague/photos/players/250x250/p223094.png', 2),
    ('Arsenal', 'Londres', 'Bukayo Saka', 'https://resources.premierleague.com/premierleague/photos/players/250x250/p223340.png', 2),
    ('Manchester United', 'Manchester', 'Bruno Fernandes', 'https://resources.premierleague.com/premierleague/photos/players/250x250/p141746.png', 2),
    ('Liverpool FC', 'Liverpool', 'Mohamed Salah', 'https://resources.premierleague.com/premierleague/photos/players/250x250/p118748.png', 2),
    ('Chelsea FC', 'Londres', 'Cole Palmer', 'https://resources.premierleague.com/premierleague/photos/players/250x250/p244851.png', 2);

-- Insertar datos en la tabla ESTADIO
INSERT INTO ESTADIO (nombre, capacidad, equipo_id)
VALUES
    ('Santiago Bernabéu', 81044, 1),
    ('Camp Nou', 99354, 2),
    ('Estadio de la Cerámica',  23000, 3),
    ('Estadio Benito Villamarín', 60000, 4),
    ('Estadio de Mestalla', 55000, 5),
    ('Etihad Stadium', 55017, 6),
    ('Emirates Stadium', 60000, 7),
    ('Old Trafford', 74879, 8),
    ('Anfield', 54074, 9),
    ('Stamford Bridge', 40848, 10);

-- Insertar datos en la tabla JUGADOR
INSERT INTO JUGADOR (nombre, equipo_id)
VALUES
    ('Vinícius Júnior', 1),
    ('Robert Lewandowski', 2),
    ('Alex Baena', 3),
    ('Giovani Lo Celso', 4),
    ('Gaya', 5),
    ('Erling Haaland', 6),
    ('Bukayo Saka', 7),
    ('Bruno Fernandes', 8),
    ('Mohamed Salah', 9),
    ('Cole Palmer', 10);