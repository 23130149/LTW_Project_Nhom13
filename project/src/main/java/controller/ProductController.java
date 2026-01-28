package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;
import service.CategoryService;
import service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "productController", value = "/product")
public class ProductController extends HttpServlet {

    private static final int PRODUCTS_PER_PAGE = 8;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        ProductService ps = new ProductService();
        CategoryService cs = new CategoryService();

        List<Category> categoryList = cs.getAllCategories();
        request.setAttribute("categoryList", categoryList);

        String keyword = request.getParameter("keyword");
        if (keyword != null) {
            keyword = keyword.trim();
        }
        if (keyword == null || keyword.isEmpty()) {
            keyword = null;
        }
        int categoryId = 0;
        String categoryIdStr = request.getParameter("categoryId");
        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid category Id: " + categoryIdStr);
            }
        }

        int currentPage = 1;
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid page: " + pageStr);
            }
        }

        int offset = (currentPage - 1) * PRODUCTS_PER_PAGE;
        int totalProducts = 0;
        int totalPages = 0;
        List<Product> list;

        if (keyword != null && !keyword.isEmpty()) {
            totalProducts = ps.getTotalProductsByKeyword(keyword);
            totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            list = ps.searchProductsByKeyword(keyword, PRODUCTS_PER_PAGE, offset);

            request.setAttribute("currentCategoryId", 0);

        } else if (categoryId > 0) {
            totalProducts = ps.getTotalProductsByCategory(categoryId);
            totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            list = ps.getProductsByCategoryPerPage(categoryId, PRODUCTS_PER_PAGE, offset);

            request.setAttribute("currentCategoryId", categoryId);
        }
        else {
            totalProducts = ps.getTotalProducts();
            totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            list = ps.getProductsPerPage(PRODUCTS_PER_PAGE, offset);
            request.setAttribute("currentCategoryId", 0);
        }

        request.setAttribute("list", list);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword);

        request.getRequestDispatcher("/sanpham.jsp").forward(request, response);
    }
}
