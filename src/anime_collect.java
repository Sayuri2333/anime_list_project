import bean.userDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class anime_collect extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        userDao userdao = new userDao();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String anime_id = request.getParameter("anime_id");
        userdao.insert_into_collected(username, anime_id);
        request.setAttribute("collected", true);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/show_anime");
        dispatcher.forward(request, response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException{
        doPost(request, response);
    }
}
