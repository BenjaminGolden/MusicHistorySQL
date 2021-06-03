SELECT * FROM Genre;

Select * from album;

SELECT * FROM Artist Order by ArtistName;

SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

SELECT album.title,
       artist.ArtistName,
       genre.[Name]
  FROM ALBUM 
       LEFT JOIN Artist on album.artistid = artist.id
       Left Join genre  on album.genreid = genre.id
Where  Name = 'pop'

SELECT album.title,
       artist.ArtistName,
       genre.[Name]
  FROM ALBUM 
        --    joining the Artist table with the album table where the album.artistid = artist.id on the artist table
       LEFT JOIN Artist on album.artistid = artist.id
       Left Join genre  on album.genreid = genre.id
Where  Name = 'rock' OR Name = 'jazz';

SELECT album.title
from album
LEFT JOIN song on album.Id = song.AlbumId
where song.AlbumId is null

INSERT INTO artist (ArtistName, YearEstablished) VALUES ('Mark OConnor', 1970);

INSERT INTO album (Title, ReleaseDate, AlbumLength, [label], ArtistId, GenreId) 
VALUES ('Markology', '02/21/2021', 2760, 'Columbia', 29, 16);

DELETE FROM album where id = 23;

INSERT INTO song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) 
VALUES ('Shenandoa', 286, '02/21/2021', 16, 29, 24),
 ('Flailing', 370, '02/21/2021', 16, 29, 24),
 ('Beaumont Rag', 237, '02/21/2021', 16, 29, 24);

 SELECT SONG.Title,
 ALBUM.TITLE,
 artist.artistname
 from song
 LEFT JOIN Artist on song.ArtistId = artist.id
 left join album on song.ArtistId = album.Artist
 where artist.artistname = 'mark oconnor';

SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.Id;
SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.Id;

--Write a SELECT statement to display how many songs exist for each album. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(*) as NumberOfSongs, album.title as Album
FROM SONG
left join album on song.AlbumId = Album.Id
group by Song.AlbumId, Album.Title

--Write a SELECT statement to display how many songs exist for each artist. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count(*) as NumberOfSongs, artist.ArtistName as Artist
From Song
LEFT JOIN artist on song.ArtistId = Artist.Id
group by song.ArtistId, artist.ArtistName

--Write a SELECT statement to display how many songs exist for each genre. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence

SELECT  count(*) as NumberOfSongs, genre.[name] as GenreName
from song
left join genre on song.genreid = genre.id
group by song.GenreId, genre.Name;

--Write a SELECT query that lists the Artists that have put out records on more than one record label. 
--Hint: When using GROUP BY instead of using a WHERE clause, use the HAVING keyword

SELECT artist.ArtistName
From Album 
Left Join artist on album.ArtistId = Artist.Id
group by album.label, artist.ArtistName
having count(album.label) > 1

--Using MAX() function, write a select statement to find the album with the longest duration. 
--The result should display the album title and the duration.

Select album.title, album.AlbumLength
from album 
where AlbumLength = (
Select max(AlbumLength)
from album)


--Using MAX() function, write a select statement to find the song with the longest duration. 
--The result should display the song title and the duration.

SELECT song.SongLength
from Song
where SongLength = (
select max(songlength)
from song)

--Modify the previous query to also display the title of the album.

SELECT song.SongLength, song.Title
from Song
where SongLength = (
select max(songlength)
from song)