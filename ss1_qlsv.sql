drop database M3_C0525L1;
create database if not exists M3_C0525L1;
use M3_C0525L1;
create table codegym(
accout varchar(50) primary key,
pass varchar(20)
);
create table class(
id int primary key auto_increment,
name varchar(50)
);
create table student(
id int primary key auto_increment,
name varchar(50),
gender boolean,
dob date,
email varchar(50),
score float,
accout varchar(50) unique,
class_id int,
foreign key(accout) references codegym(accout),
foreign key(class_id) references class(id)
);
create table phone(
phone_number varchar(10),
student_id int,
foreign key(student_id) references student(id)
);
create table instructor(
id int primary key auto_increment,
name varchar(50),
birthday date,
gender boolean,
email varchar(50),
salary float
);
create table instructor_class(
instructor_id int,
class_id int,
start_time date,
end_time date,
primary key (instructor_id,class_id),
foreign key (instructor_id) references instructor(id),
foreign key (class_id) references class(id)
);