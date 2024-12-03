select Songs.title, timesPlayed from Songs
inner join Albums on Songs.albumID = Albums.albumID
where Albums.title = 'To Pimp a Butterfly'
