package controller.admin;

import dao.ContactDao;
import dao.OrderDao;
import dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;

@WebServlet("/admin/contacts")
public class AdminContactController extends HttpServlet {

    private ContactDao contactDao;
    private UserDao udao;
    private OrderDao odao;

    @Override
    public void init() {
        contactDao = new ContactDao();
        udao = new UserDao();
        odao = new OrderDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        int notificationCount = odao.countOrdersByStatus("PENDING");

        User admin = udao.getAdmin();
        String adminName = "Admin";
        String adminRole = "Quản trị viên";
        String adminAvatar = "A";

        if (admin != null) {
            adminName = admin.getUserName();
            adminRole = "Quản trị viên";
            adminAvatar = adminName.substring(0, 1).toUpperCase();
        }
        request.setAttribute("adminName", adminName);
        request.setAttribute("adminRole", adminRole);
        request.setAttribute("adminAvatar", adminAvatar);
        request.setAttribute("notificationCount", notificationCount);

        if (keyword != null && !keyword.isBlank()) {
            request.setAttribute("contacts", contactDao.search(keyword));
        } else {
            request.setAttribute("contacts", contactDao.findAll());
        }

        request.setAttribute("totalContacts", contactDao.count());

        request.getRequestDispatcher("/trangadmin/qlcontact.jsp")
                .forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("contactId"));
            contactDao.delete(id);
        }

        response.sendRedirect(request.getContextPath() + "/admin/contacts");
    }
}
