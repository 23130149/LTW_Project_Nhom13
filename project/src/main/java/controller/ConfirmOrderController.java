package controller;

import dao.OrderDao;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Order;
import model.User;

import java.io.IOException;

@WebServlet("/ConfirmOrder")
public class ConfirmOrderController extends HttpServlet {

    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        int orderId;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/OrderHistory");
            return;
        }

        // chỉ cho phép user xác nhận đơn của chính mình
        Order order = orderDao.getOrderByIdAndUser(orderId, user.getUserId());

        if (order != null && "SHIPPED".equals(order.getStatus())) {
            orderDao.updateStatus(orderId, "COMPLETED");
        }

        response.sendRedirect(request.getContextPath() + "/OrderHistory");
    }
}
