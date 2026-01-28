package controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import model.Review;
import service.AdminReviewService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/reviews")
public class AdminReviewController extends HttpServlet {

    AdminReviewService service = new AdminReviewService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Review> reviews = service.getAllReviews();
        Map<String, Object> summary = service.getReviewSummary();

        req.setAttribute("reviews", service.getAllReviews());
        req.setAttribute("summary", service.getReviewSummary());
        req.setAttribute("ratingMap", service.getRatingSummaryMap());
        req.setAttribute("stars", new int[]{5,4,3,2,1});

        req.getRequestDispatcher("/trangadmin/danhgia.jsp")
                .forward(req, resp);
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
