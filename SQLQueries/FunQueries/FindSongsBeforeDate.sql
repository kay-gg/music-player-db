select title, Artists.name, releaseDate from songs
inner join Artists on Songs.artistID = Artists.artistID
where Songs.releaseDate < '2014-01-01'
order by releaseDate desc