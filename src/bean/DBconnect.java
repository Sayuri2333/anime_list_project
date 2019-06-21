package bean;
import java.sql.*;
public class DBconnect {
    private static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DBURL="jdbc:mysql://localhost:3306/bangumi?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String DBUSER = "root";
    private static final String DBPASS = "root";
    public static Connection getDBConnection(){
        try{
            Class.forName(DBDRIVER);
            Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
            return conn;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
    public static void closeDB(Connection conn, PreparedStatement pstmt, ResultSet rs){
        try{
            if (rs != null) rs.close();
            if (conn != null) conn.close();
            if (pstmt != null) pstmt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
