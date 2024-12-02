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