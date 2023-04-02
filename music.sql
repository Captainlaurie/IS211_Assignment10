-- This sql file creates a music database for artists, albums and songs in MySQL

-- Create Database:
CREATE SCHEMA IF NOT EXISTS music;

-- Delete tables if they exist:
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

-- Create artists table:    
CREATE table artists (
    artist_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    artist_name varchar(100)
);

-- Create albums table:
CREATE table albums (
	album_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_title varchar(100),
	album_artist_id int,
    album_year int,
    FOREIGN KEY (album_artist_id) REFERENCES artists(artist_id)
    );
    
-- Create songs table:    
CREATE table songs (
    song_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	song_title varchar(100),
    song_artist_id int,
	song_album_id int,
    song_len int,
    FOREIGN KEY (song_album_id) REFERENCES albums(album_id), FOREIGN KEY (song_artist_id) REFERENCES artists(artist_id)
    );

-- Insert values into users table:
INSERT INTO artists (artist_name)
VALUES
    ('Soundgarden'),
	('City and Colour'),
    ('The Chain Gang of 1974'),
	('Johnny Cash');

-- Insert values into albums table:
INSERT INTO albums (album_title, album_artist_id, album_year)
VALUES
	('Superunknown', 1, 1994),
    ('Down on the Upside', 1, 1996),
	('The Hurry and the Harm', 2, 2013),
    ('Little Hell', 2, 2011),
	('Honey Moon Drips', 3, 2020),
    ('Daydream Forever', 3, 2014),
    ('Unchained', 4, 1999),
	('The Man in Black - His Greatest Hits', 4, 1999);
    
-- Insert some songs into the songs table:
INSERT INTO songs (song_title, song_artist_id, song_album_id, song_len)
VALUES 
	('Burden in My Hand', 1, 2, 290),
	('Black Hole Sun', 1, 1, 318),
    ('Sorrowing Man', 2, 4, 272),
    ('Thirst', 2, 3, 263),
    ('4AM, Still Lonely', 3, 5, 215),
    ('Sleepwalking', 3, 6, 217),
    ('Ring of Fire" (featuring The Carter Family)', 4, 8, 156),
    ("I've Been Everywhere (Lucky Starr cover)", 4, 7, 196);
    
