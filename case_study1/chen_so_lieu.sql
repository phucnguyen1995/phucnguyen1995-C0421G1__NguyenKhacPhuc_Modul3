use case_study2;

insert into vi_tri(ten_vi_tri)
values ('Le Tan'), ('Phuc vu'), ('Chuyen vien'), ('Giam sat'), ('Quan ly'), ('Giam doc');

insert into trinh_do(trinh_do)
values ('Trung cap'), ('Cao dang'), ('Dai hoc'), ('Sau dai hoc');

insert into bo_phan(ten_bo_phan)
values ('Sale-marketing'), ('Hanh chinh'), ('Phuc vu'), ('Quan ly');

insert into nhan_vien
values (1, 'Nguyễn Khắc Phục', '1995-2-3', '200123456', '5000000', '0909123456', 'phuc@gmail.com', 'Đà Nẵng', 6, 2, 3);
insert into nhan_vien
values	(2, 'Hồ Văn Kỳ Tài', '1993-11-25', '200123457', '5500000', '0909123457', 'tai@gmail.com', 'Huế', 2, 1, 3),
	    (3, 'Nguyễn Thị Thanh Hà', '1996-05-15', '200123458', '6000000', '0909123458', 'ha@gmail.com', 'Quang Tri', 3, 3, 2),
	    (4, 'Lê Văn Diệp', '1997-01-13', '200123459', '2001234589', '0909123459', 'diep@gmail.com', 'Da Nang', 5, 4, 4);
       
       
insert into loai_khach (ten_loai_khach)
values ('Diamond'), ('Platinum'), ('Gold'), ('Silver'), ('Member');

insert into khach_hang
values  (1, 'Nguyễn Tiến Danh', '2001-10-20', '123456789', '0909090909', 'danh@gmail.com', 'Quảng Nam', 5),
		(2, 'Lê Văn Diệp', '1981-05-05', '123123123', '0909123123', 'diep@gmail.com', 'Đà Nẵng', 3),
		(3, 'Đặng Nhật Linh', '1971-08-05', '123123890', '0909123454', 'linh@gmail.com', 'Quảng Bình', 2),
		(4, 'Trần Gia Bảo', '1988-12-09', '123112390', '0923523454', 'bao@gmail.com', 'Quảng Trị', 3);
		insert into khach_hang
values (5, 'Trần Gia Hưng', '1988-12-09', '123112390', '0923523454', 'hung@gmail.com', 'Quảng Trị', 1);
insert into khach_hang values (6, 'Trần Gia Khải', '1988-12-09', '123112390', '0923523454', 'khai@gmail.com', 'Quảng Trị', 1);
insert into khach_hang values (7, 'Trần Gia Kha', '1988-12-09', '123112390', '0923523454', 'kha@gmail.com', 'Quảng Trị', 1);

UPDATE `case_study2`.`hop_dong` SET `ngay_lam_hop_dong` = '2015-01-15', `ngay_ket_thuc` = '2015-01-20' WHERE (`id_hop_dong` = '2');

insert into kieu_thue(ten_kieu_thue)
values	('Thuê theo giờ'),
		('Thuê theo ngày'),
		('Thuê theo tháng'),
		('Thuê theo năm');
        
insert into loai_dich_vu(ten_loai_dich_vu)
values	('Villa'),
		('House'),
        ('Room');
        
insert into dich_vu
values	(1, 'Thuê Villa', 200, 4, 10, 20000000, 'Tốt', 2, 1),
		(2, 'Thuê House', 250, 5, 10, 30000000, 'Tốt', 3, 2),
		(3, 'Thuê Villa', 220, 3, 8, 18000000, 'Tốt', 1, 1),
		(4, 'Thuê Room', 50, 0, 4, 7000000, 'Tốt', 2, 3);
        
insert into hop_dong
values  (1, '2021-03-30', '2021-04-02', 5000000,1,1,1),
		(2, '2021-01-15', '2021-01-20', 3000000,1,2,1),
		(3, '2021-05-08', '2021-05-15', 3000000,2,3,1),
		(4, '2021-08-15', '2021-08-20', 3000000,3,1,1);
insert into hop_dong values 	(5, '2021-08-15', '2021-08-20', 3000000,3,5,1);
insert into hop_dong values 	(7, '2018-08-15', '2021-08-20', 3000000,3,5,1);

UPDATE `case_study2`.`hop_dong` SET `ngay_lam_hop_dong` = '2019-05-08', `ngay_ket_thuc` = '2019-05-15' WHERE (`id_hop_dong` = '3');

                
insert into dich_vu_di_kem
values	(1, 'Massage', 500000, 'Giờ', 'Khả dụng'),
		(2, 'Karaoke', 900000, 'Giờ', 'Khả dụng'),
		(3, 'Thức ăn', 300000, 'Ký', 'Khả dụng'),
		(4, 'Nước uống', 50000, 'Lít', 'Khả dụng'),
		(5, 'Thuê xe tham quan', 350000, 'Giờ', 'Khả dụng');
        
insert into hop_dong_chi_tiet
values	(1, 2, 1, 2),
		(2, 5, 3, 5),
		(3, 1, 2, 3),
		(4, 10, 1, 1);