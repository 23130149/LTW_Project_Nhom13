package controller.admin;

import dao.ContactDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/contacts")
public class AdminContactController extends HttpServlet {

    private ContactDao contactDao;

    @Override
    public void init() {
        contactDao = new ContactDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

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
