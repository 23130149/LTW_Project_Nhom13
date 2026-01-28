package controller.admin;

import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.Product;
import model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Dashboard", value = "/admin/dashboard")
public class Dashboard extends HttpServlet {
    private static final Logger log = LoggerFactory.getLogger(Dashboard.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao pdao = new ProductDao();
        OrderDao odao = new OrderDao();
        UserDao udao = new UserDao();
        User admin = udao.getAdmin();

        int totalProducts = pdao.getTotalProducts();
        int totalOrders = odao.countOrders();
        int totalUsers = udao.countUsers();
        double totalRevenue = odao.getTotalRevenue();
        List<Order> latestOrders = odao.getLatestOrders(5);
        List<Product> topProducts = odao.getTopProducts(5);

        String range = request.getParameter("range");
        if (range == null) range = "7";

        Map<String, Double> rawRevenueChart = odao.getRevenueChart(range);

        double maxRevenue = rawRevenueChart.values().stream()
                .mapToDouble(Double::doubleValue)
                .max()
                .orElse(1.0);

        List<Map<String, Object>> revenueChart = new ArrayList<>();
        for (Map.Entry<String, Double> entry : rawRevenueChart.entrySet()) {
            Map<String, Object> item = new HashMap<>();
            item.put("key", entry.getKey());
            item.put("value", (entry.getValue() / maxRevenue) * 100);
            item.put("originalValue", entry.getValue());
            revenueChart.add(item);
        }

        if (revenueChart.isEmpty()) {
            revenueChart = new ArrayList<>();
            if ("30".equals(range)) {
                String[] weeks = {"Tuần 1", "Tuần 2", "Tuần 3", "Tuần 4"};
                for (String week : weeks) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("key", week);
                    item.put("value", 0.0);
                    item.put("originalValue", 0.0);
                    revenueChart.add(item);
                }
            } else {
                String[] days = {"T2", "T3", "T4", "T5", "T6", "T7", "CN"};
                for (String day : days) {
                    Map<String, Object> item = new HashMap<>();
                    item.put("key", day);
                    item.put("value", 0.0);
                    item.put("originalValue", 0.0);
                    revenueChart.add(item);
                }
            }
        }

        int notificationCount = odao.countOrdersByStatus("PENDING");

        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";

        if (admin != null) {
            adminName = admin.getUserName();
            adminRole = "Quản trị viên";
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }

        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("latestOrders", latestOrders);
        request.setAttribute("topProducts", topProducts);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("range", range);
        request.setAttribute("revenueChart", revenueChart);  // giờ là List<Map>
        request.setAttribute("notificationCount", notificationCount);
        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);

        request.getRequestDispatcher("/trangadmin/tongquan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}