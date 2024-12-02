CREATE TABLE SongSet (
	playlistID int, --fk
	songID int,		--fk
	creationDate date,
);

CREATE TABLE Users (
    userID int primary key,
    username varchar(16) unique,
    userFname varchar(50),
    userLname varchar(50),
    email varchar(254) unique,
    passwordHash varchar(255),
    dateJoined date,
    subscriptionID int, --fk
);

CREATE TABLE Subscriptions (
	subscriptionID int primary key,
	startDate Date,
	endDate date NULL,
);

CREATE TABLE Playlists (
	playlistID int primary key,
	userID int, --fk
	title varchar(50),
	creationDate date,
);

CREATE TABLE Songs (
	songID int primary key,
	title varchar(100),
	length int,
	artistID int, --fk
	albumID int, --fk
	genre varchar (50),
	releaseDate Date,
	timesPlayed int,
	filePath varchar(260), -- max filepath on windows
);

CREATE TABLE Artists (
	artistID int primary key,
	name varchar(100),
	description text,
);

CREATE TABLE Albums (
	albumID int primary key,
	title varchar(100),
	releaseDate date,
	artistID int, --fk
);


ALTER TABLE SongSet
add FOREIGN KEY (playlistID)
REFERENCES Playlists(playlistID)

ALTER TABLE SongSet
add FOREIGN KEY (songID)
REFERENCES Songs(songID)

ALTER TABLE users
add foreign key (subscriptionID) 
references Subscriptions(subscriptionID)

ALTER TABLE Playlists
add FOREIGN KEY (UserID)
REFERENCES Users(UserID);

ALTER TABLE Albums
add FOREIGN KEY (artistID)
REFERENCES Artists(artistID)

ALTER TABLE Songs
add FOREIGN KEY (artistID)
REFERENCES Artists(artistID)

ALTER TABLE Songs
add FOREIGN KEY (albumID)
REFERENCES Albums(albumID)

INSERT INTO Artists
VALUES 
	(0, 
    'Led Zeppelin', 
    'English rock band known for pioneering hard rock and heavy metal with iconic albums like "IV" and "Physical Graffiti."');

INSERT INTO Artists
VALUES 
    (1, 
    'Beyonc�', 
    'American singer, songwriter, and actress known for her powerful vocals, stage presence, and groundbreaking solo career.');

INSERT INTO Artists
VALUES 
    (2, 
    'Kendrick Lamar', 
    'American rapper, songwriter, and record producer known for his thought-provoking lyrics and contributions to modern hip-hop.');

-- Led Zeppelin
INSERT INTO Albums 
VALUES 
    (0, 'Led Zeppelin IV', '1971-11-08', 0),
    (1, 'Physical Graffiti', '1975-02-24', 0);

-- Beyonce
INSERT INTO Albums 
VALUES 
    (2, 'Lemonade', '2016-04-23', 1),
    (3, 'Beyonc�', '2013-12-13', 1);

--  Kendrick Lamar
INSERT INTO Albums 
VALUES 
    (4, 'To Pimp a Butterfly', '2015-03-15', 2),
    (5, 'DAMN.', '2017-04-14', 2);

-- Led Zeppelin IV (albumID = 0, artistID = 0)
INSERT INTO Songs 
VALUES 
    (0, 'Black Dog', 295, 0, 0, 'Rock', '1971-11-08', 0, 'path/to/blackdog.mp3'),
    (1, 'Rock and Roll', 220, 0, 0, 'Rock', '1971-11-08', 0, 'path/to/rockandroll.mp3'),
    (2, 'The Battle of Evermore', 338, 0, 0, 'Folk Rock', '1971-11-08', 0, 'path/to/battleofevermore.mp3'),
    (3, 'Stairway to Heaven', 482, 0, 0, 'Rock', '1971-11-08', 0, 'path/to/stairwaytoheaven.mp3'),
    (4, 'Misty Mountain Hop', 279, 0, 0, 'Rock', '1971-11-08', 0, 'path/to/mistymountainhop.mp3');

-- Physical Graffiti (albumID = 1, artistID = 0)
INSERT INTO Songs 
VALUES 
    (5, 'Custard Pie', 252, 0, 1, 'Rock', '1975-02-24', 0, 'path/to/custardpie.mp3'),
    (6, 'The Rover', 338, 0, 1, 'Rock', '1975-02-24', 0, 'path/to/therover.mp3'),
    (7, 'Kashmir', 512, 0, 1, 'Rock', '1975-02-24', 0, 'path/to/kashmir.mp3'),
    (8, 'In My Time of Dying', 668, 0, 1, 'Blues Rock', '1975-02-24', 0, 'path/to/inmytimeofdying.mp3'),
    (9, 'Trampled Under Foot', 335, 0, 1, 'Rock', '1975-02-24', 0, 'path/to/trampledunderfoot.mp3');

-- Lemonade (albumID = 2, artistID = 1)
INSERT INTO Songs 
VALUES 
    (10, 'Pray You Catch Me', 194, 1, 2, 'Pop', '2016-04-23', 0, 'path/to/prayyoucatchme.mp3'),
    (11, 'Hold Up', 283, 1, 2, 'Pop', '2016-04-23', 0, 'path/to/holdup.mp3'),
    (12, 'Sorry', 234, 1, 2, 'Pop', '2016-04-23', 0, 'path/to/sorry.mp3'),
    (13, '6 Inch', 259, 1, 2, 'R&B', '2016-04-23', 0, 'path/to/6inch.mp3'),
    (14, 'Formation', 262, 1, 2, 'Pop', '2016-04-23', 0, 'path/to/formation.mp3');

-- Beyonc� (albumID = 3, artistID = 1)
INSERT INTO Songs 
VALUES 
    (15, 'Pretty Hurts', 257, 1, 3, 'Pop', '2013-12-13', 0, 'path/to/prettyhurts.mp3'),
    (16, 'Drunk in Love', 323, 1, 3, 'R&B', '2013-12-13', 0, 'path/to/drunkinlove.mp3'),
    (17, 'Blow', 228, 1, 3, 'Pop', '2013-12-13', 0, 'path/to/blow.mp3'),
    (18, 'XO', 213, 1, 3, 'Pop', '2013-12-13', 0, 'path/to/xo.mp3'),
    (19, 'Flawless', 248, 1, 3, 'Pop', '2013-12-13', 0, 'path/to/flawless.mp3');

-- To Pimp a Butterfly (albumID = 4, artistID = 2)
INSERT INTO Songs 
VALUES 
    (20, 'Wesley�s Theory', 287, 2, 4, 'Hip-Hop', '2015-03-15', 0, 'path/to/wesleystheory.mp3'),
    (21, 'For Free?', 189, 2, 4, 'Jazz Rap', '2015-03-15', 0, 'path/to/forfree.mp3'),
    (22, 'King Kunta', 234, 2, 4, 'Hip-Hop', '2015-03-15', 0, 'path/to/kingkunta.mp3'),
    (23, 'Alright', 219, 2, 4, 'Hip-Hop', '2015-03-15', 0, 'path/to/alright.mp3'),
    (24, 'These Walls', 248, 2, 4, 'Hip-Hop', '2015-03-15', 0, 'path/to/thesewalls.mp3');

-- DAMN. (albumID = 5, artistID = 2)
INSERT INTO Songs 
VALUES 
    (25, 'DNA.', 186, 2, 5, 'Hip-Hop', '2017-04-14', 0, 'path/to/dna.mp3'),
    (26, 'YAH.', 162, 2, 5, 'Hip-Hop', '2017-04-14', 0, 'path/to/yah.mp3'),
    (27, 'HUMBLE.', 177, 2, 5, 'Hip-Hop', '2017-04-14', 0, 'path/to/humble.mp3'),
    (28, 'Loyalty.', 188, 2, 5, 'Hip-Hop', '2017-04-14', 0, 'path/to/loyalty.mp3'),
    (29, 'LOVE.', 210, 2, 5, 'Hip-Hop', '2017-04-14', 0, 'path/to/love.mp3');

INSERT INTO Subscriptions
VALUES (1, GETDATE(), GETDATE() + 30)

INSERT INTO Subscriptions
VALUES (0, GETDATE(), NULL);


INSERT INTO Users 
VALUES (0, 'kyleg', 'Kyle', 'Gardner', 
		'kylegardner@oakland.edu', 
		'jfeowjofFAKEHASHfewkajf', 
		'2024-11-11', 
		0);

INSERT INTO Users
VALUES (1, 'willmac', 'William', 'MacLean',
		'williammaclean@oakland.edu',
		'fEJWAJFEOWAJjfjewojafoewja',
		GETDATE(),
		1);

INSERT INTO Users
VALUES (2, 'angelog', 'Angelo', 'Giambrone',
		'giambrone@oakland.edu',
		'fewaojfewajfoewjaofwe',
		GETDATE(),
		1);

INSERT INTO Playlists
VALUES (0, 0, 'Kyles likes', GETDATE());

INSERT INTO Playlists
VALUES (1, 1, 'Wills likes', GETDATE());

INSERT INTO Playlists
VALUES (2, 2, 'Angelos likes', GETDATE());

INSERT INTO Playlists
VALUES (3, 0, 'Random Playlist', GETDATE());

-- Playlist 0
INSERT INTO SongSet 
VALUES 
(0, 5, GETDATE()),
(0, 12, GETDATE()),
(0, 19, GETDATE()),
(0, 3, GETDATE()),
(0, 27, GETDATE());

-- Playlist 1
INSERT INTO SongSet 
VALUES 
(1, 8, GETDATE()),
(1, 15, GETDATE()),
(1, 20, GETDATE()),
(1, 2, GETDATE()),
(1, 11, GETDATE());

-- Playlist 2
INSERT INTO SongSet 
VALUES 
(2, 1, GETDATE()),
(2, 13, GETDATE()),
(2, 17, GETDATE()),
(2, 23, GETDATE()),
(2, 9, GETDATE());

-- Playlist 3 (Every song 0-27)
INSERT INTO SongSet 
VALUES 
(3, 0, GETDATE()),
(3, 1, GETDATE()),
(3, 2, GETDATE()),
(3, 3, GETDATE()),
(3, 4, GETDATE()),
(3, 5, GETDATE()),
(3, 6, GETDATE()),
(3, 7, GETDATE()),
(3, 8, GETDATE()),
(3, 9, GETDATE()),
(3, 10, GETDATE()),
(3, 11, GETDATE()),
(3, 12, GETDATE()),
(3, 13, GETDATE()),
(3, 14, GETDATE()),
(3, 15, GETDATE()),
(3, 16, GETDATE()),
(3, 17, GETDATE()),
(3, 18, GETDATE()),
(3, 19, GETDATE()),
(3, 20, GETDATE()),
(3, 21, GETDATE()),
(3, 22, GETDATE()),
(3, 23, GETDATE()),
(3, 24, GETDATE()),
(3, 25, GETDATE()),
(3, 26, GETDATE()),
(3, 27, GETDATE());
