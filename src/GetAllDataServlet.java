import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class GetAllDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetAllDataServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*����*/
        Integer[] salesVolume = {10,100,20,56,35,80};
        /*Ӫҵ��*/
        double[] bussinessVolume = {10*10,100*8.5,20*9.5,56*9,35*9.5,80*9};
        /*����, �·�����*/
        String[] months = {"1","2","3","4","5","6"};

        Map<String, Object> map = new HashMap<>();
        map.put("salesVolume", salesVolume);
        map.put("bussinessVolume",bussinessVolume);
        map.put("months", months);

        response.getWriter().println(JSON.toJSONString(map));

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}