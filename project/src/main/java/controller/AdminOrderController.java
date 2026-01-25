package controller;

import dao.OrderDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "AdminOrderController", value = "/admin/orders")
public class AdminOrderController extends HttpServlet {
    private OrderDao orderDao = new OrderDao();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("orders", orderDao.getAllOrders());
        request.getRequestDispatcher("/trangadmin/donhang.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}