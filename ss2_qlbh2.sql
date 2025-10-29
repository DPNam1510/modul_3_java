drop database QLBH2;
create database if not exists QLBH2;
use QLBH2;
create table Product (
pID int primary key auto_increment,
pName varchar(50),
pPrice float
);
create table Customer(
cID int primary key auto_increment,
cName varchar(50),
cAge int
);
create table Oder(
oID int primary key auto_increment,
cID int,
oDate date,
oTotalPrice float,
foreign key (cID) references Customer(cID)
);
create table OrderDetail(
oID int,
pID int,
primary key(oID,pID),
odQTY varchar(50),
foreign key(oID) references Oder(oID),
foreign key(pID) references Product(pID)
);