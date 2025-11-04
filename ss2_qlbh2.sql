drop database if exists QLBH2;
create database QLBH2;
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
INSERT INTO Customer(cName, cAge)
VALUE ('Minh Quan', 10);
INSERT INTO Customer(cName, cAge)
VALUE ('Ngoc Oanh', 20);
INSERT INTO Customer(cName, cAge)
VALUE ('Hong Ha', 10);
INSERT INTO Oder(cID, oDate, oTotalPrice)
VALUE (1, '2006-3-21', NULL);
INSERT INTO Oder(cID, oDate, oTotalPrice)
VALUE (2, '2006-3-23', NULL);
INSERT INTO Oder(cID, oDate, oTotalPrice)
VALUE (1, '2006-3-16', NULL);
INSERT INTO Product(pName, pPrice)
VALUE ('May Giat', 3);
INSERT INTO Product(pName, pPrice)
VALUE ('Tu Lanh', 5);
INSERT INTO Product(pName, pPrice)
VALUE ('Dieu Hoa', 7);
INSERT INTO Product(pName, pPrice)
VALUE ('Quat', 1);
INSERT INTO Product(pName, pPrice)
VALUE ('Bep Dien', 2);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (1, 1, 3);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (1, 3, 7);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (1, 4, 2);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (2, 1, 1);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (3, 1, 8);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (2, 5, 4);
INSERT INTO OrderDetail(oID, pID, odQTY)
VALUE (2, 3, 3);
-- 1. Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice FROM Oder;
-- 2. Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.cName as 'Customer', p.pName as 'Product'
FROM Customer c
JOIN Oder o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON p.pID = od.pID;
-- 3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cName as 'Customer'
FROM Customer c
LEFT JOIN Oder o ON c.cID = o.cID
WHERE o.cID = NULL;
-- 4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID as 'id', o.oDate as 'Date', sum(od.odQTY * p.pPrice) as 'Price'
from Oder o
LEFT JOIN OrderDetail od on o.oID = od.oID
LEFT JOIN product p on od.pID = p.pID
GROUP BY o.oID, o.oDate;