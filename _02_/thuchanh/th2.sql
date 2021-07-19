create database quanlydiemthi;
use quanlydiemthi;
create table quanlydiemthi.hocsinh(
ma_hs varchar(50) primary key,
ten_hs varchar(50) not null,
ngay_sinh  date,
lop  varchar(50) not null,
gt  varchar(50) not null );
create table quanlydiemthi.monhoc(
ma_mh varchar(50) primary key,
ten_mh varchar(50)
);
create table quanlydiemthi.bangdiem(
ma_hs varchar(50) ,
ma_mh varchar(50) ,
diemthi double,
ngay_kt date,
primary key(ma_hs,ma_mh),
foreign key (ma_hs) references hocsinh(ma_hs),
foreign key(ma_mh) references monhoc(ma_mh)
);
create table giaovien(
ma_gv varchar(50) primary key,
ten_gv varchar(50),
sdt varchar(50)
);
alter table monhoc add ma_gv varchar(50);
alter table monhoc add constraint fk_ma_gv foreign key (ma_gv) references giaovien(ma_gv);