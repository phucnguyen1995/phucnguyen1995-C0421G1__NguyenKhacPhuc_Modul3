create database quanlysinhvien;
use quanlysinhvien;
create table class(
class_id int auto_increment primary key,
class_name varchar(60) not null,
start_date date,
status bit
-- BIT	chứa số từ 1 đến 64. giá trị mặc định là 1
);
create table students(
student_id int auto_increment primary key,
studen_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
foreign key(class_id) references class(class_id)  
);
create table subject1(
sub_id int auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit>=1),
`status` bit default 1
);
create table mark(
mark_id int auto_increment primary key,
sub_id int not null ,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
-- TINYINT(size)	chứa từ 0 đến 255
unique(sub_id,student_id),
foreign key(sub_id) references subject1(sub_id),
foreign key(student_id) references students(student_id)
);
