package model.bean;

public class Student {
//    private Integer id;
//    private String name;
//    private String dateOfBirth;
//    // 0: Female, 1: Male
//    private Integer gender;
//    // < 5: Bad, 5 - 7: Good, 8 - 10: Excellent
//    private Double grade;
//
//    public Student(Integer id, String name,
//                   String dateOfBirth, Integer gender, Double grade) {
//        this.id = id;
//        this.name = name;
//        this.dateOfBirth = dateOfBirth;
//        this.gender = gender;
//        this.grade = grade;
//    }
//
//    public Integer getId() {
//        return id;
//    }
//
//    public void setId(Integer id) {
//        this.id = id;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getDateOfBirth() {
//        return dateOfBirth;
//    }
//
//    public void setDateOfBirth(String dateOfBirth) {
//        this.dateOfBirth = dateOfBirth;
//    }
//
//    public Integer getGender() {
//        return gender;
//    }
//
//    public void setGender(Integer gender) {
//        this.gender = gender;
//    }
//
//    public Double getGrade() {
//        return grade;
//    }
//
//    public void setGrade(Double grade) {
//        this.grade = grade;
//    }
//}
private int studentId;
private String studentName;
private String phone;

    public Student() {
    }

    public Student(int studentId, String studentName, String phone) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.phone = phone;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
