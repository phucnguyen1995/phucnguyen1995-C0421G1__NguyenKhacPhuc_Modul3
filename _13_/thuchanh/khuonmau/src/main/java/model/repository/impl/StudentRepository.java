package model.repository.impl;

import model.bean.Student;
import model.repository.IStudentRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class StudentRepository implements IStudentRepository {


    private BaseRepository baseRepository = new BaseRepository();


    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.
                    getConnection().prepareStatement("select id,`name`,day_of_birth\n" +
                    "from student;");
            ResultSet resultSet = preparedStatement.executeQuery();
//        DÙNG WHILE ĐI TỪNG DÒNG TRONG RESULTSET
            Student student = null;
            while (resultSet.next()) {
                student = new Student();
                student.setId(resultSet.getInt("id"));
                student.setName(resultSet.getString("name"));
                student.setDateOfBirth(resultSet.getString("day_of_birth"));
                studentList.add(student);
//                get:láy;set :đặt vào
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }
}
