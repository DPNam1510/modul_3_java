-- Bước 1:
drop database if exists demo;
create database demo;
use demo;
-- Bước 2:
create table products(
Id int primary key auto_increment,
pCode varchar(20),
pName varchar(20),
pPrice float,
pAmount int,
pDescription varchar(20),
pStatus varchar(20)
);
insert into products(pCode, pName, pPrice, pAmount, pDescription, pStatus)
values
('p1', 'iphone', 1200, 1, '17 promax', 'null'),
('p2', 'samsung', 1000, 2, 's25 ultra','null'),
('p3', 'xiaomi', 800, 3, 'redmi note 14', 'null'),
('p4', 'huawei', 700, 4, 'huawei mate 30', 'null'),
('p5', 'honor', 600, 5, 'honor magic 5 pro', 'null');
select * from products;
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_pCode on products(pCode); 
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)	
create index i_name_price on products(pName, pPrice);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where pCode = 'p1';
-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
select pCode, pName, pPrice, pStatus
from products;
select * from products_view;
-- Tiến hành sửa đổi view
create or replace view products_view as
select pCode, pName, pPrice, pStatus
from products;
update products_view
set pPrice = 900
where pCode = 'p2';
select * from products_view;
-- Tiến hành xoá view
delete from products_view
where pCode = 'p5';
select * from products_view;
-- Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure all_product()
begin
select * from products;
end //
DELIMITER;
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure add_product(
    IN pCode VARCHAR(50),
    IN pName VARCHAR(100),
    IN pPrice FLOAT,
    IN pAmount INT,
    IN pDescription VARCHAR(20),
    IN pStatus VARCHAR(20)
)
BEGIN
    INSERT INTO Products(pCode, pName, pPrice, pAmount, pDescription, pStatus)
    VALUES(pCode, pName, pPrice, pAmount, pDescription, pStatus);
END //
DELIMITER ;
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure update_product_by_id(
    IN p_Id INT,
    IN p_Name VARCHAR(100),
    IN p_Price FLOAT,
    IN p_Amount INT,
    IN p_Description VARCHAR(20),
    IN p_Status VARCHAR(20)
)
BEGIN
    UPDATE Products
    SET pName = p_Name,
        pPrice = p_Price,
        pAmount = p_Amount,
        pDescription = p_Description,
        pStatus = p_Status
    WHERE ID = p_ID;
END //
DELIMITER ;
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure delete_product_by_id(IN p_ID INT)
BEGIN
    DELETE FROM Products WHERE ID = p_ID;
END //
DELIMITER ;
-- Test store procedure
CALL all_product();
CALL add_product('p6', 'nokia', 400, 6, 'nokia 1280', 'null');
CALL update_product_by_id(3, 'xiaomi', 880, 3, 'redmi note 5', 'null');
CALL delete_product_by_id(4);
select * from products;





