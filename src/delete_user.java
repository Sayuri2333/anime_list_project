import bean.userDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class delete_user extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        String username = (String)session.getAttribute("username");
        userDao userdao = new userDao();
        userdao.delete_username(username);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search_bootstrap.jsp");
        session.setAttribute("username", null);
        dispatcher.forward(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(request, response);
    }
}
