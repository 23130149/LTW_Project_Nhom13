package controller.cart;

import cart.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "AddCart", value = "/add-Cart")
public class AddCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));
            int q = Integer.parseInt(request.getParameter("q"));
        ProductService ps = new ProductService();
        Product product = ps.getProductById(id);

        if (product == null) {
            response.sendRedirect("product");
            return;
        }

        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            c = new Cart();
        }
        c.addProduct(product, 1);
        session.setAttribute("cart", c);

        response.sendRedirect("product");
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}