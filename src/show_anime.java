import bean.Anime;
import bean.animeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class show_anime extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String anime_id = request.getParameter("anime_id");
        animeDao animedao = new animeDao();
        Anime anime = null;
        String animes_list = null;
        try{
            anime = animedao.find_by_id(anime_id);
            animes_list = animedao.find_relative_by_id(anime_id);
        }catch (Exception e){e.printStackTrace();}
        request.setAttribute("anime", anime);
        String[] id_list = animes_list.split(";");
//        System.out.println("id: " + id_list[0]);
        List<Anime> animes = new ArrayList<Anime>();
        for (int i = 0; i < 10; i++){
            Anime ani = null;
            try{
                ani = animedao.find_by_id(id_list[i]);
            }catch (Exception e){e.printStackTrace();}
            animes.add(ani);
        }
        request.setAttribute("animes", animes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("show_bootstrap.jsp");
        System.out.println("dealing search>>>>>");
        dispatcher.forward(request, response);
    }

    public void doPost(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
        doGet(request, response);
    }
}
