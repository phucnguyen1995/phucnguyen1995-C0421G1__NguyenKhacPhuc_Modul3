-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
-- nếu trùng sắp theo tên tăng dần.

use quanlysinhvien;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where StudentName like 'h%'
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT Class.ClassName,Class.StartDate FROM class
WHERE StartDate >= '2008-12-1 00:00:00' AND StartDate < '2009-1-1 00:00:00'

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject
where credit between 3 and 5

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
-- truoc tiên ta cho dòng này chạy trước 
set SQL_SAFE_UPDATES = 0;
-- sau đó 
update Student
set ClassID=2
where StudentName='Hung';
-- hiển thi
select * from student

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
-- nếu trùng sắp theo tên tăng dần.
use quanlysinhvien;
select s.StudentName,sub.SubName,m.Mark
from student s join mark m 
on s.StudentID=m.StudentID
join Subject sub
on m.SubID=sub.SubID
order by m.Mark desc,s.StudentName asc
-- mắc định desc là giảm nếu ta ko ghi máy tính tự hiểu


