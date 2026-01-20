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
        response.setContentType("application/json;charset=UTF-8");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            response.getWriter().write("{\"success\":false}");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("id"));
        String action = request.getParameter("action");

        int stock = productService.getStockById(productId);
        int delta = action.equals("inc") ? 1 : -1;

        boolean ok = cart.update(productId, delta, stock);

        CartItem item = cart.getItem(productId);

        String json = """
        {
          "success": %s,
          "quantity": %d,
          "itemTotal": %.0f,
          "cartTotal": %.0f
        }
        """.formatted(
                ok,
                item.getQuantity(),
                item.getTotal(),
                cart.getTotalPrice()
        );

        session.setAttribute("cart", cart);
        response.getWriter().write(json);
        System.out.println(">>> CART AJAX HIT <<<");
    }

}

