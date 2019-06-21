<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<html>
<head>
    <title>anime_showing</title>
</head>
<body>
<%!
    public static final String DBDRIVER = "com.mysql.cj.jdbc.Driver"; // 用于连接mysql数据库的驱动
    // 连接mysql数据库,需要指定时区设置,否则会报错
    public static final String DBURL="jdbc:mysql://localhost:3306/bangumi?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    public static final String DBUSER = "root"; //指定连接的用户名和密码
    public static final String DBPASS = "root";
%>
<%
    request.setCharacterEncoding("utf-8");
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    String anime_id = null;
%>
<%
try{
    Class.forName(DBDRIVER);
    connection = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
    String select_sql = "SELECT * FROM selected_anime WHERE anime_id=?";
    preparedStatement = connection.prepareStatement(select_sql);
    preparedStatement.setString(1, request.getParameter("anime_name"));
    resultSet = preparedStatement.executeQuery();
%>
<table border="1" width="80%">
    <tr>
        <th>anime_id</th>
        <th>anime_name</th>
    </tr>
    <%
        while(resultSet.next()){
            anime_id = resultSet.getString(1);
            String title = resultSet.getString(2);
    %>
    <tr>
        <td><%=anime_id%></td> <!-- 使用表格显示数据 -->
        <td><%=title%></td>
    </tr>
    <%
        }
    %>

    <%
        }catch (Exception e){
    e.printStackTrace();
}finally {
    try{
                resultSet.close();
                preparedStatement.close();
                connection.close();
            }catch (Exception e){}
        }
    %>

<%
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
            out.print(str);
        }
%>
</body>
</html>
