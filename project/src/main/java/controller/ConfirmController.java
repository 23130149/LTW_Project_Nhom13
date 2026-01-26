package controller;

import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ConfirmController", value = "/ConfirmController")
public class ConfirmController extends HttpServlet {
    private OrderDao orderDao = new OrderDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));

        orderDao.updateStatus(orderId, "CONFIRMED");

        response.sendRedirect(request.getContextPath() + "/admin/orders");
    }
    }
