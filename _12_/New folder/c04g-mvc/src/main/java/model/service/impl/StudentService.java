package model.service.impl;

import model.bean.Student;
import model.repository.IStudentRepository;
import model.repository.impl.StudentRepository;
import model.service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {

    // DI = Dependency Inversion
    private IStudentRepository iStudentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {
        return this.iStudentRepository.findAll();
    }

    @Override
    public Student findById(Integer id) {
        return this.iStudentRepository.findById(id);
    }

    @Override
    public String save(Student student) {
        String msg = "success";
        if (student.getStudentName().matches("[A-Za-z ]+")) {
            return this.iStudentRepository.save(student);
        } else {
            msg = "fail";
        }
        return msg;
    }


// cách 2
//    String msg = null;
//
//        if (student.getName().matches("[A-Za-z ]+")) {
//        msg = this.iStudentRepository.save(student);
//    } else {
//        msg = "fail";
//    }
//        return msg;
//}

}
