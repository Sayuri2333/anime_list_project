import bean.userDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class edit_password extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userDao userdao = new userDao();
        boolean ok = userdao.edit_password(username, password);
        if (ok){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("edit_password.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        doGet(request, response);
    }
}
