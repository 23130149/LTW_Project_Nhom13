package controller.cart;

import cart.Cart;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DelSelectProduct", value = "/DelSelectProduct")
public class DelSelectProduct extends HttpServlet {
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

        String[] ids = request.getParameterValues("productIds");
        if (ids != null) {
            for (String id : ids) {
                cart.deleteProduct(Integer.parseInt(id));
            }
        }

        response.sendRedirect("cart");
    }
    }
