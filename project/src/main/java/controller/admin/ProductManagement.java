package controller.admin;

import dao.OrderDao;
import dao.ProductDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Product;
import model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(name = "AdminProduct", value = "/admin/products")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,      // 1MB
        maxFileSize = 5 * 1024 * 1024,         // 5MB
        maxRequestSize = 10 * 1024 * 1024      // 10MB
)
public class ProductManagement extends HttpServlet {

    private static final Logger log = LoggerFactory.getLogger(ProductManagement.class);
    private ProductDao pdao;
    private UserDao udao;
    private OrderDao odao;

    @Override
    public void init() {
        pdao = new ProductDao();
        udao = new UserDao();
        odao = new OrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int notificationCount = odao.countOrdersByStatus("PENDING");
        User admin = udao.getAdmin();
        String adminName = "Admin";
        String adminAvatar = "A";

        if (admin != null) {
            adminName = admin.getUserName();
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }

        List<Product> products = pdao.getListProduct();

        request.setAttribute("products", products);
        request.setAttribute("totalProducts", pdao.getTotalProducts());
        request.setAttribute("outOfStock", pdao.countOutOfStock());
        request.setAttribute("totalStock", pdao.getTotalStock());
        request.setAttribute("totalValue", pdao.getTotalInventoryValue());
        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", "Quản trị viên");
        request.setAttribute("adminAvatar", adminAvatar);

        request.getRequestDispatcher("/trangadmin/qlsanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        log.info("Hành động nhận được từ trình duyệt: {}", action);

        try {
            if ("add".equals(action) || "edit".equals(action)) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String description = request.getParameter("description");

                Part filePart = request.getPart("productImage");
                String imageUrl = null;

                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = getServletContext().getRealPath("/images");
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();

                    filePart.write(uploadPath + File.separator + fileName);
                    imageUrl = fileName;
                }

                Product p = new Product();
                p.setProductName(name);
                p.setProductPrice(price);
                p.setStockQuantity(stock);
                p.setCategoryId(categoryId);
                p.setProductDescription(description);

                if ("add".equals(action)) {
                    p.setImageUrl(imageUrl);
                    pdao.insert(p);
                    log.info("Đã thêm sản phẩm mới: {}", name);
                }
                else if ("edit".equals(action)) {
                    int id = Integer.parseInt(request.getParameter("productId"));
                    p.setProductId(id);

                    if (imageUrl == null || imageUrl.isEmpty()) {
                        Product currentProduct = pdao.getProductById(id);
                        p.setImageUrl(currentProduct.getImageUrl());
                    } else {
                        p.setImageUrl(imageUrl);
                    }

                    pdao.update(p);
                    log.info("Đã cập nhật sản phẩm ID: {}", id);
                }
            }
            else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("productId"));
                pdao.delete(id);
                log.info("Đã xóa sản phẩm ID: {}", id);
            }

        } catch (Exception e) {
            log.error("Lỗi khi xử lý dữ liệu: {}", e.getMessage());
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}