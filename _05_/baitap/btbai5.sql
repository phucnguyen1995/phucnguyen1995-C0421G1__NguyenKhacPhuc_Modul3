
-- B1. Tạo database
drop database if exists bai5;
create database bai5;
use bai5;

create table product(
id int primary key not null auto_increment,
product_code varchar(30),
product_name varchar(30),
product_price int,
product_amount int,
product_description varchar(100),
-- mô tả:description
product_status varchar(30)
);

insert into product (product_code,product_name,product_price,product_amount,product_description,product_status)
values    ( 'toyota01', 'altis', '820000000', 5, 'xe toyota', 'mới'),
		( 'ip2021', 'ip12', '30000000', 10, 'dien thoai iphone', 'mới'); 
        
--      yêu cầu:   Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index

-- truoc
explain select * from product where product_code = 'ip2021';
-- sau
alter table product add unique idx_product_code (product_code);
explain select * from product where product_code = 'ip2021';

-- truoc
explain select * from product where product_name = 'ip12' and product_price = '30000000';
-- sau
alter table product add index composite(product_name,product_price);
explain select * from products where product_name = 'ip12' and product_price = '30000000';

--    yêu cầu đề:   Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

create view product_view as
select product_code,product_name,product_price,product_status
from product;

select * from product_view ;

insert into product_view (product_code,product_name,product_price,product_status)
values    ( 'toyota02', 'camry', '950000000','mới');
select * from product_view ;

drop view product_view;

-- yeu cau Bước 5:
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

drop procedure if exists select_all;
DELIMITER //
create procedure select_all ()
begin
	select *
    from product;
end
//DELIMITER ;

drop procedure if exists add_new_product;
DELIMITER //
create procedure add_new_product (
new_product_code varchar(30),
new_product_name varchar(30),
new_product_price int,
new_product_amount int,
new_product_dst varchar(100),
new_product_status varchar(30))
begin
	insert into product (product_code, product_name, product_price, product_amount, product_description, product_status)
    values (new_product_code, new_product_name, new_product_price, new_product_amount, new_product_dst, new_product_status);
end
// DELIMITER ;
	
    insert into product (product_code,product_name,product_price,product_amount,product_description,product_status)
              values    ( 'toyota03', 'fortuner', '1000000000', 3, 'xe toyota', 'mới');

call add_new_product();

drop procedure if exists change_product_id;
DELIMITER //
create procedure change_product_id (id_product int, new_product_code varchar(30))
begin
	update product
    set product_code = new_product_code
    where id = id_product;
end
// DELIMITER ;

drop procedure if exists delete_product;
DELIMITER //
create procedure delete_product (in id_product int)
begin
	delete 
    from product
    where id = id_product;
end
// DELIMITER ;










