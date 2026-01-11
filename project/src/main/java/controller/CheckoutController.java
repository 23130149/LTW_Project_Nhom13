package controller;

import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import model.User;

import java.io.IOException;

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {

    private OrderDao orderDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
    }

    // Khi user bấm "Đặt hàng"
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        int addressId = Integer.parseInt(request.getParameter("addressId"));
        int paymentMethodId = Integer.parseInt(request.getParameter("paymentMethodId"));
        String note = request.getParameter("note");

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setUserAddressId(addressId);
        order.setPaymentMethodId(paymentMethodId);
        order.setTotalPrice(totalPrice);
        order.setStatus("Chờ xác nhận");
        order.setPaymentStatus("Chưa thanh toán");
        order.setOrderCode("ORD-" + System.currentTimeMillis());
        order.setNote(note);

        orderDao.insert(order);


        response.sendRedirect(request.getContextPath() + "/OrderHistory");
    }
}
