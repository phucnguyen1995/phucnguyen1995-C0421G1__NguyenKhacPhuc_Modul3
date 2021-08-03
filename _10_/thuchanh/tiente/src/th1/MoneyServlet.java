package th1;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "MoneyServlet",urlPatterns = "/money_servlet")
public class MoneyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Double a=Double.parseDouble(request.getParameter("usd"));
        Double b=a*22000;

        request.setAttribute("quy_ra_tien_viet",b);
        request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
