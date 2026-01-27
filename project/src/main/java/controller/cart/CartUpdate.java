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
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            response.sendRedirect("cart");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        String action = request.getParameter("action");

        CartItem item = cart.getItem(productId);
        if (item == null) {
            response.sendRedirect("cart");
            return;
        }

        int currentQuantity = item.getQuantity();

        int stockQuantity = productService.getStockById(productId);

        if ("inc".equals(action)) {
            if (currentQuantity < stockQuantity) {
                currentQuantity++;
            }
        } else if ("dec".equals(action)) {
            if (currentQuantity > 1) {
                currentQuantity--;
            }
        }

        cart.update(productId, currentQuantity);
        response.sendRedirect("cart");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }}

