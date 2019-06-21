package bean;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class animeDao {
    protected static String search_title = "select * from selected_anime where title like ?";
    protected static String search_japanese = "select * from selected_anime where title_japanese like ?";
    protected static String search_id = "select * from selected_anime where anime_id = ?";
    public Anime find_by_id(String anime_id) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        Anime anime = null;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(search_id);
            pstmt.setString(1, anime_id);
            rs = pstmt.executeQuery();
            if (rs.next()){
                anime = new Anime();
                anime.setAnime_id(rs.getString(1));
                anime.setTitle(rs.getString(2));
                anime.setTitle_japanese(rs.getString(3));
//                anime.setImage_url(rs.getString(4));
                String[] image_url = rs.getString(4).split("/images");
                anime.setImage_url(image_url[1]);
                anime.setType(rs.getString(5));
                anime.setSource(rs.getString(6));
                anime.setEpisodes(rs.getString(7));
                anime.setStatus(rs.getString(8));
                anime.setAired_string(rs.getString(9));
                anime.setDuration(rs.getString(10));
                anime.setRating(rs.getNString(11));
                anime.setScore(rs.getString(12));
                anime.setScore_by(rs.getString(13));
                anime.setRank(rs.getString(14));
                anime.setPopularity(rs.getString(15));
                anime.setStudio(rs.getString(16));
                anime.setGenre(rs.getString(17));
            }
        }finally {
            DBconnect.closeDB(conn, pstmt, rs);
        }
        return anime;
    }

    public List<Anime> find_by_title(String title) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Anime> animes = new ArrayList<Anime>();
        conn=DBconnect.getDBConnection();
        pstmt = conn.prepareStatement(search_title);
        pstmt.setString(1, "%"+title+"%");
        rs = pstmt.executeQuery();
        while(rs.next()){
            Anime anime = new Anime();
            anime.setAnime_id(rs.getString(1));
            anime.setTitle(rs.getString(2));
            anime.setTitle_japanese(rs.getString(3));
//            anime.setImage_url(rs.getString(4));
            String[] image_url = rs.getString(4).split("/images");
            anime.setImage_url(image_url[1]);
            anime.setType(rs.getString(5));
            anime.setSource(rs.getString(6));
            anime.setEpisodes(rs.getString(7));
            anime.setStatus(rs.getString(8));
            anime.setAired_string(rs.getString(9));
            anime.setDuration(rs.getString(10));
            anime.setRating(rs.getNString(11));
            anime.setScore(rs.getString(12));
            anime.setScore_by(rs.getString(13));
            anime.setRank(rs.getString(14));
            anime.setPopularity(rs.getString(15));
            anime.setStudio(rs.getString(16));
            anime.setGenre(rs.getString(17));
            animes.add(anime);
        }
        DBconnect.closeDB(conn, pstmt, rs);
        return animes;
    }

    public List<Anime> find_by_japanese(String japanese) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Anime> animes = new ArrayList<Anime>();
        conn=DBconnect.getDBConnection();
        pstmt = conn.prepareStatement(search_japanese);
        pstmt.setString(1, "%"+japanese+"%");
        rs = pstmt.executeQuery();
        while(rs.next()){
            Anime anime = new Anime();
            anime.setAnime_id(rs.getString(1));
            anime.setTitle(rs.getString(2));
            anime.setTitle_japanese(rs.getString(3));
//            anime.setImage_url(rs.getString(4));
            String[] image_url = rs.getString(4).split("/images");
            anime.setImage_url(image_url[1]);
            anime.setType(rs.getString(5));
            anime.setSource(rs.getString(6));
            anime.setEpisodes(rs.getString(7));
            anime.setStatus(rs.getString(8));
            anime.setAired_string(rs.getString(9));
            anime.setDuration(rs.getString(10));
            anime.setRating(rs.getNString(11));
            anime.setScore(rs.getString(12));
            anime.setScore_by(rs.getString(13));
            anime.setRank(rs.getString(14));
            anime.setPopularity(rs.getString(15));
            anime.setStudio(rs.getString(16));
            anime.setGenre(rs.getString(17));
            animes.add(anime);
        }
        DBconnect.closeDB(conn, pstmt, rs);
        return animes;
    }

    public String find_relative_by_id(String anime_id) throws Exception{
        anime_id = anime_id.trim();
        String searching_url = "http://118.27.27.84:5000/predict/" + anime_id + "/";
        URL url = new URL(searching_url);
        BufferedReader in = null;
        String str = null;
        try{
            in = new BufferedReader(new InputStreamReader(url.openStream()));
            str = in.readLine();
        }catch (Exception e){}
        finally{
            try{
                if (in != null){
                    in.close();
                }
            }catch (Exception e){}
        }
        if (str != null){
            JSONObject json = new JSONObject(str);
            str = json.getString("anime_ids");
            System.out.println(str);
        }
        return str;
    }

    public List<Anime> find_relative_by_ids(String username) throws Exception{
        userDao userdao = new userDao();
        List<Anime> collected = userdao.show_collect(username);
        String ids = "";
        for (Anime anime: collected){
            ids += anime.getAnime_id() + ";";
        }
        String searching_url = "http://118.27.27.84:5000/recommend/" + ids + "/";
        URL url = new URL(searching_url);
        BufferedReader in = null;
        String str = null;
        try{
            in = new BufferedReader(new InputStreamReader(url.openStream()));
            str = in.readLine();
        }catch (Exception e){}
        finally{
            try{
                if (in != null){
                    in.close();
                }
            }catch (Exception e){}
        }
        if (str != null){
            JSONObject json = new JSONObject(str);
            str = json.getString("anime_ids");
        }
        String[] id_list = str.split(";");
        List<Anime> recommend = new ArrayList<Anime>();
        for (int i = 0; i < id_list.length - 1; i++){
            Anime ani = null;
            try{
                ani = find_by_id(id_list[i]);
            }catch (Exception e){e.printStackTrace();}
            recommend.add(ani);
        }
        return recommend;
    }
}
