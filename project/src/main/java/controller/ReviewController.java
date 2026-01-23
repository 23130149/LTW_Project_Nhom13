package controller;

import model.User;
import service.ReviewService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/review")
public class ReviewController extends HttpServlet {

    private ReviewService reviewService = new ReviewService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        User user = (User) session.getAttribute("user");

        int productId = Integer.parseInt(request.getParameter("productId"));
        String comment = request.getParameter("comment");
        String ratingStr = request.getParameter("rating");

        if (ratingStr == null || ratingStr.isBlank()) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/product-detail?id=" + productId + "&ratingError=1"
            );
            return;
        }

        double rating = Double.parseDouble(ratingStr);

        try {
            reviewService.addReview(
                    user.getUserId(),
                    productId,
                    rating,
                    comment
            );
        } catch (RuntimeException e) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/product-detail?id=" + productId + "&reviewExist=1"
            );
            return;
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/product-detail?id=" + productId + "&reviewSuccess=1"
        );

    }
}
