<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/1
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.Anime" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <script type="text/javascript" src="js/echarts/dist/echarts.common.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div>
    <a href="https://myanimelist.net/anime/${anime.anime_id}">
        <img src="https://cdn.myanimelist.net/images${anime.image_url}">
    </a>
    <i>${anime.type}</i>
    <a href="./show_anime?anime_id=${anime.anime_id}">
        <h1>${anime.title}</h1>
    </a>
    <div class="detail">
        <p>${anime.title_japanese}</p>
        <p>episode: ${anime.episodes}</p>
        <p>score: ${anime.score}</p>
        <p>scored_by: ${anime.score_by}</p>
        <p>rank: ${anime.rank}</p>
        <p>source: ${anime.source}</p>
        <p>aired time: ${anime.aired_string}</p>
        <p>popularity: ${anime.popularity}</p>
        <p>studio: ${anime.studio}</p>
        <P>duration: ${anime.duration}</P>
        <p>genre: ${anime.genre}</p>
    </div>
</div>
<div id="main" style="width: 600px; height: 400px;"></div>
<div>
    <p>animes that you may like: </p>
    <ul>
        <c:forEach items="${animes}" var="ani" >
            <li>
                <a href="https://myanimelist.net/anime/${ani.anime_id}">
                    <img src="https://cdn.myanimelist.net/images${ani.image_url}">
                </a>
                <div class="info">
                    <i>${ani.type}</i>
                    <a href="./show_anime?anime_id=${ani.anime_id}">
                        <h4>${ani.title}</h4>
                    </a>
                    <div class="detail">
                        <p>${ani.title_japanese}</p>
                        <p>episode: ${ani.episodes}</p>
                        <p>score: ${ani.score}</p>
                        <p>scored_by: ${ani.score_by}</p>
                        <p>rank: ${ani.rank}</p>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>

<script type="text/javascript">
    var mychart = echarts.init(document.getElementById('main'));
    var url = 'http://localhost:8080/animeAverage?anime_id=${anime.anime_id}';
    $.getJSON(url).done(function(json){
        times = json.times;
        score = json.score;
        min = json.min;
        max = json.max;
        alert('shit!!!!!!!!')
        var option = {
            title:{
                text: '平均分变化趋势'
            },
            tooltip: {
              trigger: 'axis',
              axisPointer: {
                  type: 'cross',
                  label: {
                      backgroundColor: '#6a7985'
                  }
              }
            },
            legend: {
                data: ['年度平均分', '最低分人数', '最高分人数']
            },
            xAxis: {
                type:'category',
                data: times
            },
            yAxis: [{
                name: '分数',
                type: 'value',
            }, {
                name: '打分人数',
                type: 'value',
            }],
            series: [{
                name: '年度平均分',
                data: score,
                type: 'line',
                smooth: true,
                yAxisIndex: 0
            }, {
                name: '最低分人数',
                data: min,
                type: 'line',
                smooth: true,
                yAxisIndex: 1
            }, {
                name: '最高分人数',
                data: max,
                type: 'line',
                smooth: true,
                yAxisIndex: 1
            }]
        };
        mychart.setOption(option);
    })
</script>
</body>
</html>
