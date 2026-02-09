-- projet alarme anti intrusion -- 


-- table users (pour authentification RFID) 

create table users(
	userid int primary key auto_increment,
	name varchar(100),
	rfidkey varchar(16)
	-- éventuellement élément rôle - à voir -- 
);

create table logevents(
	eventid int primary key auto_increment,
	triggered timestamp,
	sensor enum('rfid','PIR','doorcheck'),
	sensor_value varchar(100) -- open/closed pour la porte / clé rfid scannée
);

create table logactions(
	actionid int primary key auto_increment,
	triggered timestamp,
	actuator enum('lock','screen','buzz','led'),
	command varchar(100) -- lock / unlock || display || trigger - à voir encore
);	

create table statusgen(
	statusid int primary key auto_increment,
	at_time timestamp,
	status enum('0','1','2'),
	source enum('rfid','PIR','doorcheck','user') -- who / what changed the status
);

insert into users(name, rfidkey) values ('admin', 'A3C4F1B7');
