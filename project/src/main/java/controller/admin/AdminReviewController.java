package controller.admin;

import dao.UserDao; // Thêm UserDao
import model.User;  // Thêm model User
import service.AdminReviewService;
import model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/reviews")
public class AdminReviewController extends HttpServlet {

    AdminReviewService service = new AdminReviewService();
    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setAttribute("reviews", service.getAllReviews());
        req.setAttribute("summary", service.getReviewSummary());
        req.setAttribute("ratingMap", service.getRatingSummaryMap());
        req.setAttribute("stars", new int[]{5,4,3,2,1});

        User admin = udao.getAdmin();
        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";
        int notificationCount = 0;

        if (admin != null) {
            adminName = admin.getUserName();
            adminRole = "Quản trị viên";
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }

        req.setAttribute("adminName", adminName);
        req.setAttribute("adminRole", adminRole);
        req.setAttribute("adminAvatar", adminAvatar);
        req.setAttribute("notificationCount", notificationCount);

        req.getRequestDispatcher("/trangadmin/danhgia.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String action = req.getParameter("action");
        if ("reply".equals(action)) {
            int reviewId = Integer.parseInt(req.getParameter("reviewId"));
            String reply = req.getParameter("reply");
            service.reply(reviewId, reply);
            resp.setStatus(HttpServletResponse.SC_OK);
        }
    }
}