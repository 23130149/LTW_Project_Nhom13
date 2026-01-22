package controller;

import dao.UserDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

    private UserDao userDao = new UserDao();

    // 👉 vào trang đổi mật khẩu
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/Login");
            return;
        }

        request.getRequestDispatcher("/ChangePassword.jsp")
                .forward(request, response);
    }

    // 👉 xử lý đổi mật khẩu
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");

        // 1️⃣ check mật khẩu cũ
        boolean correct = userDao.checkPassword(
                user.getUserId(),
                oldPassword
        );

        if (!correct) {
            request.setAttribute("error",
                    "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("/ChangePassword.jsp")
                    .forward(request, response);
            return;
        }

        // 2️⃣ update mật khẩu mới
        userDao.updatePassword(user.getUserId(), newPassword);

        // 3️⃣ cập nhật session
        user.setPassword(newPassword);
        session.setAttribute("user", user);

        // 4️⃣ quay về profile
        response.sendRedirect(request.getContextPath() + "/Profile");
    }
}
