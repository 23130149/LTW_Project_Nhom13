package controller;

import dao.OrderDao;
import model.Order;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/OrderHistory")
public class OrderHistoryController extends HttpServlet {

    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ Lấy session (không tạo mới)
        HttpSession session = request.getSession(false);

        // 2️⃣ Chưa login → redirect Login
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        // 3️⃣ Lấy user từ session
        User user = (User) session.getAttribute("user");

        // 4️⃣ Lấy TOÀN BỘ lịch sử đơn hàng
        List<Order> orderList =
                orderDao.getOrdersByUserId(user.getUserId());

        // 5️⃣ Đưa dữ liệu sang view
        request.setAttribute("orderList", orderList);

        // 6️⃣ Forward
        request.getRequestDispatcher("/OrderHistory.jsp")
                .forward(request, response);
    }
}
