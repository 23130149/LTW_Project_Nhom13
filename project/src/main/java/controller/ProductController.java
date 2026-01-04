package controller;

import dao.CategoryDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Product;
import service.ProductService;

import java.io.IOException;

import java.util.List;


@WebServlet(name = "productController", value = "/product")
public class ProductController extends HttpServlet {
    private static final int PRODUCTS_PER_PAGE = 8;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        CategoryDao categoryDao = new CategoryDao();

        List<Category> categoryList = categoryDao.getAllCategories();
        request.setAttribute("categoryList", categoryList);
        String categoryIdStr =  request.getParameter("categoryId");
        int categoryId = 0;

        if(categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
            }
        }
        List<Product> list;

        if(categoryId > 0) {
            list = ps.getListProductByCategoryId(categoryId);
            System.out.println(categoryId + ", So luong SP: " + list.size());
            request.setAttribute("list", list);
        } else {
            int currentPage = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null && !pageStr.isEmpty()) {
                try {
                    currentPage = Integer.parseInt(pageStr);
                } catch (NumberFormatException e) {
                }
            }
            int offset = (currentPage - 1) * PRODUCTS_PER_PAGE;
            int totalProducts = ps.getTotalProducts();
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            list = ps.getProductsPerPage(PRODUCTS_PER_PAGE, offset);
            System.out.println("DEBUG CONTROLLER: So luong san pham lay duoc: " + list.size());
            request.setAttribute("list", list);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("totalPages", totalPages);
        }
        request.getRequestDispatcher("/sanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}