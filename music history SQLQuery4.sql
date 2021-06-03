
select * from song;
select * from artist;

SELECT s.Title,
       a.ArtistName
  FROM Song s
       LEFT JOIN Artist a on s.ArtistId = a.id;

select a.ArtistName,
s.title
from artist a JOIN Song s on a.id = s.ArtistId;

--crud

--read

select * from genre;

-- create

INSERT INTO Genre (name) VALUES ('Techno');

-- update

update genre    
set name = 'folk'
where id = 16;

--delete

delete from genre where id = 36;