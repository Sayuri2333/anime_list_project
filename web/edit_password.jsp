<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/24
  Time: 7:19
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
                            <h3 class="login-heading mb-4">Forget Password</h3>
                            <form id="loginForm" action="/edit_password">
                                <div class="form-label-group" id="accountDiv">
                                    <input type="text" id="inputUsername" class="form-control" placeholder="Username" name="username" required autofocus>
                                    <label for="inputUsername">Username</label>
                                </div>

                                <div class="form-label-group" id="pwdDiv">
                                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" name="password" required>
                                    <label for="inputPassword">Password</label>
                                </div>
                                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" id="btn_update" type="button">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#btn_update").click(function () {
        $("#loginForm").submit();
    })
</script>

</body>
</html>
