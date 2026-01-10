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

        // ❌ LOGIN THẤT BẠI
        if (user == null) {
            request.setAttribute("error", "Sai email hoặc mật khẩu");
            request.getRequestDispatcher("/SignIn.jsp")
                    .forward(request, response);
            return;
        }

        // ✅ LOGIN THÀNH CÔNG
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // 🔐 PHÂN QUYỀN
        if ("ADMIN".equals(user.getRole())) {
            // ADMIN → trang admin
            response.sendRedirect(
                    request.getContextPath() + "/trangadmin/tongquan.jsp"
            );
        } else {
            // USER → trang user
            response.sendRedirect(
                    request.getContextPath() + "/home"
            );
        }
    }
}
