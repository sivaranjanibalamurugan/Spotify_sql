create database spotifyapp;
use spotifyapp;
-------------creating table------
create table UserDetails
(
id int ,
username varchar(20)primary key,
email varchar(20),
country varchar(10)
)
insert into  UserDetails values (1,'xxx','ssss@gmail.com','India'),(2,'yyyy','yyyy@gmail.com','India'),(3,'Bridgelabs','bridgelab@gmail.com','India')
select * from UserDetails
---------------------
create table TrackDetails
(
id int,
username varchar(20)primary key,
track varchar(20)
)
insert into TrackDetails values (1,'xxx','vinyl'),(2,'yyyy','wax'),(3,'Bridgelabs','tape')

select * from TrackDetails
------------------------------
Alter table UserDetails Add foreign key (username) REFERENCES TrackDetails(username)
------------------------------
SELECT UserDetails.username,TrackDetails.track
FROM  UserDetails
INNER JOIN TrackDetails
ON UserDetails.username = TrackDetails.username where UserDetails.username = 'Bridgelabs';
----------------------------------------------
create table playlistTable
(
id int,
username varchar(20)primary key,
artist varchar(20),
playlist varchar(20)
)
insert into playlistTable values(1,'xxx','aaa','melody'),(2,'yyyy','bbbb','rock'),(3,'Bridgelabs','ccc','prayersongs')
select * from playlistTable 
-------------------------------------------------
Alter table playlist Add foreign key (username) REFERENCES TrackDetails(username)

SELECT UserDetails.username,TrackDetails.track,playlistTable.playlist
FROM  ((UserDetails
INNER JOIN TrackDetails
ON UserDetails.username = TrackDetails.username)
INNER JOIN playlistTable ON TrackDetails.username = playlistTable.username)where playlistTable.playlist = 'prayersongs';
