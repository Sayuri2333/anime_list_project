<%@ page import="java.net.CookieStore" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/5
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="css/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
    <script src="css/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<%
    String username = "";
    String password = "";
    String s;
    Cookie[] cookies = request.getCookies();
    for (Cookie cookie: cookies){
        s = cookie.getName();
        if (s.equals("username")){
            if (cookie.getValue() != null){
                username = username + cookie.getValue();
            }
        }else if (s.equals("password")){
            if (cookie.getValue() != null){
                password = password + cookie.getValue();
            }
        }
    }
%>
<div class="container-fluid">
    <div class="row no-gutter">
        <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
        <div class="col-md-8 col-lg-6">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">Login</h3>
                            <form id="loginForm" action="/success_login">
                                <div class="form-label-group" id="accountDiv">
                                    <input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" value="<%= username%>" required autofocus>
                                    <label for="inputUsername">Username</label>
                                    <div class="text-hide text-center" id="accountMsg"><span class="glyphicon glyphicon-exclamation-sign"></span>Wrong username.</div>
                                </div>

                                <div class="form-label-group" id="pwdDiv">
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" value="<%= password%>" required>
                                    <label for="inputPassword">Password</label>
                                    <div class="text-hide text-center" id="pwdMsg"><span class="glyphicon glyphicon-exclamation-sign"></span>Wrong password.</div>
                                </div>

                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1" name="rememberPassword">
                                    <label class="custom-control-label" for="customCheck1">Remember password</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" id="btn_login" type="button">Sign in</button>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" id="btn_signup" type="button">Sign up</button>
                                <div class="text-center">
                                    <a class="small" href="edit_password">Forgot password?</a></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btn_login").click(function () {
        var accountNo = $("#inputUsername").val();
        var pwd = $("#inputPassword").val();
        $.get('/anime_login', { username: accountNo, password: pwd },
            function(e){
                e = JSON.parse(e);
                if(e.accountMsg){
                    $("#accountDiv").addClass("has-error");
                    $("#accountMsg").removeClass("text-hide");
                }else if (e.pwdMsg){
                    $("#pwdDiv").addClass("has-error");
                    $("#pwdMsg").removeClass("text-hide");
                }else if (e.user){
                    $("#loginForm").submit();
                }
            }
        )
    })

    $("#btn_signup").click(function() {
        window.location.replace("http://localhost:8080/sign_up.jsp")
    })
</script>

</body>
</html>
