create database quan_ly_don_hang;
use quan_ly_don_hang;
create table customer(
customer_id int primary key not null auto_increment,
customer_name varchar(30) not null,
customer_age int not null);

create table `order`(
order_id int primary key not null auto_increment,
customer_id int,
order_date datetime not null,
order_total_price int,
foreign key (customer_id) references customer(customer_id)
);

create table product(
product_id int primary key not null auto_increment,
product_name varchar(30) not null,
product_price int not null
);

create table order_detail(
product_id int,
order_id int,
order_quantity int not null,
primary key (product_id, order_id),
foreign key (product_id) references product(product_id),
foreign key (order_id) references `order`(order_id)
);


insert into customer (customer_name, customer_age)
value ('Minh Quan', 10);
insert into customer (customer_name, customer_age)
value ('Ngoc Oanh', 20);
insert into customer (customer_name, customer_age)
value ('Hong Ha', 50);

insert into `order` (customer_id, order_date)
value (1, '2006-03-21');
insert into `order` (customer_id, order_date)
value (2, '2006-03-23');
insert into `order` (customer_id, order_date)
value (1, '2006-03-16');

insert into product (product_name, product_price)
value ('May Giat', 3);
insert into product (product_name, product_price)
value ('Tu Lanh', 5);
insert into product (product_name, product_price)
value ('Dieu Hoa', 7);
insert into product (product_name, product_price)
value ('Quat', 1);
insert into product (product_name, product_price)
value ('Bep Dien', 2);

insert into order_detail (order_id, product_id, order_quantity)
value (1,1,3);
insert into order_detail (order_id, product_id, order_quantity)
value (1,3,7);
insert into order_detail (order_id, product_id, order_quantity)
value (1,4,2);
insert into order_detail (order_id, product_id, order_quantity)
value (2,1,1);
insert into order_detail (order_id, product_id, order_quantity)
value (3,1,8);
insert into order_detail (order_id, product_id, order_quantity)
value (2,5,4);
insert into order_detail (order_id, product_id, order_quantity)
value (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
use quan_ly_don_hang;
select `order`.order_id,`order`.order_date,`order`.order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

 -- Hiển thị danh sách các khách hàng đã mua hàng
 select distinct customer.customer_name 
 from customer join `order`
 on customer.customer_id=`order`.customer_id;
 
select *
from customer
where customer.customer_id  in (select customer_id from `order`);
 
-- => yêu câu đề là:
 select customer.customer_name,pro.product_name
 from customer join `order`
 on customer.customer_id=`order`.customer_id
 join  order_detail ord
 on `order`.order_id=ord.order_id
 join product pro
 on pro.product_id=ord.product_id;
 
--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.customer_name 
from customer
where customer.customer_id not in 
(select customer.customer_id from customer  inner join `order`
on customer.customer_id=`order`.customer_id);

select * 
from customer c 
where not exists 
(select * from `order` o where o.customer_id = c.customer_id);

select * 
from customer
where customer.customer_id not in (select customer_id from `order`);
-- (dich nghia cau lenh 122:in ra tất cả cột từ bảng khách hàng với đk cột id đấy ko ( nằm trong id của order))


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán
--  của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.order_id, o.order_date, od.order_quantity * p.product_price as 'Tổng tiền'
from `order` o inner join order_detail od
on o.order_id = od.order_id
inner join product p
on od.product_id = p.product_id;

