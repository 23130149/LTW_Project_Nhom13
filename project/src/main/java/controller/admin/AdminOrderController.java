package controller.admin;

import dao.OrderDao;
import dao.UserDao; // 1. Thêm UserDao
import model.User;  // 2. Thêm model User
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Order;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/admin/orders")
public class AdminOrderController extends HttpServlet {
    private OrderDao orderDao = new OrderDao();
    private UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = request.getParameter("status");

        List<Order> orders;
        if (status == null || status.isEmpty()) {
            orders = orderDao.getAllOrders();
        } else {
            orders = orderDao.getOrdersByStatus(status);
        }

        User admin = udao.getAdmin();
        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";
        int notificationCount = 0;

        if (admin != null) {
            adminName = admin.getUserName();
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }

        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);
        request.setAttribute("notificationCount", notificationCount);

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/trangadmin/donhang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr != null && "ship".equals(action)) {
            int orderId = Integer.parseInt(orderIdStr);
            orderDao.updateStatus(orderId, "SHIPPED");
        }

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}