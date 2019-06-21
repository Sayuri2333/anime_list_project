package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class animeInfoDao {
    protected static String average_by_id_time = "select avg(score) from anime_score_? where anime_id=?";
    protected static String min_by_id_time = "select count(score) from anime_score_? where anime_id=? and score=0";
    protected static String max_by_id_time = "select count(score) from anime_score_? where anime_id=? and score=10";
    public Map<String, List<animeScore>> average_by_time(String anime_id) throws Exception{
        Connection conn = null, conn_min = null, conn_max = null;
        PreparedStatement pstmt = null, pstmt_min = null, pstmt_max = null;
        ResultSet rs = null, rs_min = null, rs_max = null;
        Map<String, List<animeScore>> scores_map = new HashMap<String, List<animeScore>>();
        List<animeScore> animeScores = new ArrayList<animeScore>();
        List<animeScore> minScores = new ArrayList<animeScore>();
        List<animeScore> maxScores = new ArrayList<animeScore>();
        System.out.println("in DAO!!!!");
        try{
            conn = DBconnect.getDBConnection();
            conn_min = DBconnect.getDBConnection();
            conn_max = DBconnect.getDBConnection();
            pstmt = conn.prepareStatement(average_by_id_time);
            pstmt_min = conn_min.prepareStatement(min_by_id_time);
            pstmt_max = conn_max.prepareStatement(max_by_id_time);
            for(int i = 2007; i <= 2018; i++){
                int year = (i+1);
                pstmt.setInt(1, year);
                pstmt.setString(2, anime_id);
                pstmt_min.setInt(1, year);
                pstmt_min.setString(2, anime_id);
                pstmt_max.setInt(1, year);
                pstmt_max.setString(2, anime_id);
                System.out.println("search !!!!!!!");
                rs = pstmt.executeQuery();
                rs_min = pstmt_min.executeQuery();
                rs_max = pstmt_max.executeQuery();
                while(rs.next()){
                    animeScore score = new animeScore();
                    score.setScore(rs.getDouble(1));
                    score.setTime(year+"");
                    animeScores.add(score);
                }
                scores_map.put("average", animeScores);
                rs.close();

                while(rs_min.next()){
                    System.out.println("count min");
                    animeScore score = new animeScore();
                    double min = rs_min.getDouble(1);
                    System.out.println("min" + min);
                    score.setScore(min);
                    score.setTime(year+"");
                    minScores.add(score);
                }
                scores_map.put("min", minScores);
                rs_min.close();

                while(rs_max.next()){
                    System.out.println("count max");
                    animeScore score = new animeScore();
                    double max = rs_max.getDouble(1);
                    System.out.println("max" + max);
                    score.setScore(rs_max.getDouble(1));
                    score.setTime(year+"");
                    maxScores.add(score);
                }
                scores_map.put("max", maxScores);
                rs_max.close();
            }
            DBconnect.closeDB(conn, pstmt, rs);
            DBconnect.closeDB(conn_min, pstmt_min, rs_min);
            DBconnect.closeDB(conn_max, pstmt_max, rs_max);
            return scores_map;
        } catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
