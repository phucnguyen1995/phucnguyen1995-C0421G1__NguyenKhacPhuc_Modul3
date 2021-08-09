package controller;


import model.bean.Student;
import model.service.IStudentService;
import model.service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = {"", "/student"})
public class StudentServlet extends HttpServlet {

    private IStudentService iStudentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }
        switch (actionClient) {
            case "update":
                Integer id = Integer.valueOf(request.getParameter("studentId"));
                String name = request.getParameter("studentName");
                String phone = request.getParameter("phone");

                Student student = new Student();
                student.setStudentId(id);
                student.setStudentName(name);
                student.setPhone(phone);

                if ("thanh cong".equals(this.iStudentService.save(student))) {
                    request.setAttribute("msg","cap nhat thanh cong");

                    request.setAttribute("studentListServlet", this.iStudentService.findAll());
                    request.getRequestDispatcher("index.jsp").forward(request, response);

                } else {
                    request.setAttribute("msg","update fail");


                    request.setAttribute("studentObj", student);

                    request.getRequestDispatcher("update_student.jsp").forward(request, response);

                }
                break;
            case "delete":
                break;
            default:

                break;

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }
        switch (actionClient) {
            case "update":
                Integer id = Integer.valueOf(request.getParameter("studentId"));
                request.setAttribute("studentObj", this.iStudentService.findById(id));
                request.getRequestDispatcher("update_student.jsp").forward(request, response);
                break;
            case "delete":
                break;
            default:
                request.setAttribute("studentListServlet", this.iStudentService.findAll());
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;

        }


    }
}
