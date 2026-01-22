package controller.admin;

import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Order;
import model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Dashboard", value = "/dashboard")
public class Dashboard extends HttpServlet {
    private static final Logger log = LoggerFactory.getLogger(Dashboard.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao pdao = new ProductDao();
        OrderDao odao = new OrderDao();
        UserDao udao = new UserDao();
        
      //  int totalProducts = pdao.getTotalProducts();
     //   int totalOrders = odao.countOrders();
        int totalUsers = udao.countUsers();
     //   double totalRevenue = odao.getTotalRevenue();
     //   List<Order> latestOrders = odao.getLatestOrders(5);
      //  List<Product> topProducts = odao.getTopProducts(5);

      //  request.setAttribute("totalProducts", totalProducts);
    //    request.setAttribute("totalOrders", totalOrders);
      //  request.setAttribute("latestOrders", latestOrders);
       // request.setAttribute("topProducts", topProducts);
        //request.setAttribute("totalUsers", totalUsers);
        // request.setAttribute("totalRevenue", totalRevenue);

        request.getRequestDispatcher("/trangadmin/tongquan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    }
