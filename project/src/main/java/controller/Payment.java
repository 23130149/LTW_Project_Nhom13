package controller;

import cart.Cart;
import dao.OrderDao;
import dao.OrderItemDao;
import dao.UserAddressDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Order;
import model.User;
import model.UserAddress;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "Payment", value = "/payment")
public class  Payment extends HttpServlet {
    private UserAddressDao addressDao = new UserAddressDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getList().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        UserAddress address = addressDao.findByUserId(user.getUserId());
        request.setAttribute("address", address);


        BigDecimal shippingFee = BigDecimal.valueOf(0);
        BigDecimal totalPrice = cart.getTotalPrice();
        BigDecimal grandTotal = totalPrice.add(shippingFee);

        request.setAttribute("cartItems", cart.getList());
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("grandTotal", grandTotal);

        request.getRequestDispatcher("/payment.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null || cart == null || cart.getList().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setUserAddressId(Integer.parseInt(request.getParameter("addressId")));
        order.setNote(request.getParameter("note"));
        order.setStatus("PENDING"); // 👈 QUAN TRỌNG
        order.setTotalPrice(cart.getTotalPrice());
        order.setPaymentStatus("UNPAID");
        order.setOrderCode("DH" + System.currentTimeMillis());

        OrderDao orderDao = new OrderDao();
        int orderId = orderDao.insertAndReturnId(order);

        OrderItemDao orderItemDao = new OrderItemDao();
        cart.getList().forEach(item ->
                orderItemDao.insert(orderId, item)
        );

        session.removeAttribute("cart");

        response.sendRedirect("OrderHistory");
    }
}