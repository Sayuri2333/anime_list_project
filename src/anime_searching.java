import bean.Anime;
import bean.animeDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class anime_searching extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        animeDao anime_dao = new animeDao();
        String anime_name = request.getParameter("anime_name").trim();
        String select_type = request.getParameter("select").trim();
        System.out.println("select_type: " + select_type);
        List<Anime> animes = null;
        HttpSession session = request.getSession();
        try{
            animes = anime_dao.find_by_title(anime_name);
        }catch (Exception e){}
        finally {
            System.out.println(animes);
            if(animes.size() > 0){
                System.out.println(animes.get(1).getTitle());
                request.setAttribute("animelist", animes);
                System.out.println("dealing search>>>>>");
                request.getRequestDispatcher("search_bootstrap.jsp").forward(request,response);
            }else {
                request.setAttribute("animelist", null);
                request.getRequestDispatcher("search_bootstrap.jsp").forward(request,response);
            }
        }
    }

    public void doGet(HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException{
        doPost(request, response);
    }
}
