import bean.userDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class sign_up extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        userDao userdao = new userDao();
        boolean ok = userdao.insert_into_table(username, password);
        System.out.println(ok);
        if (ok){
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("sign_up.jsp").forward(request, response);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        doPost(request, response);
    }
}
