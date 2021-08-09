package controller;

import model.service.IStudentService;
import model.service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "StudentServlet", urlPatterns = {"", "/student"})
public class StudentServlet extends HttpServlet {


    private  IStudentService iStudentService = new StudentService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("studentListServlet", this.iStudentService.findAll());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}


