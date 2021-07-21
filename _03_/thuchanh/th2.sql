-- Hiển thị danh sách tất cả các học viên
-- Hiển thị danh sách các học viên đang theo học.
-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
-- Hiển thị danh sách học viên lớp A1
-- Hiển thị điểm môn CF của các học viên.

-- Hiển thị danh sách tất cả các học viên
USE QuanLySinhVien;
select * from student;

-- Hiển thị danh sách các học viên đang theo học.
USE QuanLySinhVien;
select *
from student
where Status=1;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.studentstudent
USE QuanLySinhVien;
SELECT *
FROM Subject
WHERE Credit < 10;

-- Hiển thị danh sách học viên lớp A1
SELECT  S.StudentId, S.StudentName, C.ClassName
FROM Student S join Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

-- Hiển thị điểm môn CF của các học viên.

-- b1:
-- Hiển thị tất cả các điểm đang có của học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId

-- b2:
-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';


