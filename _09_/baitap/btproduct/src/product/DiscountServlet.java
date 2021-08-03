package product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountServlet",urlPatterns = "/discount-servlet")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String a=request.getParameter("product_description");
        double b=0;
        double c=0;

        try {
            b = Double.parseDouble(request.getParameter("list_price"));
            c = Double.parseDouble(request.getParameter("discount_percent"));
        }
        catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }

         double d=b*c*0.01;
         double e=b-d;

         request.setAttribute("product_description",a);
         request.setAttribute("discount_amount",d);
         request.setAttribute("discount_price",e);

         request.getRequestDispatcher("result.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
