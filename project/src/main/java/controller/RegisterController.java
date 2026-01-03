
package controller;
import model.User;
import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao dao = new UserDao();

        // check email trùng
        if (dao.emailExists(email)) {
            request.setAttribute("error", "Email đã tồn tại");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        User user = new User();
        user.setUser_name(username);
        user.setEmail(email);
        user.setPassword(password); // sau này hash
        user.setRole("USER");

        dao.register(user);

        response.sendRedirect("SignIn.jsp");
    }
}
