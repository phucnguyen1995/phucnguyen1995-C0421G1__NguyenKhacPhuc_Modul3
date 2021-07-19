create database quan_ly_ban_hang;
use quan_ly_ban_hang;
create table customer(
id varchar(50) primary key,
`name` varchar(50),
`age` int
);

create table `order`(
id varchar(50) primary key,
`date` date,
total_price  double,
customer_id varchar(50),

foreign key(customer_id) references customer(id)
);

create table product(
id varchar(50) primary key,
`name` varchar(50),
price double
);

create table order_detail(
order_id varchar(50),
product_id varchar(50),
primary key(order_id,product_id),
foreign key(order_id) references `order`(id),
foreign key(product_id)references product(id)
);

