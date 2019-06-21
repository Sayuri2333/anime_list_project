<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/3
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="bean.Anime" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>动画搜索</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <!-- 引入组件库 -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</head>
<body>
<jsp:useBean id="anime" class="bean.Anime" scope="page" />
<%
    if(session.getAttribute("animelist") != null){
%>

<p>anime that you are searching: </p>
<div id="app">
    <c:forEach items="${sessionScope.animelist}" var="anime" >
        <%--<el-card class="box-card" shadow="hover">--%>
            <%--<div slot="header" class="clearfix">--%>
                <%--<span>${anime.title}</span>--%>
                <%--<el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button>--%>
            <%--</div>--%>
            <%--<div class="text item">--%>
                    <%--${anime.title_japanese}--%>
            <%--</div>--%>
            <%--<div class="text item">--%>
                <%--episode: ${anime.episodes}--%>
            <%--</div>--%>
            <%--<div class="text item">--%>
                <%--score: ${anime.score}--%>
            <%--</div>--%>
            <%--<div class="text item">--%>
                <%--scored_by: ${anime.score_by}--%>
            <%--</div>--%>
            <%--<div class="text item">--%>
                <%--rank: ${anime.rank}--%>
            <%--</div>--%>
        <%--</el-card>--%>
        <el-row>
            <el-card :body-style="{padding: '20px'}">
                <a href="https://myanimelist.net/anime/${anime.anime_id}">
                    <img src="https://cdn.myanimelist.net/images${anime.image_url}" class="image">
                </a>
                <div style="padding: 14px;">
                    <span>${anime.title}</span>
                    <div class="bottom clearfix">
                        <p>${anime.title_japanese}</p>
                    </div>
                </div>
            </el-card>
        </el-row>
    </c:forEach>
</div>

<%--<style>--%>
    <%--.text {--%>
        <%--font-size: 14px;--%>
    <%--}--%>

    <%--.item {--%>
        <%--margin-bottom: 18px;--%>
    <%--}--%>

    <%--.clearfix:before,--%>
    <%--.clearfix:after {--%>
        <%--display: table;--%>
        <%--content: "";--%>
    <%--}--%>
    <%--.clearfix:after {--%>
        <%--clear: both--%>
    <%--}--%>

    <%--.box-card {--%>
        <%--width: 480px;--%>
    <%--}--%>
<%--</style>--%>
<%--<script type="text/javascript">--%>
    <%--new Vue().$mount('#app')--%>
<%--</script>--%>

<%--<el-row>--%>
    <%--<el-col :span="8" v-for="(o, index) in 2" :key="o" :offset="index > 0 ? 2 : 0">--%>
        <%--<el-card :body-style="{ padding: '0px' }">--%>
            <%--<img src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png" class="image">--%>
            <%--<div style="padding: 14px;">--%>
                <%--<span>好吃的汉堡</span>--%>
                <%--<div class="bottom clearfix">--%>
                    <%--<time class="time">{{ currentDate }}</time>--%>
                    <%--<el-button type="text" class="button">操作按钮</el-button>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</el-card>--%>
    <%--</el-col>--%>
<%--</el-row>--%>


<style>

    .bottom {
        margin-top: 13px;
        line-height: 12px;
    }

    .button {
        padding: 0;
        float: right;
    }

    .image {
        width: 1.5rem;
        height: 2rem;
        display: block;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both
    }
</style>

<script type="text/javascript">
    new Vue().$mount('#app')
</script>

<%
    }else{out.print("shit!!!!!!");}
%>
</body>
</html>
