package controller.admin;

import dao.ProductDao;
import dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Product;
import model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "AdminProduct", value = "/admin/products")
public class ProductManagement extends HttpServlet {
    private static final Logger log = LoggerFactory.getLogger(ProductManagement.class);
    private ProductDao pdao;
    private UserDao udao;

    @Override
    public void init() {
        pdao = new ProductDao();
        udao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        User admin = udao.getAdmin();

        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";

        if (admin != null) {
            adminName = admin.getUserName();
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }
        int totalProducts = pdao.getTotalProducts();
        int outOfStock = pdao.countOutOfStock();
        int totalStock = pdao.getTotalStock();
        double totalValue = pdao.getTotalInventoryValue();

        List<Product> products = pdao.getListProduct();

        int notificationCount = 0;

        request.setAttribute("products", products);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("outOfStock", outOfStock);
        request.setAttribute("totalStock", totalStock);
        request.setAttribute("totalValue", totalValue);
        request.setAttribute("notificationCount", notificationCount);
        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);

        request.getRequestDispatcher("/trangadmin/qlsanpham.jsp")
                .forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        log.info("AdminProduct action = {}", action);

        try {
            if ("add".equals(action)) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));

                Product p = new Product();
                p.setProductName(name);
                p.setProductPrice(price);
                p.setStockQuantity(stock);

                pdao.insert(p);

            }
            else if ("update".equals(action)) {

                int id = Integer.parseInt(request.getParameter("productId"));
                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));

                Product p = new Product();
                p.setProductId(id);
                p.setProductName(name);
                p.setProductPrice(price);
                p.setStockQuantity(stock);

                pdao.update(p);
            }

            else if ("delete".equals(action)) {

                int id = Integer.parseInt(request.getParameter("productId"));
                pdao.delete(id);
            }

        } catch (Exception e) {
            log.error("ProductManagement error", e);
        }

        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}