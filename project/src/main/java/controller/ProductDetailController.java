package controller;

import dao.ReviewDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.Review;
import model.User;
import service.ProductService;
import dao.OrderDao;
import util.FormatUtil;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class    ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isBlank()) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        int productId;
        try {
            productId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        ProductService productService = new ProductService();
        Product product = productService.getProductById(productId);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }


        ReviewDao reviewDao = new ReviewDao();
        List<Review> reviews = reviewDao.getReviewsByProductId(productId);
        double avgRating = reviewDao.getAverageRating(productId);
        Map<Double, Integer> ratingMap = reviewDao.getRatingCountByProductId(productId);

        List<Product> relatedProducts = productService.getRelatedProducts(product.getCategoryId(), productId);
        request.setAttribute("reviews", reviews);
        request.setAttribute("reviewCount", reviews.size());
        request.setAttribute("avgRating", avgRating);
        request.setAttribute("ratingMap", ratingMap);

        boolean canReview = false;
        User user = (User) request.getSession().getAttribute("user");

        if (user != null) {
            OrderDao orderDao = new OrderDao();
            ReviewDao reviewDao2 = new ReviewDao();

            boolean bought = orderDao.hasUserPurchasedProduct(user.getUserId(), productId);
            boolean reviewed = reviewDao2.hasReviewed(user.getUserId(), productId);

            canReview = bought && !reviewed;
        }

        request.setAttribute("canReview", canReview);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("product", product);

        request.getRequestDispatcher("/chitietsp.jsp")
                .forward(request, response);
        for (Review r : reviews) {
            r.setFormattedDate(
                    FormatUtil.formatDateTime(r.getCreatAt())
            );
        }

    }
        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}