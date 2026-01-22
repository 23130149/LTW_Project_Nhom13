package controller;

import dao.ReviewDao;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/review")
public class ReviewController extends HttpServlet {

    private ReviewDao reviewDao = new ReviewDao();

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
        double rating = Double.parseDouble(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        String sql = """
            INSERT INTO reviews (Rating, Comment, Create_At, Product_Id, User_Id)
            VALUES (:rating, :comment, NOW(), :productId, :userId)
        """;

        reviewDao.getJdbi().withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("rating", rating)
                        .bind("comment", comment)
                        .bind("productId", productId)
                        .bind("userId", user.getUserId())
                        .execute()
        );
        response.sendRedirect(
                request.getContextPath() + "/product-detail?id=" + productId + "&reviewSuccess=1"
        );

    }
}
