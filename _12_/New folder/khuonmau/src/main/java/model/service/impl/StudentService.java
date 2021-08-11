package model.service.impl;

import model.bean.Student;
import model.repository.IStudentRepository;
import model.repository.impl.StudentRepository;
import model.service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {


    private IStudentRepository iStudentRepository = new StudentRepository();

    @Override
    public List<Student> findAll() {
        return this.iStudentRepository.findAll();
    }
}
