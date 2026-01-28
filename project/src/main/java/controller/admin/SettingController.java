package controller.admin;

import dao.OrderDao;
import dao.SettingDao;
import dao.UserDao;
import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "SettingController", value = "/admin/setting")
public class SettingController extends HttpServlet {
    private SettingDao settingDao = new SettingDao();
    private UserDao udao = new UserDao();
    private OrderDao odao = new OrderDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Map<String, Object> settings = settingDao.getSettings();
        request.setAttribute("st", settings);

        User admin = udao.getAdmin();
        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";
        int notificationCount = odao.countOrdersByStatus("PENDING");

        if (admin != null) {
            adminName = admin.getUserName();
            adminRole = "Quản trị viên";
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }

        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);
        request.setAttribute("notificationCount", notificationCount);

        request.getRequestDispatcher("/trangadmin/caidat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("shopName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String website = request.getParameter("website");
        String address = request.getParameter("address");

        settingDao.updateSettings(name, email, phone, website, address);

        response.sendRedirect(request.getContextPath() + "/admin/setting?status=success");
    }
}