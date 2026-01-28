package controller.admin;

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

    @Override
    public void init() {
        pdao = new ProductDao();
        udao = new UserDao();
    }

    // ======================= GET =======================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User admin = udao.getAdmin();

        String adminName = "Admin";
        String adminRole = "Quản trị viên";
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
        request.setAttribute("notificationCount", 0);
        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);

        request.getRequestDispatcher("/trangadmin/qlsanpham.jsp")
                .forward(request, response);
    }

    // ======================= POST =======================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        log.info("AdminProduct action = {}", action);

        try {
            if ("add".equals(action) || "update".equals(action)) {

                String name = request.getParameter("name");
                int price = Integer.parseInt(request.getParameter("price"));
                int stock = Integer.parseInt(request.getParameter("stock"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                String description = request.getParameter("description");

                // ===== XỬ LÝ UPLOAD ẢNH =====
                Part filePart = request.getPart("productImage");
                String imageUrl = null;

                if (filePart != null && filePart.getSize() > 0) {
                    String fileName = Paths.get(filePart.getSubmittedFileName())
                            .getFileName().toString();

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
                } else {
                    int id = Integer.parseInt(request.getParameter("productId"));
                    p.setProductId(id);

                    if (imageUrl == null) {
                        Product old = pdao.getProductById(id);
                        p.setImageUrl(old.getImageUrl());
                    } else {
                        p.setImageUrl(imageUrl);
                    }

                    pdao.update(p);
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("productId"));
                pdao.delete(id);
            }

        } catch (Exception e) {
            e.printStackTrace();
            log.error("ProductManagement error", e);
        }

        response.sendRedirect(request.getContextPath() + "/admin/products");
    }
}
