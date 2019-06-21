package bean;
import bean.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class usrDAO {
    private static final String DBDRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String DBURL="jdbc:mysql://localhost:3306/bangumi?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    private static final String DBUSER = "root";
    private static final String DBPASS = "root";
    private static final String select_SQL = "select * from test_user where usernumber = ?";
    private static final String insert_SQL = "insert into test_user values(?, ?, ?, ?)";
    private static Connection getDBConnection(){
        try{
            Class.forName(DBDRIVER);
            Connection conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
            return conn;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    private static void closeDB(Connection conn, PreparedStatement pstmt, ResultSet rs){
        try{
            if (rs != null) rs.close();
            if (conn != null) conn.close();
            if (pstmt != null) pstmt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Usr> select(String usernumber) throws SQLException{
        Connection conn = usrDAO.getDBConnection();
        PreparedStatement pstmt = conn.prepareStatement(select_SQL);
        pstmt.setString(1, usernumber);
        ResultSet rs = pstmt.executeQuery();
        List<Usr> users = new ArrayList<Usr>();
        while (rs.next()){
            Usr usr = new Usr();
            usr.setUsername(rs.getString(1));
            usr.setUsergender(rs.getString(2));
            usr.setUsernumber(rs.getString(3));
            users.add(usr);
        }
        usrDAO.closeDB(conn, pstmt, rs);
        return users;
    }
    public int insert(Usr user) throws  SQLException{
        Connection conn = usrDAO.getDBConnection();
        PreparedStatement pstmt = conn.prepareStatement(insert_SQL);
        pstmt.setString(1, user.getUsername());
        pstmt.setString(2, user.getUsergender());
        pstmt.setString(3, user.getUsernumber());
        pstmt.setString(4, user.getUserpassword());
        int success = pstmt.executeUpdate();
        conn.close();
        pstmt.close();
        return success;
    }
}
