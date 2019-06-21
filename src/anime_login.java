import bean.userDao;
import com.alibaba.fastjson.JSONObject;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class anime_login extends HttpServlet{
    public void doPost(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
        userDao userdao = new userDao();
        String username = request.getParameter("username").trim();
        System.out.println("Username: " + username);
        String password = request.getParameter("password").trim();
        System.out.println("Password: " + password);
        List<String> passwords = null;
        passwords = userdao.get_passwords_by_name(username);
        JSONObject result = new JSONObject();
        if (passwords.size() == 0){
            result.put("accountMsg", "Wrong username");
        }else if (!password.equals(passwords.get(0))){
            result.put("pwdMsg", "Wrong password");
        }else {
            result.put("user",username);
        }
        response.getWriter().println(result.toJSONString());
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doPost(response, request);
    }
}
