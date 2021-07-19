drop database if exists bt1;
create database bt1;
use bt1;
create table phieu_nhap(
so_pn int primary key,
ngay_nhap datetime
);
create table so_dien_thoai(
id int primary key,
so_dien_thoai varchar(50)
);
create table phieu_xuat(
so_px int primary key,
ngay_xuat datetime
);

create table vat_tu(
ma_vt varchar(50) primary key,
ten_vt varchar(50)
);

create table  chi_tiet_phieu_xuat(
phieu_xuat_so_px int,
vat_tu_ma_vt varchar(50),
don_gia_xuat double,
so_luong_xuat int,
primary key (phieu_xuat_so_px,vat_tu_ma_vt),
foreign key(phieu_xuat_so_px) references phieu_xuat(so_px),
foreign key(vat_tu_ma_vt) references vat_tu(ma_vt)
);

create table chi_tiet_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int,
vat_tu_ma_vt varchar(50),
phieu_nhap_so_pn int,
primary key(vat_tu_ma_vt,phieu_nhap_so_pn),
foreign key(vat_tu_ma_vt) references vat_tu(ma_vt),
foreign key(phieu_nhap_so_pn) references phieu_nhap(so_pn)
);









create table nha_cung_cap(
ma_ncc varchar(50) primary key,
ten_ncc varchar(50),
dia_chi varchar(50),
so_dien_thoai_id int,
foreign key(so_dien_thoai_id) references so_dien_thoai(id)
);

create table don_dat_hang(
so_don_hang int primary key,
ngay_dat_hang datetime,
nha_cung_cap_ma_ncc varchar(50),
foreign key(nha_cung_cap_ma_ncc) references nha_cung_cap(ma_ncc)
);
create table chi_tiet_don_dat_hang(
vat_tu_ma_vt varchar(50),
don_dat_hang_so_don_hang int,
primary key(vat_tu_ma_vt,don_dat_hang_so_don_hang),
foreign key(vat_tu_ma_vt) references vat_tu(ma_vt),
foreign key(don_dat_hang_so_don_hang) references don_dat_hang(so_don_hang)
);


