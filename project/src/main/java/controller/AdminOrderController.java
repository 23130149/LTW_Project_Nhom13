package controller;

import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Order;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/admin/orders")
public class AdminOrderController extends HttpServlet {
    private OrderDao orderDao = new OrderDao();


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

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/trangadmin/donhang.jsp")
                .forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        if ("ship".equals(action)) {
            orderDao.updateStatus(orderId, "SHIPPED");
        }

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
}
