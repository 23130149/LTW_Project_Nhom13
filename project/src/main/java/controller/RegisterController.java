package controller;

import dao.UserDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        UserDao userDao = new UserDao();

        // ===== VALIDATE SERVER-SIDE =====
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        if (userDao.emailExists(email)) {
            request.setAttribute("error", "Email đã tồn tại");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        // ===== TẠO USER =====
        User user = new User();
        user.setUser_name(fullName);
        user.setEmail(email);
        user.setPassword(password); // TODO: hash sau
        user.setRole("USER");

        userDao.register(user);

        // ===== ĐĂNG KÝ THÀNH CÔNG =====
        // redirect để tránh submit lại form
        response.sendRedirect(
                request.getContextPath() + "/SignIn.jsp?success=1"
        );
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/Register.jsp")
                .forward(request, response);
    }

}
