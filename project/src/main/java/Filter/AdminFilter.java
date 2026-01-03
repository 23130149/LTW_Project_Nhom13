package Filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter("/trangadmin/*")
public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            // chưa login
            resp.sendRedirect(req.getContextPath() + "/SignIn");
            return;
        }

        Object obj = session.getAttribute("user");
        model.User user = (model.User) obj;

        if (!"ADMIN".equals(user.getRole())) {
            // không phải admin
            resp.sendRedirect(req.getContextPath() + "/trangchu.jsp");
            return;
        }

        // là admin → cho đi tiếp
        chain.doFilter(request, response);
    }
}
