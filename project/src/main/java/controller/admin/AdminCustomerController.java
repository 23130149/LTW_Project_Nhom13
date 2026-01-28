package controller.admin;

import com.google.gson.Gson;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/admin/customers", "/admin/customer-detail"})
public class AdminCustomerController extends HttpServlet {

    private UserDao userDao;
    private Gson gson;

    @Override
    public void init() {
        userDao = new UserDao();
        gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/admin/customers".equals(path)) {
            List<User> customers = userDao.getAllCustomers();
            int totalCustomers = userDao.countTotalCustomers();
            int vipCustomers = userDao.countVipCustomers();
            int newCustomers = userDao.countNewCustomersThisMonth();
            double avgOrderValue = userDao.getAverageSpendPerCustomer();

            User admin = userDao.getAdmin();
            String adminName = "Admin";
            String adminRole = "Quản trị viên";
            String adminAvatar = "A";
            int notificationCount = 0;

            if (admin != null) {
                adminName = admin.getUserName();
                adminAvatar = adminName.substring(0, 1).toUpperCase();
            }

            request.setAttribute("customers", customers);
            request.setAttribute("totalCustomers", totalCustomers);
            request.setAttribute("vipCustomers", vipCustomers);
            request.setAttribute("newCustomers", newCustomers);
            request.setAttribute("avgOrderValue", avgOrderValue);

            request.setAttribute("adminName", adminName);
            request.setAttribute("adminRole", adminRole);
            request.setAttribute("adminAvatar", adminAvatar);
            request.setAttribute("notificationCount", notificationCount);

            request.getRequestDispatcher("/trangadmin/khachhang.jsp").forward(request, response);
            return;
        }

        if ("/admin/customer-detail".equals(path)) {
            int userId = Integer.parseInt(request.getParameter("id"));
            User user = userDao.getCustomerDetail(userId);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(gson.toJson(user));
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("userName");
        String phone = request.getParameter("phone");

        userDao.updateCustomer(userId, name, phone);
        response.sendRedirect(request.getContextPath() + "/admin/customers");
    }
}