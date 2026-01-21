package controller;

import dao.OrderDao;
import dao.OrderItemDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Order;
import model.OrderItem;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/OrderDetail")
public class OrderDetailController extends HttpServlet {

    private OrderDao orderDao;
    private OrderItemDao orderItemDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
        orderItemDao = new OrderItemDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        // 1️⃣ Chưa login
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        // 2️⃣ Lấy orderId
        int orderId;
        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/OrderHistory");
            return;
        }

        // 3️⃣ Lấy đơn hàng (check đúng user)
        Order order = orderDao.getOrderByIdAndUser(orderId, user.getUserId());
        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/OrderHistory");
            return;
        }

        // 4️⃣ Lấy danh sách item
        List<OrderItem> items = orderItemDao.getItemsByOrderId(orderId);

        // 5️⃣ Gửi sang JSP
        request.setAttribute("order", order);
        request.setAttribute("orderItems", items);

        request.getRequestDispatcher("/OrderDetail.jsp")
                .forward(request, response);
    }
}
