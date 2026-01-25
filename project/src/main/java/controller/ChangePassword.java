package controller;

import dao.UserDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.EmailService;
import service.OtpService;

import java.io.IOException;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        // 🔴 FIX 1: CHƯA LOGIN
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        // 🔴 FIX 2: CHẶN GOOGLE USER
        if (user.getGoogleId() != null) {
            request.setAttribute("error",
                    "Tài khoản Google không có mật khẩu riêng.");
            response.sendRedirect(request.getContextPath() + "/Account");
            return;
        }

        String action = request.getParameter("action");

        // ===== GỬI OTP =====
        if ("sendOtp".equals(action)) {

            String oldPassword = request.getParameter("oldPassword");

            if (!userDao.checkPassword(user.getUserId(), oldPassword)) {
                request.setAttribute("error", "Mật khẩu hiện tại không đúng");
                request.getRequestDispatcher("/ChangePassword.jsp")
                        .forward(request, response);
                return;
            }

            String otp = OtpService.generateOtp();
            OtpService.saveOtp(session, otp);

            EmailService.sendOtpEmail(user.getEmail(), otp);

            request.setAttribute("step", "OTP_SENT");
            request.setAttribute("resendRemain",
                    OtpService.getResendRemain(session));

            request.getRequestDispatcher("/ChangePassword.jsp")
                    .forward(request, response);
            return;
        }

        // ===== XÁC NHẬN OTP =====
        if ("confirm".equals(action)) {

            String otpInput = request.getParameter("otp");
            String newPassword = request.getParameter("newPassword");

            if (!OtpService.verifyOtp(session, otpInput)) {
                request.setAttribute("error", "OTP sai hoặc đã hết hạn");
                request.setAttribute("step", "OTP_SENT");
                request.setAttribute("resendRemain",
                        OtpService.getResendRemain(session));

                request.getRequestDispatcher("/ChangePassword.jsp")
                        .forward(request, response);
                return;
            }

            userDao.updatePassword(user.getUserId(), newPassword);
            OtpService.clearOtp(session);

            response.sendRedirect(request.getContextPath() + "/Account");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        // chặn Google user
        if (user.getGoogleId() != null) {
            request.setAttribute("error",
                    "Tài khoản Google không có mật khẩu riêng.");
            response.sendRedirect(request.getContextPath() + "/Account");
            return;
        }

        // hiển thị trang đổi mật khẩu (bước 1)
        request.getRequestDispatcher("/ChangePassword.jsp")
                .forward(request, response);
    }

}
