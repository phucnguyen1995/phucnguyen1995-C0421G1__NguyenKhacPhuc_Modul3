-- Hiển thị số lượng sinh viên ở từng nơi
-- Tính điểm trung bình các môn học của mỗi học viên
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.

-- - Hiển thị số lượng sinh viên ở từng nơi
use quanlysinhvien;
SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.StudentId, s.StudentName,avg(mark) as `điểm trung bình`
FROM Student S join Mark M on S.StudentId = M.StudentId
group by StudentId, S.StudentName;
-- ứng với một id là 1 tên nên tính luôn chuyện trùng

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId
-- (lấy ra điểm trung bình từ mark dc sắp xêp bởi studenid trong mark)





