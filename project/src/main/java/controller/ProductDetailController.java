package controller;

import dao.ReviewDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.Review;
import service.ProductService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
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
        ProductService ps = new ProductService();
        Product product = ps.getProductById(productId);
        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
            }
        ReviewDao rdao = new ReviewDao();
        List<Review> reviews = rdao.getReviewsByProductId(productId);

        int reviewCount = reviews.size();

        Map<Integer, Integer> ratingMap = rdao.getRatingCountByProductId(productId);

        double avgRating = 0;
        if (reviewCount > 0) {
            int totalStar = 0;
            for (Map.Entry<Integer, Integer> e : ratingMap.entrySet()) {
                totalStar += e.getKey() * e.getValue();
            }
            avgRating = (double) totalStar / reviewCount;
        }
        List<Product> relatedProducts = ps.getRelatedProducts(product.getCategoryId(), productId);
        request.setAttribute("product", product);
        request.setAttribute("relatedProducts", relatedProducts);
        request.setAttribute("reviews", reviews);
        request.setAttribute("reviewCount", reviewCount);
        request.setAttribute("ratingCount", reviewCount);
        request.setAttribute("ratingMap", ratingMap);
        request.setAttribute("avgRating", Math.round(avgRating * 10.0) / 10.0);
        request.getRequestDispatcher("/chitietsp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}