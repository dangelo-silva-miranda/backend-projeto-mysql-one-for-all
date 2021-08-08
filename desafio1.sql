DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE PLANS(
    `PLAN_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `TYPE` VARCHAR(50) UNIQUE KEY,
    `PRICE` DECIMAL(5,2)
) engine = InnoDB;

CREATE TABLE USERS(
    `USER_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FIRST_NAME` VARCHAR(50),
    `AGE` TINYINT UNSIGNED,
    `PLAN_ID` INT UNSIGNED NOT NULL,
    UNIQUE KEY(`FIRST_NAME`, `AGE`),
    FOREIGN KEY(`PLAN_ID`) REFERENCES PLANS(`PLAN_ID`)
) engine = InnoDB;

CREATE TABLE ARTISTS(
    `ARTIST_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FULL_NAME` VARCHAR(100) UNIQUE KEY
) engine = InnoDB;

CREATE TABLE ALBUMS(
    `ALBUM_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `TITLE` VARCHAR(100) UNIQUE KEY,
    `ARTIST_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY(`ARTIST_ID`) REFERENCES ARTISTS(`ARTIST_ID`)
) engine = InnoDB;

CREATE TABLE SONGS(
    `SONG_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `TITLE` VARCHAR(100) UNIQUE KEY,
    `ALBUM_ID` INT UNSIGNED NOT NULL,
    FOREIGN KEY(`ALBUM_ID`) REFERENCES ALBUMS(`ALBUM_ID`)
) engine = InnoDB;

CREATE TABLE `HISTORY`(
    `SONG_ID` INT UNSIGNED NOT NULL,
    `USER_ID` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`SONG_ID`, `USER_ID`),
    FOREIGN KEY(`SONG_ID`) REFERENCES SONGS(`SONG_ID`),
    FOREIGN KEY(`USER_ID`) REFERENCES USERS(`USER_ID`)
) engine = InnoDB;

CREATE TABLE FOLLOWERS(
    `USER_ID` INT UNSIGNED NOT NULL,
    `ARTIST_ID` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`USER_ID`, `ARTIST_ID`),
    FOREIGN KEY(`USER_ID`) REFERENCES USERS(`USER_ID`),
    FOREIGN KEY(`ARTIST_ID`) REFERENCES ARTISTS(`ARTIST_ID`)
) engine = InnoDB;

INSERT INTO PLANS (`TYPE`, `PRICE`)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO USERS (`FIRST_NAME`, `AGE`, `PLAN_ID`)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO ARTISTS (`FULL_NAME`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO ALBUMS (`TITLE`, `ARTIST_ID`)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SONGS (`TITLE`, `ALBUM_ID`)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let\'s Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let\'s Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO `HISTORY` (`SONG_ID`, `USER_ID`)
VALUES
  (1, 1),
  (6, 1),
  (14, 1),
  (16, 1),
  (13, 2),
  (17, 2),
  (2, 2),
  (15, 2),
  (4, 3),
  (16, 3),
  (6, 3),
  (3, 4),
  (18, 4),
  (11, 4);

INSERT INTO FOLLOWERS (`USER_ID`, `ARTIST_ID`)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
