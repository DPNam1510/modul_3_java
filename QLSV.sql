drop database if exists QLSV;
create database QLSV;
use QLSV;
create table Class(
ClassID int primary key auto_increment,
ClassName varchar(10),
StartDate date,
Status int
);
create table Student(
StuID int primary key auto_increment,
StuName varchar(20),
Address varchar(20),
phone varchar(15),
Status int,
CLASS_ID int,
foreign key(CLASS_ID) references Class(ClassID)
);
create table Subject(
SubID int primary key auto_increment,
SubName varchar(20),
Credit int,
Status int
);
create table Mark(
MarkID int primary key auto_increment,
Mark_SubID int,
Mark_StuID int,
Mark int,
ExamTimes int,
foreign key(Mark_SubID) references Subject(SubID),
foreign key(Mark_StuID) references Student(StuID)
);
INSERT INTO class(ClassName, StartDate, Status)
VALUES ('C1', '2006-12-24', 1);
INSERT INTO class(ClassName, StartDate, Status)
VALUES ('C2', '2006-12-25', 1);
INSERT INTO class(ClassName, StartDate, Status)
VALUES ('C3', '2000-10-15', 2);
INSERT INTO student(StuName, Address, Phone, Status, CLASS_ID)
VALUES ('Nam', 'Nghe An', '0911574798', 1, 1);
INSERT INTO student(StuName, Address, Phone, Status, CLASS_ID)
VALUES ('Huy', 'Da Nang', '0911574798', 1, 2);
INSERT INTO student(StuName, Address, Phone, Status, CLASS_ID)
VALUES ('Hung', 'Da Nang', '0911574798', 1, 1);
INSERT INTO student(StuName, Address, Phone, Status, CLASS_ID)
VALUES ('Nhat', 'Gia lai', '0911574798', 1, 2);
INSERT INTO subject(SubName, Credit, Status)
VALUES ('TH', 5, 1);
INSERT INTO subject(SubName, Credit, Status)
VALUES ('VL', 2, 1);
INSERT INTO subject(SubName, Credit, Status)
VALUES ('HH', 4, 1);
INSERT INTO subject(SubName, Credit, Status)
VALUES ('AV', 3, 1);
INSERT INTO Mark (Mark_SubID, Mark_StuID, Mark, ExamTimes)
VALUES (1, 1, 6, 1);
INSERT INTO Mark (Mark_SubID, Mark_StuID, Mark, ExamTimes)
VALUES (2, 2, 7, 1);
INSERT INTO Mark (Mark_SubID, Mark_StuID, Mark, ExamTimes)
VALUES (3, 3, 8, 1);
INSERT INTO Mark (Mark_SubID, Mark_StuID, Mark, ExamTimes)
VALUES (4, 4, 9, 1);

#1. Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’

select * from Student where StuName like'H%';

# 2. Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.

select * from Class where month(StartDate)=12;

# 3. Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.

select * from Subject where Credit in(3,4,5);

# 4. Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.

update Student set CLASS_ID = 2 where StuID= 5;

# 5 .Hiển thị các thông tin: StuName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

SELECT Stu.StuName, Sub.SubName, M.Mark
FROM Mark M
JOIN Student Stu ON M.Mark_StuID = Stu.StuID
JOIN subject Sub ON M.Mark_SubID = Sub.SubID
ORDER BY M.Mark DESC, Stu.StuName ASC;
 