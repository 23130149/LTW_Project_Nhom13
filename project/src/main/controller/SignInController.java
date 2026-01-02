<<<<<<< Updated upstream:project/src/main/controller/SignInController.java
=======
package controller;

import model.User;
import dao.UserDao;
>>>>>>> Stashed changes:project/src/main/java/controller/SignInController.java
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet("/SignIn")
public class SignInController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

<<<<<<< Updated upstream:project/src/main/controller/SignInController.java
        HttpSession session = request.getSession();
        String regEmail = (String) session.getAttribute("regEmail");
        String regPass  = (String) session.getAttribute("regPass");
=======
        UserDao dao = new UserDao();
        User user = dao.login(email, pass);
>>>>>>> Stashed changes:project/src/main/java/controller/SignInController.java

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect("trangchu.jsp");
        } else {
            request.setAttribute("error", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("SignIn.jsp").forward(request, response);
        }
    }
}
