package controller;

import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import model.User;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {

    private OrderDao orderDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        User user = (User) session.getAttribute("user");

        BigDecimal totalPrice =
                new BigDecimal(request.getParameter("totalPrice"));

        int addressId = Integer.parseInt(request.getParameter("addressId"));
        int paymentMethodId = Integer.parseInt(request.getParameter("paymentMethodId"));
        String note = request.getParameter("note");

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setUserAddressId(addressId);

        order.setTotalPrice(totalPrice);
        order.setStatus("pending");
        order.setPaymentStatus("UNPAID");
        order.setOrderCode("ORD-" + System.currentTimeMillis());
        order.setNote(note);

        orderDao.insert(order);

        response.sendRedirect(request.getContextPath() + "/OrderHistory");
    }
}
