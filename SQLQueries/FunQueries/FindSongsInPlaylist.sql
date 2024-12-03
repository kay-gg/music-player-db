select Users.username, Songs.title 
from Users
inner join Playlists on Users.userID = Playlists.userID
inner join SongSet on Songset.playlistID = Playlists.playlistID
inner join Songs on SongSet.songID = Songs.songID
where username = 'angelog'