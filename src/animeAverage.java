import bean.animeInfoDao;
import bean.animeScore;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

public class animeAverage extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        animeInfoDao info_dao = new animeInfoDao();
        String anime_id = request.getParameter("anime_id").trim();
        System.out.println(anime_id);
        Map<String, List<animeScore>> score_map = new HashMap<String, List<animeScore>>();
        List<animeScore> avgscores= null;
        List<animeScore> minscores= null;
        List<animeScore> maxscores= null;
        System.out.println("get list of animeScore");
        try{
            score_map = info_dao.average_by_time(anime_id);
            avgscores = score_map.get("average");
            minscores = score_map.get("min");
            maxscores = score_map.get("max");
        }catch (Exception e){e.printStackTrace();}
        finally {
            JsonArray times = new JsonArray();
            JsonArray score = new JsonArray();
            JsonArray min = new JsonArray();
            JsonArray max = new JsonArray();
            for (animeScore animescore: avgscores){
                times.add(animescore.getTime());
                score.add(animescore.getScore());
            }
            for (animeScore animescore: minscores){
                min.add(animescore.getScore());
            }
            for (animeScore animescore: maxscores){
                max.add(animescore.getScore());
            }
            JsonObject json = new JsonObject();
            json.add("times", times);
            json.add("score", score);
            json.add("min", min);
            json.add("max", max);
            response.setCharacterEncoding("utf-8");
            try{
                response.getWriter().println(json);
            }catch (Exception e){e.printStackTrace();}
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        doGet(request, response);
    }
}
