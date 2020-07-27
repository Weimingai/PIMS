create database pims;

use pims;

create table admin
(
id int primary key auto_increment,
username varchar(20),
password varchar(20),
);

insert into admin values (null, admin,admin);

create table time
(
id int primary key auto_increment,
startTime datetime,
endTime datetime,
);

create table time
(
id int,
department varchar(20),
stuCount int,
);

insert into department values (1, '工商管理',2);
insert into department values (2, '会计学',2);
insert into department values (3, '财务管理',2);
insert into department values (4, '市场营销',2);
insert into department values (5, '人力管理',2);

create table student
(
id int primary key auto_increment,
stuNo varchar(20),
password varchar(20),
stuName varchar(20),
sex varchar(20),
stuSchool varchar(20)
stuGrade varchar(20),
oldDeparment varchar(20),
oldClass varchar(20),
newDeparment varchar(20),
basicScore double,
extraScore double,
stuRank int,
department1 varchar(20),
department2 varchar(20),
department3 varchar(20),
department4 varchar(20),
department5 varchar(20),
department6 varchar(20),
department7 varchar(20),
department8 varchar(20),
department9 varchar(20),
department10 varchar(20),
updateTime datetime,
);

insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '001','123456','曹文华','男','管理学院','2017级','工商管理类','工商类1701',92,5,1);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '002','123456','李文华','男','管理学院','2017级','工商管理类','工商类1701',90,5,2);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '003','123456','王文华','男','管理学院','2017级','工商管理类','工商类1701',88,5,3);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '004','123456','马文华','男','管理学院','2017级','工商管理类','工商类1701',87,5,4);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '005','123456','赵文华','男','管理学院','2017级','工商管理类','工商类1701',86,5,5);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '006','123456','钱文华','男','管理学院','2017级','工商管理类','工商类1701',85,5,6);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '007','123456','孙文华','男','管理学院','2017级','工商管理类','工商类1701',84,5,7);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '008','123456','周文华','男','管理学院','2017级','工商管理类','工商类1701',83,5,8);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '009','123456','吴文华','男','管理学院','2017级','工商管理类','工商类1701',82,5,9);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '010','123456','郑文华','男','管理学院','2017级','工商管理类','工商类1701',81,5,10);

insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '011','123456','曹文文','男','管理学院','2018级','工商管理','工商1701',92,5,1);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '012','123456','李文文','男','管理学院','2018级','工商管理','工商1701',90,5,2);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '013','123456','王文文','男','管理学院','2018级','工商管理','工商1701',88,5,3);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '014','123456','马文文','男','管理学院','2018级','工商管理','工商1701',87,5,4);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '015','123456','赵文文','男','管理学院','2018级','工商管理类','工商类1701',86,5,5);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '016','123456','钱文文','男','管理学院','2018级','工商管理类','工商类1701',85,5,6);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '017','123456','孙文文','男','管理学院','2018级','工商管理类','工商类1701',84,5,7);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '018','123456','周文文','男','管理学院','2018级','工商管理类','工商类1701',83,5,8);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '019','123456','吴文文','男','管理学院','2018级','工商管理类','工商类1701',82,5,9);
insert into student(id,stuNo,password,stuName,sex,stuSchool,stuGrade,oldDeparment,oldClass,basicScore,extraScore,stuRank) values (null, '020','123456','郑文文','男','管理学院','2018级','工商管理类','工商类1701',81,5,10);