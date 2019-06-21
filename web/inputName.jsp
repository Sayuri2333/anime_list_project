<%--
  Created by IntelliJ IDEA.
  User: sayuri
  Date: 2019/5/30
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="postman" method="post">
    输入名字： <input type="text" name="name"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>
