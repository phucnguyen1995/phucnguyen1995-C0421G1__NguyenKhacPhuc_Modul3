package model.service;

import model.bean.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    Student findById(Integer id);

//    chuoi loi đầu vào là 1 đối tương student
    String save(Student student);
}
