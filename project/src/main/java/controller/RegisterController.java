package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        session.setAttribute("regEmail", email);
        session.setAttribute("regPass", password);

        response.sendRedirect("webapp/Signin.jsp");
    }
}
