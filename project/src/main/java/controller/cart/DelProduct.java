package controller.cart;

import cart.Cart;
import cart.CartItem;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "DelProduct", value = "/DelProduct")
public class DelProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        Cart c = (Cart) session.getAttribute("cart");
        if (c == null) {
            response.sendRedirect("cart.jsp");
            return;
        }
        CartItem cartItem = c.deleteProduct(id);
        if (cartItem == null) {
            session.setAttribute("cartError", "Sản phẩm không tồn tại trong giỏ hàng");
            response.sendRedirect("cart.jsp");
            return;
        }
        session.setAttribute("cartSuccess", "Đã xóa sản phẩm khỏi giỏ hàng");
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}