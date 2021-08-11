-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một 
-- trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
use case_study2;
select * 
from nhan_vien 
where ho_ten like 'h%' or ho_ten like 't%' or ho_ten like 'k%'
and char_length(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở 
-- “Đà Nẵng” hoặc “Quảng Trị”.
SELECT* FROM khach_hang
WHERE ((year(CURDATE())-year(ngay_sinh)) BETWEEN 18 AND 50) AND dia_chi in ('Đà Nẵng','Quảng Trị');

select * from khach_hang
where ((year(CURDATE())-year(ngay_sinh)) BETWEEN 18 AND 50) and dia_chi like '%đà nẵng' or dia_chi like '%quảng trị';

select * from khach_hang 
where year(ngay_sinh) <= 2003 and year(ngay_sinh) >= 1971 and dia_chi like '%đà nẵng' or dia_chi like '%quảng trị';
-- 2003=2021-18
-- 1971=2021-50

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được
--  sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại 
--  khách hàng là “Diamond”.

select khach_hang.id_khach_hang,khach_hang.ho_ten,count(hop_dong.id_hop_dong) as so_lan_lam_hop_dong
from hop_dong join khach_hang on hop_dong.id_khach_hang=khach_hang.id_khach_hang
join loai_khach on khach_hang.id_loai_khach=loai_khach.id_loai_khach
where loai_khach.ten_loai_khach='Diamond'
group by id_khach_hang,khach_hang.ho_ten
order by so_lan_lam_hop_dong asc;

-- nếu kể lun khách không đặt phòng thì sẽ thành thế này-- 
select khach_hang.id_khach_hang,khach_hang.ho_ten,count(hop_dong.id_hop_dong) as so_lan_lam_hop_dong
from hop_dong right join khach_hang on hop_dong.id_khach_hang=khach_hang.id_khach_hang
 join loai_khach on khach_hang.id_loai_khach=loai_khach.id_loai_khach
-- where loai_khach.ten_loai_khach='Diamond'
group by id_khach_hang,khach_hang.ho_ten
order by so_lan_lam_hop_dong asc;

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,
--  TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và 
--  Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa 
--  từng đặt phòng cũng phải hiển thị ra).

select k.id_khach_hang, k.ho_ten, l.ten_loai_khach, h.id_hop_dong, d.ten_dich_vu, h.ngay_lam_hop_dong,
(d.chi_phi_thue + dv.gia * hd.so_luong) as 'Tong_tien'
from hop_dong h inner join dich_vu d on h.id_dich_vu = d.id_dich_vu
inner join hop_dong_chi_tiet hd on hd.id_hop_dong = h.id_hop_dong
inner join dich_vu_di_kem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
right join khach_hang k on k.id_khach_hang = h.id_khach_hang
inner join loai_khach l on l.id_loai_khach = k.id_loai_khach
group by(k.id_khach_hang);

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa
--  từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select d.id_dich_vu, d.ten_dich_vu, d.dien_tich, l.ten_loai_dich_vu
from dich_vu d inner join loai_dich_vu l on d.id_loai_dich_vu = l.id_loai_dich_vu
where not exists (select * from hop_dong h where h.id_dich_vu = d.id_dich_vu 
and h.ngay_lam_hop_dong between '2019-01-01' and '2019-03-31');

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả 
-- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng 
--  trong năm 2019.

select d.id_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu d inner join loai_dich_vu l on l.id_loai_dich_vu = d.id_loai_dich_vu
inner join hop_dong h on h.id_dich_vu = d.id_dich_vu
where year(h.ngay_lam_hop_dong) = '2018' and  not year(h.ngay_lam_hop_dong)='2019';
        
        select d.id_dich_vu, d.ten_dich_vu, d.dien_tich, d.so_nguoi_toi_da, d.chi_phi_thue, l.ten_loai_dich_vu
from dich_vu d inner join loai_dich_vu l on l.id_loai_dich_vu = d.id_loai_dich_vu
inner join hop_dong h on h.id_dich_vu = d.id_dich_vu
where year(h.ngay_lam_hop_dong) = '2018' and d.id_dich_vu not in(
		select h.id_dich_vu
        from hop_dong h
        where year(h.ngay_lam_hop_dong) = '2019'
        );
        
-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- Cách 1:
select ho_ten
from khach_hang
group by id_khach_hang; 

-- Cách 2:
select distinct ho_ten
from khach_hang;
-- Cách 3:

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao
--  nhiêu khách hàng thực hiện đặt phòng.

select month(h.ngay_lam_hop_dong) as 'thang trong 2019', count(h.id_hop_dong) as 'so lan khach hang dat phong'
from hop_dong h inner join khach_hang k on h.id_khach_hang = k.id_khach_hang
where year(h.ngay_lam_hop_dong) = 2019
group by `thang trong 2019`
order by `thang trong 2019` asc;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị
--  bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count
--  các IDHopDongChiTiet).

select hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,hdct.so_luong, count(id_hop_dong_chi_tiet)
from hop_dong hd join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
                  join dich_vu_di_kem dv on dv.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
group by hd.id_hop_dong;


-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang 
-- là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

select dv.ten_dich_vu_di_kem, dv.gia, dv.don_vi, k.ho_ten 
from dich_vu_di_kem dv inner join hop_dong_chi_tiet hd on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
inner join hop_dong h on hd.id_hop_dong = h.id_hop_dong
inner join khach_hang k on h.id_khach_hang = k.id_khach_hang
inner join loai_khach l on l.id_loai_khach = k.id_loai_khach
where l.ten_loai_khach = 'Diamond' 
and k.dia_chi like '%Vinh' or '%Quảng Ngãi';

-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem
--  (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 
--  3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

select h.id_hop_dong, n.ho_ten 'ten nhan vien', k.ho_ten 'ten khach hang', k.so_dien_thoai, d.ten_dich_vu, h.tien_dat_coc,
sum(hd.id_hop_dong_chi_tiet) as 'so luong dich vu di kem'
from khach_hang k inner join hop_dong h on k.id_khach_hang = h.id_khach_hang
inner join dich_vu d on h.id_dich_vu = d.id_dich_vu
inner join nhan_vien n on h.id_nhan_vien = n.id_nhan_vien
inner join hop_dong_chi_tiet hd on h.id_hop_dong = hd.id_hop_dong
where h.ngay_lam_hop_dong between '2019-10-01' and '2019-12-31'
and h.ngay_lam_hop_dong not between '2019-01-01' and '2019-06-30'
group by d.id_dich_vu;

-- and not exists (
-- 		select *
--         from hop_dong h
--         where h.id_dich_vu = d.id_dich_vu
--         and h.ngay_lam_hop_dong between '2019-01-01' and '2019-05-31'
--         )
-- group by d.id_dich_vu;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có 
-- thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dv.id_dich_vu_di_kem, dv.ten_dich_vu_di_kem, dv.gia, dv.don_vi, 
count(dv.id_dich_vu_di_kem) as 'so_lan_su_dung'
from dich_vu_di_kem dv 
inner join hop_dong_chi_tiet hd on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
inner join hop_dong h on h.id_hop_dong = hd.id_hop_dong
group by dv.ten_dich_vu_di_kem
having so_lan >= max(so_lan_su_dung);
-- order by so_lan desc;


-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao
--  gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
use case_study2;

select h.id_hop_dong, l.ten_loai_dich_vu, dv.ten_dich_vu_di_kem, 
count(dv.id_dich_vu_di_kem) as 'so_lan_su_dung'	
from dich_vu d inner join loai_dich_vu l on l.id_loai_dich_vu = d.id_loai_dich_vu
inner join hop_dong h on d.id_dich_vu = h.id_hop_dong
inner join hop_dong_chi_tiet hd on hd.id_hop_dong = h.id_hop_dong
inner join dich_vu_di_kem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
group by dv.ten_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi
--  mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

select n.id_nhan_vien, n.ho_ten, t.trinh_do, b.ten_bo_phan,
count(h.id_hop_dong) as 'so_lan_lap_hd'
-- count(h.id_nhan_vien) as 'so_lan_lap_hd'
from nhan_vien n inner join hop_dong h on h.id_nhan_vien = n.id_nhan_vien
inner join trinh_do t on t.id_trinh_do = n.id_trinh_do
inner join bo_phan b on b.id_bo_phan = n.id_bo_phan
where year(h.ngay_lam_hop_dong) between 2018 and 2019
group by h.id_nhan_vien
having so_lan_lap_hd <= 3;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
-- alter table nhan_vien
-- add constraint fk_vi_tri foreign key (id_vi_tri) references vi_tri(id_vi_tri) on delete cascade;
-- alter table nhan_vien
-- add constraint fk_trinh_do foreign key (id_trinh_do) references trinh_do(id_trinh_do) on delete cascade;
-- alter table nhan_vien
-- add constraint fk_bo_phan foreign key (id_bo_phan) references bo_phan(id_bo_phan) on delete cascade;

alter table hop_dong
add constraint fk_id_nhan_vien foreign key (id_nhan_vien) references nhan_vien(id_nhan_vien);
set SQL_SAFE_UPDATES = 0;
-- SET FOREIGN_KEY_CHECKS=0;
delete 
from nhan_vien 
where not exists (
select * 
from hop_dong  
where  hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien 
and year(hop_dong.ngay_lam_hop_dong) between 2017 and 2019
);
set SQL_SAFE_UPDATES = 1;
-- SET FOREIGN_KEY_CHECKS=1;


-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách
--  hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
drop  temporary table bang_phu;

create temporary table bang_phu (
select k.ho_ten, sum(d.chi_phi_thue) as 'tong_tien'
from khach_hang k  join hop_dong h on h.id_khach_hang = k.id_khach_hang
join dich_vu d on d.id_dich_vu = h.id_dich_vu
where year(h.ngay_lam_hop_dong) = 2019
group by k.id_khach_hang
having tong_tien > 10000000
);

update khach_hang 
set id_loai_khach = 1 
where id_loai_khach = 2 and id_khach_hang in (select id_khach_hang from bang_phu);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).

alter table hop_dong
add constraint fk_id_khach_hang  foreign key (id_khach_hang) references khach_hang(id_khach_hang) ;
-- ALTER TABLE <tên table chứa ràng buộc> DROP CONSTRAINT <tên ràng buộc muốn xóa bỏ>
ALTER TABLE hop_dong DROP CONSTRAINT  fk_id_khach_hang;
alter table hop_dong
add constraint fk_id_khach_hang  foreign key (id_khach_hang) references khach_hang(id_khach_hang) on delete cascade;
set SQL_SAFE_UPDATES = 0;
delete 
from khach_hang 
where not exists (
select * 
from hop_dong  
where  hop_dong.id_khach_hang = khach_hang.id_khach_hang 
and year(hop_dong.ngay_lam_hop_dong) < 2016
);
select * from khach_hang;
set SQL_SAFE_UPDATES = 1;

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
drop  temporary table bang_phu2;

create temporary table bang_phu2 (
select dv.id_dich_vu_di_kem, dv.gia,
count(hd.id_dich_vu_di_kem) as 'so_lan'
from hop_dong_chi_tiet hd inner join dich_vu_di_kem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
inner join hop_dong h on h.id_hop_dong = hd.id_hop_dong
where year(h.ngay_lam_hop_dong) = '2019'
group by dv.id_dich_vu_di_kem
having so_lan >10
);

set SQL_SAFE_UPDATES = 0;

update dich_vu_di_kem
set gia = gia*2
where gia in (select gia from bang_phu2);

set SQL_SAFE_UPDATES = 1;

-- update dich_vu_di_kem
-- set gia = gia*2
-- where exists (
-- select *,
-- count(hd.id_dich_vu_di_kem) as 'so_lan'
-- from hop_dong_chi_tiet hd inner join dich_vu_di_kem dv on dv.id_dich_vu_di_kem = hd.id_dich_vu_di_kem
-- inner join hop_dong h on h.id_hop_dong = hd.id_hop_dong
-- where year(h.ngay_lam_hop_dong) = '2019'
-- group by dv.id_dich_vu_di_kem
-- having so_lan > 10
-- );


-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển
--  thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.
 select n.id_nhan_vien as 'IDNhanVien, IDKhachHang' , n.ho_ten, n.email, n.so_dien_thoai, n.ngay_sinh, n.dia_chi 
from nhan_vien n
union all
select k.id_khach_hang, k.ho_ten, k.email, k.so_dien_thoai, k.ngay_sinh, k.dia_chi 
from khach_hang k;

-- select *
-- from nhan_vien left join hop_dong on nhan_vien.id_nhan_vien=hop_dong.id_hop_dong
-- right join khach_hang on khach_hang.id_khach_hang=hop_dong.id_khach_hang;

-- 21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là
--  “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”

create view v_nhan_vien as
select n.id_nhan_vien, n.ho_ten, n.ngay_sinh, n.so_cmnd, n.so_dien_thoai, n.dia_chi, n.email
from nhan_vien n inner join hop_dong h on n.id_nhan_vien = h.id_nhan_vien
where h.ngay_lam_hop_dong = '2019-12-12'
group by id_nhan_vien
having dia_chi like 'hải châu%';

select * from  v_nhan_vien;


-- 22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên
--  được nhìn thấy bởi khung nhìn này.

update nhan_vien
set dia_chi = 'Đà Nẵng'
where id_nhan_vien in (
select id_nhan_vien from v_nhan_vien
);

-- 23.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào 
-- như là 1 tham số của Sp_1
use case_study2;
drop procedure if exists sp_1;
DELIMITER //
create procedure sp_1 (in id_khach int)
begin
if id_khach in (select id_khach_hang from khach_hang) then
	delete 
    from khach_hang
    where id_khach_hang = id_khach;
else select " dữ liệu id_khach bạn nhập vào là không tồn tại";
end if;
end
// DELIMITER ;
call sp_1(10);



-- 24.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra 
-- tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham 
-- chiếu đến các bảng liên quan.
drop procedure if exists sp_2;
DELIMITER //
create procedure sp_2 (in ngay_bd date, in ngay_kt date, in tien int, id_nv int, id_kh int, id_dv int)
begin
if id_nv in (select id_nhan_vien from nhan_vien) and
 id_kh in (select id_khach_hang from khach_hang) and
 id_dv in (select id_dich_vu from dich_vu) then
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, id_nhan_vien, id_khach_hang, id_dich_vu)
    values (ngay_bd, ngay_kt, tien, id_nv, id_kh, id_dv);
else select 'du lieu bạn nhâp la không tồn tại ';
    end if;
end
// DELIMITER ;
call sp_2('2020-12-12', '2020-12-14', 5000000, 2, 3, 2);


-- 25.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn 
-- lại có trong bảng HopDong ra giao diện console của database

drop trigger if exists tr_1;

 delimiter //
 create trigger tr_1
 after delete
 on hop_dong for each row
 begin
 declare result varchar(150);
set result =  concat('so hd con lai', (select count(id_hop_dong)
				from hop_dong));
	SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = result;
 end //
 delimiter;
 
delete 
from hop_dong 
where id_hop_dong = 1;





-- 26.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật 
-- có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất
--  là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông
--  báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database

drop trigger if exists tr_2;
delimiter //
create trigger tr_2
before update
on hop_dong for each row
begin
declare thong_bao varchar(150);
set thong_bao = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
	if (datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong) < 2) then
		SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = thong_bao;
	end if;
end 
// delimiter;

update hop_dong
set ngay_ket_thuc = '2019-05-11'
where id_hop_dong = 3;


-- 27.	Tạo user function thực hiện yêu cầu sau:
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc 
-- kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa
--  vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng
--  được truyền vào như là 1 tham số của function này.

drop function if exists func_1;
delimiter //
create function func_1 ()
returns int
deterministic
begin
	declare result int;
    set result = (select count(dv.ten_dich_vu)
	from dich_vu dv inner join hop_dong h on h.id_dich_vu = dv.id_dich_vu
    having sum(dv.chi_phi_thue) > 2000000);
	return result;
end;
// delimiter ;

select func_1();

drop function if exists func_2;
delimiter //
create function func_2 (id_khach int)
returns int
deterministic
begin
	declare result int;
    set result = (select max(datediff(ngay_ket_thuc, ngay_lam_hop_dong)) 
	from hop_dong h
	where id_khach_hang = id_khach);
	return result;
end;
// delimiter ;

select func_2(3);



-- 28.	Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
--  từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong 
--  bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong 
--  bảng HopDong) và những bản liên quan khác.

drop procedure if exists sp_3;
delimiter //
create procedure sp_3()
begin
delete 
from dich_vu 
where id_dich_vu in (
select d.id_dich_vu from hop_dong h inner join dich_vu d on d.id_dich_vu = h.id_dich_vu
inner join loai_dich_vu l on d.id_loai_dich_vu = l.id_loai_dich_vu
where year(h.ngay_lam_hop_dong) between 2015 and 2019
and l.id_loai_dich_vu = 3);
end;
// delimiter ;
call sp_3();