DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL UNIQUE,
    cost DECIMAL(5,2) NOT NULL
);

INSERT INTO SpotifyClone.planos (name, cost)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitario', 5.99),
('pessoal', 6.99);

CREATE TABLE SpotifyClone.users(
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

INSERT INTO SpotifyClone.users (name, idade, plano_id)
VALUES
('Barbara Liskov', 82, 1),
('Robert Cecil Martin', '58', 1),
('Ada Lovelace', 37, 2),
('Martin Fowler', 46, 2),
('Sandi Metz', 58, 2),
('Paulo Freire', 19, 3),
('Bell Hooks', 26, 3),
('Christopher Alexander', 85, 4),
('Judith Butler', 45, 4),
('Jorge Amado', 58, 4);

CREATE TABLE SpotifyClone.user_assign(
	user_id INT,
	plano_id INT,
    sign_date DATE NOT NULL,
	CONSTRAINT PRIMARY KEY(user_id, plano_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

INSERT INTO SpotifyClone.user_assign (user_id, plano_id, sign_date)
VALUES
(1, 1, '2019-10-20'),
(2, 1, '2017-01-06'),
(3, 2, '2017-12-30'),
(4, 2, '2017-01-17'),
(5, 2, '2018-04-29'),
(6, 3, '2018-02-14'),
(7, 3, '2018-01-05'),
(8, 4, '2019-06-05'),
(9, 4, '2020-05-13'),
(10, 4, '2017-02-17');

CREATE TABLE SpotifyClone.artist(
  artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO SpotifyClone.artist (name)
VALUES
('Beyoncé'), 
('Queen'), 
('Elis Regina'), 
('Baco Exu do Blues'), 
('Blind Guardian'), 
('Nina Simone');

CREATE TABLE SpotifyClone.albuns(
  album_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    release_year YEAR NOT NULL,
    artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
);

INSERT INTO SpotifyClone.albuns (name, release_year, artist_id)
VALUES
('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

CREATE TABLE SpotifyClone.musics(
  music_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    sec_duration INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);

INSERT INTO SpotifyClone.musics (name, sec_duration, album_id)
VALUES
('BREAK MY SOUL', 279, 1),
('VIRGO’S GROOVE', 369, 1),
('ALIEN SUPERSTAR', 116, 1),
('Don’t Stop Me Now', 203, 2),
('Under Pressure', 152, 3),
('Como Nossos Pais', 105, 4),
('O Medo de Amar é o Medo de Ser Livre', 207, 5),
('Samba em Paris', 267, 6),
('The Bard’s Song', 244, 7),
('Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.user_history(
  music_id INT,
  user_id INT,
    playback_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY(music_id, user_id),
    FOREIGN KEY (music_id) REFERENCES musics (music_id),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);

INSERT INTO SpotifyClone.user_history (music_id, user_id, playback_date)
VALUES
( 8, 1, '2022-02-28 10:45:55'), 
( 2, 1, '2020-05-02 05:30:35'), 
( 10, 1, '2020-03-06 11:22:33'), 
( 10, 2, '2022-08-05 08:05:17'), 
( 7, 2, '2020-01-02 07:40:33'), 
( 10, 3, '2020-11-13 16:55:13'), 
( 2, 3, '2020-12-05 18:38:30'), 
( 8, 4, '2021-08-15 17:10:10'), 
( 8, 5, '2022-01-09 01:44:33'), 
( 5, 5, '2020-08-06 15:23:43'), 
( 7, 6, '2017-01-24 00:31:17'), 
( 1, 6, '2017-10-12 12:35:20'), 
( 4, 7, '2011-12-15 22:30:49'), 
( 4, 8, '2012-03-17 14:56:41'), 
( 9, 9, '2022-02-24 21:14:22'), 
( 3, 10, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.followers(
  artist_followed INT,
  user_follower INT,
  CONSTRAINT PRIMARY KEY(artist_followed, user_follower),
    FOREIGN KEY (artist_followed) REFERENCES artist (artist_id),
    FOREIGN KEY (user_follower) REFERENCES users (user_id)
);

INSERT INTO SpotifyClone.followers (user_follower, artist_followed)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 1),
(6, 6),
(7, 6),
(9, 3),
(10, 2);