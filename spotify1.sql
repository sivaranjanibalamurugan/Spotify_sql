create database spotify1;
use spotify1;
-------------creating table------
create table UsersDetail
(
id int identity(1,1)primary key,
username varchar(20),
email varchar(20),
country varchar(10)
)
insert into  UsersDetail values ('xxx','ssss@gmail.com','India'),('yyyy','yyyy@gmail.com','India'),('Bridgelabs','bridgelab@gmail.com','India'),
('xxx','xxxx@gmail.com','India'),('yyyy','abc@gmail.com','India'),('Bridgelabs','bridgelab1@gmail.com','India')
select * from UsersDetail
---------------------
create table TrackDetailss
(
trackid int identity(1,1)primary key,
market varchar(20),
track varchar(20)
)
insert into TrackDetailss values ('US','vinyl'),('IN','wax'),('US','tape'),('ES','wax'),('US','tape'),('ES','vinyl')
select * from TrackDetailss
------------------------------
Alter table UsersDetail Add foreign key (id) REFERENCES TrackDetailss(trackid)
------------------------------
SELECT UsersDetail.username,TrackDetailss.track
FROM  UsersDetail
INNER JOIN TrackDetailss
ON UsersDetail.id = TrackDetailss.trackid where UsersDetail.username = 'Bridgelabs';
----------------------------------------------
create table playlistTable
(
playlistid int identity(1,1)primary key,
market varchar(20),
additionaltype  varchar(20),
field varchar(20),
playlist varchar(20)
)
insert into playlistTable values('ES','aaa','track','melody'),('US','bbbb','artist','rock'),('IN','ccc','track','prayersongs'),
('US','ddd','track','workoutsongs'),('US','xxx','artist','mrngwakeup'),('ES','yyy','artist','devotionalsong')
select * from playlistTable 
-------------------------------------------------
Alter table playlistTable Add foreign key (playlistid) REFERENCES TrackDetailss(trackid)

SELECT UsersDetail.username,TrackDetailss.track,playlistTable.playlist
FROM  ((UsersDetail
INNER JOIN TrackDetailss
ON UsersDetail.id = TrackDetailss.trackid)
INNER JOIN playlistTable ON TrackDetailss.trackid = playlistTable.playlistid)where UsersDetail.username = 'Bridgelabs' and TrackDetailss.track= 'tape';
