import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "productController", value = "/productController")
public class productController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        request.getRequestDispatcher("sanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
@WebServlet(name = "SignIn", value = "/SignIn")
public class SignInController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        HttpSession session = request.getSession();
        String regEmail = (String) session.getAttribute("regEmail");
        String regPass  = (String) session.getAttribute("regPass");

        if (email.equals(regEmail) && pass.equals(regPass)) {
            response.sendRedirect("jsp/home.jsp");
        } else {
            request.setAttribute("error", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("webapp/signin.jsp").forward(request, response);
        }
    }
}
