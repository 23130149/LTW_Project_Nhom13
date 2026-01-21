package controller;

import dao.OrderDao;
import dao.ReviewDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.Review;
import model.User;
import service.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int productId;
        try {
            productId = Integer.parseInt(request.getParameter("id"));
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        ProductService ps = new ProductService();
        Product product = ps.getProductById(productId);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        ReviewDao rdao = new ReviewDao();
        List<Review> reviews = rdao.getReviewsByProductId(productId);
        int reviewCount = reviews.size();

        Map<Double, Integer> ratingMap = rdao.getRatingCountByProductId(productId);

        double totalScore = 0;
        int totalVotes = 0;
        for (Map.Entry<Double, Integer> e : ratingMap.entrySet()) {
            totalScore += e.getKey() * e.getValue();
            totalVotes += e.getValue();
        }
        double avgRating = totalVotes > 0 ? totalScore / totalVotes : 0;

        boolean canReview = false;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            OrderDao orderDao = new OrderDao();
            canReview = orderDao.hasUserPurchasedProduct(
                    user.getUserId(),
                    productId
            );
        }

        List<Product> relatedProducts =
                ps.getRelatedProducts(product.getCategoryId(), productId);

        request.setAttribute("product", product);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("reviews", reviews);
        request.setAttribute("reviewCount", reviewCount);
        request.setAttribute("ratingMap", ratingMap);
        request.setAttribute("avgRating", Math.round(avgRating * 10.0) / 10.0);
        request.setAttribute("canReview", canReview);

        request.getRequestDispatcher("/chitietsp.jsp")
                .forward(request, response);
    }
}
