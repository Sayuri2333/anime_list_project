<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/23
  Time: 19:42
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
<div class="container-fluid">
    <div class="row no-gutter">
        <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
        <div class="col-md-8 col-lg-6">
            <div class="login d-flex align-items-center py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-9 col-lg-8 mx-auto">
                            <h3 class="login-heading mb-4">Sign up</h3>
                            <form id="loginForm" action="/sign_up">
                                <div class="form-label-group" id="usernameDiv">
                                    <input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" required autofocus>
                                    <label for="inputUsername">Username</label>
                                    <div class="text-hide text-center" id="usernameMsg"><span class="glyphicon glyphicon-exclamation-sign"></span>Username has been used.</div>
                                </div>

                                <div class="form-label-group" id="pwdDiv">
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                                    <label for="inputPassword">Password</label>
                                </div>

                                <div class="form-label-group" id="pwdCheckDiv">
                                    <input type="password" id="inputPassword_check" class="form-control" placeholder="Password" required>
                                    <label for="inputPassword">Password</label>
                                    <div class="text-hide text-center" id="pwdMsg"><span class="glyphicon glyphicon-exclamation-sign"></span>Password doesn't match.</div>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" id="btn_signup" type="button">Sign up</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $("#btn_signup").click(function () {
        var username = $("#inputUsername").val();
        var pwd = $("#inputPassword").val();
        var pwd_check = $("#inputPassword_check").val();
        $.get('/username_check', {username: username},
            function(e){
                e = JSON.parse(e);
                if(e.uncheck){
                    $("#usernameDiv").addClass("has-error");
                    $("#usernameMsg").removeClass("text-hide");
                }else if (e.checked){
                    $("#usernameMsg").addClass("text-hide");
                    if (pwd == pwd_check){
                        $("#loginForm").submit();
                    }else {
                        $("#pwdCheckDiv").addClass("has_error");
                        $("#pwdMsg").removeClass("text-hide");
                    }
                }
            }
        )
    })
</script>

</body>
</html>

