package controller;

import dao.UserAddressDao;
import model.User;
import model.UserAddress;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Address")
public class AddressController extends HttpServlet {

    private UserAddressDao addressDao = new UserAddressDao();

    // hiển thị trang
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        UserAddress address = addressDao.findByUserId(user.getUserId());
        request.setAttribute("address", address);

        request.getRequestDispatcher("/Address.jsp")
                .forward(request, response);
    }

    // lưu địa chỉ
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/SignIn");
            return;
        }

        UserAddress address = new UserAddress();
        address.setUserId(user.getUserId());
        address.setCountry(request.getParameter("country"));
        address.setProvince(request.getParameter("province"));
        address.setDistrict(request.getParameter("district"));
        address.setStreet(request.getParameter("street"));

        UserAddress existed = addressDao.findByUserId(user.getUserId());

        if (existed == null) {
            addressDao.insert(address);
        } else {
            addressDao.update(address);
        }

        response.sendRedirect(request.getContextPath() + "/Address");
    }
}
