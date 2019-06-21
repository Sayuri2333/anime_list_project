package bean;

import com.mysql.cj.xdevapi.DbDoc;
import com.mysql.cj.xdevapi.Result;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDao {
    protected static String get_password_by_name = "select password from anime_user where username=?";
    protected static String insert_into_table = "insert into anime_user values (?, ?)";
    protected static String insert_into_collected = "insert into anime_collected values(?, ?)";
    protected static String get_collected = "select * from anime_collected where username=? and anime_id=?";
    protected static String show_collected = "select anime_id from anime_collected where username=?";
    protected static String delete_user = "delete from anime_user where username=?";
    protected static String delete_collected = "delete from anime_collected where username = ?";
    protected static String username_check = "select * from anime_user where username = ?";
    protected static String edit_password = "update anime_user set password = ? where username = ?";

    public boolean edit_password(String username, String password){
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean ok = false;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(edit_password);
            pstmt.setString(1, password);
            pstmt.setString(2, username);
            int i = pstmt.executeUpdate();
            if (i == 1){ok = true;}
        }catch (Exception e){e.printStackTrace();}
        finally {
            return ok;
        }
    }

    public boolean username_check(String username){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(username_check);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            boolean next = rs.next();
            DBconnect.closeDB(conn, pstmt, rs);
            if (next){
                return false;
            }else {
                return true;
            }
        }catch (Exception e){e.printStackTrace();}
        return false;
    }
    public void delete_username(String username){
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(delete_user);
            pstmt.setString(1, username);
            pstmt.executeUpdate();
        }catch (Exception e){e.printStackTrace();}
        try{
            pstmt = conn.prepareStatement(delete_collected);
            pstmt.setString(1, username);
            pstmt.executeUpdate();
        }catch (Exception e){e.printStackTrace();}
        try{
            if (conn != null) conn.close();
            if (pstmt != null) pstmt.close();
        }catch (Exception e){e.printStackTrace();}
    }
    public List<String> get_passwords_by_name(String username){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<String> password = new ArrayList<String>();
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(get_password_by_name);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while(rs.next()){
                password.add(rs.getString(1));
            }
            DBconnect.closeDB(conn, pstmt, rs);
        }catch (Exception e){e.printStackTrace();}
        return password;
    }

    public boolean insert_into_table(String username, String password){
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean insert = true;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(insert_into_table);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.executeUpdate();
            if (conn != null){conn.close();}
            if (pstmt != null){pstmt.close();}
        }catch (Exception e){ insert = false; e.printStackTrace();}
        return insert;
    }

    public boolean insert_into_collected(String username, String anime_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean insert = true;
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(get_collected);
            pstmt.setString(1, username);
            pstmt.setString(2, anime_id);
            rs = pstmt.executeQuery();
            if(rs.next()){}else{
                pstmt = conn.prepareStatement(insert_into_collected);
                pstmt.setString(1, username);
                pstmt.setString(2, anime_id);
                pstmt.executeUpdate();
            }
        }catch (Exception e){insert = false;}
        DBconnect.closeDB(conn, pstmt, rs);
        return insert;
    }

    public List<Anime> show_collect(String username){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        animeDao animedao = new animeDao();
        List<Anime> anime_collected = new ArrayList<Anime>();
        try{
            conn = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(show_collected);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            while (rs.next()){
                String anime_id = rs.getString(1);
                anime_collected.add(animedao.find_by_id(anime_id));
            }
        }catch (Exception e){}
        DBconnect.closeDB(conn, pstmt, rs);
        return anime_collected;
    }
}
