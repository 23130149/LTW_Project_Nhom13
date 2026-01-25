package controller;

import dao.UserDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/SignIn")
public class    SignInController extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    // ===== HIỂN THỊ TRANG ĐĂNG NHẬP =====
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/SignIn.jsp")
                .forward(request, response);
    }

    // ===== XỬ LÝ ĐĂNG NHẬP =====
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        User user = userDao.login(email, password);

        if (user == null) {
            request.setAttribute("error", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("/SignIn.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        if ("ADMIN".equalsIgnoreCase(user.getRole())) {
<<<<<<< HEAD
            response.sendRedirect(request.getContextPath() + "/trangadmin/dashboard");
=======
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
>>>>>>> f24212bf4e7a8c9d7c82828d061dd10829e2af2e
        } else {
            response.sendRedirect(request.getContextPath() + "/Account");
        }
    }
}