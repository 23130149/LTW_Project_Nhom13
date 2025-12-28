import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

import java.util.List;

@WebServlet(name = "productController", value = "/product")

@WebServlet(name = "productController", value = "/productController")
public class productController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService ps = new ProductService();
        List<Product> list = ps.getListProduct();
        System.out.println("DEBUG CONTROLLER: So luong san pham lay duoc: " + list.size());
        request.setAttribute("list", list);
        request.getRequestDispatcher("sanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}