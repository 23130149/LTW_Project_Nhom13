package controller;

import dao.OrderDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Order;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/Account")
public class AccountController extends HttpServlet {

    private OrderDao orderDao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        @SuppressWarnings("unchecked")
        List<Order> recentOrders =
                (List<Order>) session.getAttribute("recentOrders");

        if (recentOrders == null) {
            recentOrders =
                    orderDao.getRecentOrdersByUser(user.getUserId(), 3);

            session.setAttribute("recentOrders", recentOrders);
        }

        request.setAttribute("orderList", recentOrders);

        request.getRequestDispatcher("/account.jsp")
                .forward(request, response);
    }
}
