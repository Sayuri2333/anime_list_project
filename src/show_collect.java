import bean.Anime;
import bean.animeDao;
import bean.userDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class show_collect extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        userDao userdao = new userDao();
        animeDao animedao = new animeDao();
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        List<Anime> collected_anime, related_anime = null;
        collected_anime = userdao.show_collect(username);
        try{related_anime = animedao.find_relative_by_ids(username);}catch (Exception e){}
        String anime_name = "";
        for (Anime anime: collected_anime){
            anime_name += anime.getAnime_id() + ";";
        }
        request.setAttribute("collected_anime", collected_anime);
        request.setAttribute("related_anime", related_anime);
        request.setAttribute("anime_name", anime_name);
        RequestDispatcher dispatcher = request.getRequestDispatcher("show_collect.jsp");
        dispatcher.forward(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        doPost(request, response);
    }
}
