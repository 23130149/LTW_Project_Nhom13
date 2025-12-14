import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignIn", value = "/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
        PrintWriter out = response.getWriter();
        out.println("email: " + email);
        out.println("password: " + pass);
    }
}