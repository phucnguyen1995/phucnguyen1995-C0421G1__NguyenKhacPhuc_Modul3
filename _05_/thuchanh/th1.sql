-- để tìm thông tin của khách hàng có tên là Land Of Toys Inc., cách làm chậm:
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

-- để tìm thông tin của khách hàng có tên là Land Of Toys Inc., ta lamf theo 2 bước:
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
-- tương tự
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

-- Để xoá chỉ mục trong bảng, ta làm như sau:
ALTER TABLE customers DROP INDEX idx_full_name;