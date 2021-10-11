USE master;
GO
DROP DATABASE IF EXISTS BUS;
go
CREATE DATABASE Bus;
go
USE Bus;
go
CREATE TABLE [Route] (
	
	ID INT IDentity(1,1),
	[Name] VARCHAR(50),
	[Description] VARCHAR(100),
	PRIMARY KEY(ID)

);
go
CREATE TABLE Journey (
	
	ID INT Identity(1,1),
	[Name] VARCHAR(50),
	PRIMARY KEY(ID)

);
go
CREATE TABLE Route_journey (
	
	ID_route INT,
	ID_journey INT,
	PRIMARY KEY(ID_route,ID_journey),
	FOREIGN KEY(ID_route) REFERENCES [Route](ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID)

);
go
CREATE TABLE Route_log (
	
	ID INT Identity(1,1),
	pass_average INT,
	[Date] DATE,
	ID_route INT,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_route) REFERENCES [Route](ID)

);
go
CREATE TABLE Town (
	
	ID INT Identity(1,1),
	[Name] VARCHAR(50),
	PRIMARY KEY(ID),
	
);
go
CREATE TABLE Garage (
	
	ID INT Identity(1,1),
	[Name] VARCHAR(50),
	Capacity INT,
	ID_town INT,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_town) REFERENCES Town(ID)

);
go
CREATE TABLE Journey_town (
	
	ID_town INT,
	ID_journey INT,
	PRIMARY KEY(ID_town,ID_journey),
	FOREIGN KEY(ID_town) REFERENCES Town(ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID),

);
go
CREATE TABLE Driver (
	
	ID INT Identity(1,1),
	[Name] VARCHAR(50),
	[Address] VARCHAR(100),
	Telephone varchar(50),
	ID_journey INT,
	PRIMARY KEY(ID),
	FOREIGN KEY(ID_journey) REFERENCES Journey(ID)

);
go
CREATE TABLE Type_bus (
	
	ID INT Identity(1,1),
	[Description] VARCHAR(100),
	PRIMARY KEY(ID)

);
go
CREATE TABLE Bus (
	
	licence_plate VARCHAR(50),
	capacity INT,
	size VARCHAR(50),
	ID_type_bus INT,
	ID_route INT,
	PRIMARY KEY(licence_plate),
	FOREIGN KEY(ID_type_bus) REFERENCES Type_bus(ID),
	FOREIGN KEY(ID_route) REFERENCES [Route](ID)

);


