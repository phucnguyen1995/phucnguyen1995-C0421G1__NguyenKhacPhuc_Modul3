package model.repository.impl;

import model.bean.Student;
import model.repository.IStudentRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class StudentRepository implements IStudentRepository {

    List<Student> studentList = new ArrayList<>();

    private dao.BaseRepository baseRepository = new dao.BaseRepository();

    @Override
    public List<Student> findAll() {
        List<Student> studentList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(
                    "select studentId,studentName,phone\n" +
                            "from student");
            ResultSet resultSet = preparedStatement.executeQuery();
            Student student = null;
            while (resultSet.next()) {
                student = new Student();
                student.setStudentId(resultSet.getInt("studentid"));
                student.setStudentName(resultSet.getString("studentname"));
                student.setPhone(resultSet.getString("phone"));
                studentList.add(student);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findById(Integer id) {
        Student student = null;
        try {
            PreparedStatement preparedStatement = this.baseRepository.
                    getConnection().prepareStatement("select studentId,studentName,Phone\n" +
                    "from student\n" +
                    "where  studentId=?");
            preparedStatement.setString(1, id + "");
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                student = new Student();
                student.setStudentId(id);
                student.setStudentName(resultSet.getString("studentname"));
                student.setPhone(resultSet.getString("phone"));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return student;
    }

    @Override
    public String save(Student student) {
        int row=0;

        try {
            PreparedStatement preparedStatement = this.baseRepository.
                    getConnection().prepareStatement("update student\n" +
                    "set studentName=?,Phone=?\n" +
                    "where  studentId=?");

            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getPhone());
            preparedStatement.setString(3,student.getStudentId()+"");

//            nảy câu lệnh select thì ta dùng query thì những câu lệnh thuộc về
//            update hay insert,delete  (nhưng câu lệnh làm ảnh hưởng dữ liệu trong DB) ta
//            dùng chung 1 thằng là update thôi
         row=preparedStatement.executeUpdate();



        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return row>0 ? "thanh cong":"fail";
    }
}
