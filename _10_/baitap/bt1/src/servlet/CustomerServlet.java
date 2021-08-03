package servlet;

import bean.customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet",urlPatterns = "")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          List<customer> CustomerList=new ArrayList<>();

          CustomerList.add(new customer("hà mai","1995-08-20","gia lai","hinh/logo.jpg"));
          CustomerList.add(new customer("lê văn dẹp","1991-08-20","Quảng Trị","hinh/logo.jpg"));
          
          request.setAttribute("CustomerServlet",CustomerList);
          request.getRequestDispatcher("index.jsp").forward(request,response);
    }

}
