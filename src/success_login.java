import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class success_login extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        if (request.getParameter("rememberPassword") != null){
            Cookie username = new Cookie("username", request.getParameter("username"));
            username.setMaxAge(1296000);
            Cookie password = new Cookie("password", request.getParameter("password"));
            password.setMaxAge(1296000);
            response.addCookie(username);
            response.addCookie(password);
        }else{
            Cookie[] cookies = request.getCookies();
            Cookie username = null;
            Cookie password = null;
            for (Cookie cookie: cookies){
                if (cookie.getName().equals("username")){
                    username = cookie;
                }else if (cookie.getName().equals("password")){
                    password = cookie;
                }
            }
            if (username != null){
                username.setMaxAge(0);
                response.addCookie(username);
            }
            if (password != null){
                password.setMaxAge(0);
                response.addCookie(password);
            }
        }
        String username = request.getParameter("username");
        HttpSession session = request.getSession();
        session.setAttribute("username", username);
        request.getRequestDispatcher("search_bootstrap.jsp").forward(request, response);
    }
    public void doPost(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException{
        doGet(request, response);
    }
}
