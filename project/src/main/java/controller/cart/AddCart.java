package controller.cart;

import cart.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import service.ProductService;

import java.io.IOException;

@WebServlet(name = "AddCart", value = "/add-cart")
public class AddCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idRaw = request.getParameter("id");
        String qRaw = request.getParameter("q");

        if (idRaw == null || qRaw == null) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        int id;
        int quantity;
        try {
            id = Integer.parseInt(idRaw);
            quantity = Integer.parseInt(qRaw);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        if (quantity <= 0) quantity = 1;

        ProductService ps = new ProductService();
        Product product = ps.getProductById(id);

        if (product == null) {
            response.sendRedirect(request.getContextPath() + "/product");
            return;
        }

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        cart.addProduct(product, quantity);
        session.setAttribute("cartMessage", "Đã thêm sản phẩm vào giỏ hàng");
        session.setAttribute("cart", cart);

        boolean buyNow = "1".equals(request.getParameter("buyNow"));

        if (buyNow) {
            response.sendRedirect(request.getContextPath() + "/payment");
        } else {
            String referer = request.getHeader("Referer");
            if (referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect(request.getContextPath() + "/product");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
