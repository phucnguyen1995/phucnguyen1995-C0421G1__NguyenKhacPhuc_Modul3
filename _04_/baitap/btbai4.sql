
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select subject.SubName, max(Credit)
from subject;
select* from subject  having credit >= all(select max(credit) from subject);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select* from `subject` join mark on `subject`.SubId=mark.SubId having mark >=all(select max(mark) from mark);
 
--  Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.StudentId, s.StudentName, s.Address, s.Phone, avg(m.mark) as 'DTB'from student s inner join Mark m on m.StudentId = s.StudentId group by s.StudentId order by DTB desc,s.StudentName 
