DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.subscriptions(
	`plan_id` INT PRIMARY KEY AUTO_INCREMENT,
    `plan_name` VARCHAR(30) NOT NULL,
    `plan_value` DOUBLE NOT NULL
);

CREATE TABLE SpotifyClone.users(
	`user_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(40) NOT NULL,
    `age` INT NOT NULL,
    `plan_id` INT,
    `subscription_date` DATE NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES SpotifyClone.subscriptions(plan_id)
);

CREATE TABLE SpotifyClone.artists(
	`artist_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL
);

CREATE TABLE SpotifyClone.favorite_artists (
	`user_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
	FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
);

CREATE TABLE SpotifyClone.albuns (
	`album_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `artist_id` INT,
    `release_year` YEAR NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
);

CREATE TABLE SpotifyClone.tracks(
	`track_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(60) NOT NULL,
    `album_id` INT,
    `length` INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
);

CREATE TABLE SpotifyClone.user_historic(
	`user_id` INT NOT NULL,
    `track_id` INT NOT NULL,
    `playback_date` DATETIME NOT NULL,
    PRIMARY KEY (user_id, track_id),
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (track_id) REFERENCES SpotifyClone.tracks(track_id)
);