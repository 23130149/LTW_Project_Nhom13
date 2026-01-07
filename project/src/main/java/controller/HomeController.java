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


@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService cs = new CategoryService();
        ProductService ps = new ProductService();

        List<Category> categoryList = cs.getAllCategories();
        List<Product> productList = ps.getListProduct();
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("trangchu.jsp").forward(request, response);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}