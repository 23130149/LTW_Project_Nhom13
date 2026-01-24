package controller;

import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.EmailService;
import service.OtpService;

import java.io.IOException;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    private UserDao userDao;

    @Override
    public void init() {
        userDao = new UserDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String action = request.getParameter("action");


        if ("sendOtp".equals(action)) {

            String email = request.getParameter("email");

            String otp = OtpService.generateOtp();
            OtpService.saveOtp(session, otp);

            // lưu email user nhập
            session.setAttribute("OTP_EMAIL", email);

            EmailService.sendOtpEmail(email, otp);

            request.setAttribute("step", "OTP_SENT");
            request.getRequestDispatcher("/ForgotPassword.jsp").forward(request, response);
            return;
        }

        if ("confirm".equals(action)) {

            String otpInput = request.getParameter("otp");
            String newPassword = request.getParameter("newPassword");

            String email = (String) session.getAttribute("OTP_EMAIL");

            // verify OTP
            if (!OtpService.verifyOtp(session, otpInput)) {
                request.setAttribute("error", "OTP sai hoặc đã hết hạn");
                request.setAttribute("step", "OTP_SENT");
                request.getRequestDispatcher("/ForgotPassword.jsp").forward(request, response);
                return;
            }

            User user = userDao.findByEmail(email);

            if (user != null && user.getGoogleId() != null) {
                request.setAttribute("error",
                        "Tài khoản Google không hỗ trợ quên mật khẩu. Hãy đăng nhập bằng Google.");
                request.getRequestDispatcher("/SignIn.jsp").forward(request, response);
                return;
            }


            if (user.getGoogleId() != null) {
                request.setAttribute("error", "Tài khoản Google không dùng mật khẩu");
                request.getRequestDispatcher("/ForgotPassword.jsp").forward(request, response);
                return;
            }

            userDao.updatePassword(user.getUserId(), newPassword);

            OtpService.clearOtp(session);
            session.removeAttribute("OTP_EMAIL");

            response.sendRedirect(request.getContextPath() + "/SignIn");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/ForgotPassword.jsp")
                .forward(request, response);
    }

    }


