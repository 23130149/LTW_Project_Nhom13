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
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService cs = new CategoryService();
        ProductService ps = new ProductService();

        List<Category> categoryList = cs.getAllCategories();
        List<Product> featuredProducts = new ArrayList<>();
        for (Category c : categoryList) {
            Product featured = ps.getFeaturedProductByCategoryId(c.getCategoryId());
            if (featured != null) {
                featuredProducts.add(featured);
            }
            if (featuredProducts.size() == 8) break;
        }
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productList", featuredProducts);
        request.getRequestDispatcher("trangchu.jsp").forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}