import bean.userDao;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class username_check extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        JSONObject result = new JSONObject();
        try{
            String username = request.getParameter("username");
            userDao userdao = new userDao();
            boolean check = userdao.username_check(username);
            if (check == true){
                result.put("checked", "ok");
            }else {result.put("uncheck", "not ok");}
        }catch (Exception e){e.printStackTrace();}
        System.out.println(result.toJSONString());
        response.getWriter().println(result.toJSONString());
    }
    public void doPost(HttpServletResponse response, HttpServletRequest request) throws IOException{
        doGet(request, response);
    }
}
