package controller.cart;

import cart.Cart;
import cart.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "CartUpdate", value = "/CartUpdate")
public class CartUpdate extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        cart.update(productId, quantity);

        response.sendRedirect("cart");
    }
}

