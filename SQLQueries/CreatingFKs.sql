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