<%@ page import="bean.Anime" %><%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/4/30
  Time: 21:23
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
    request.setCharacterEncoding("utf-8");
%>

<body>
<div class="search-box" id="app" >
    <el-form :inline="true">
        <el-form-item label="anime">
            <el-input id="anime" v-model="anime" placeholder="please input anime"></el-input>
        </el-form-item>
        <el-form-item>
            <el-button id="search" v-on:click="search_anime" type="primary">search</el-button>
        </el-form-item>
    </el-form>
</div>
<script type="text/javascript">
    new Vue({
        el : '#app',
        data : {
            anime: ''
        },
        methods : {
            search_anime : function(event){
                //获取值
                var anime = this.anime;
                if(anime == ''){
                    this.$message({
                        message : 'please input anime!',
                        type : 'error'
                    })
                    return;
                }
                $.ajax({
                    url : 'search_dealing',
                    type : 'post',
                    data : {
                        anime_name: anime
                    },
                    success : function(data) {
                        var result = data.result;
                        if(result == 'true' || result == true){
                            window.location.href="http://localhost:8080/search_list.jsp";
                        }else {
                            alert("no such anime!");
                        }
                    },
                    error : function(data) {
                        alert('no such anime!');
                    },
                    dataType : 'json',
                })
            }
        }
    })
</script>
<%--<%--%>
    <%--if(request.getAttribute("animelist") != null){--%>
<%--%>--%>

<%--<div>--%>
    <%--<p>anime that you are searching: </p>--%>
    <%--<ul>--%>
        <%--<c:forEach items="${animelist}" var="anime" >--%>
            <%--<li>--%>
                <%--<a href="https://myanimelist.net/anime/${anime.anime_id}">--%>
                    <%--<img src="https://cdn.myanimelist.net/images${anime.image_url}">--%>
                <%--</a>--%>
                <%--<div class="info">--%>
                    <%--<i>${anime.type}</i>--%>
                    <a href="./show_anime?anime_id=${anime.anime_id}">
                        <h4>${anime.title}</h4>
                    </a>
                    <%--<div class="detail">--%>
                        <%--<p>${anime.title_japanese}</p>--%>
                        <%--<p>episode: ${anime.episodes}</p>--%>
                        <%--<p>score: ${anime.score}</p>--%>
                        <%--<p>scored_by: ${anime.score_by}</p>--%>
                        <%--<p>rank: ${anime.rank}</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</li>--%>
        <%--</c:forEach>--%>
    <%--</ul>--%>
<%--</div>--%>

<%--<%--%>
    <%--}else{out.print("shit!!!!!!");}--%>
<%--%>--%>
</body>
</html>