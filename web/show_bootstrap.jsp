<%--
  Created by IntelliJ IDEA.
  User: HASEE
  Date: 2019/5/3
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Anime info - ${anime.title}</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/resume.min.css" rel="stylesheet">
    <link href="css/landing-page.min.css" rel="stylesheet">

    <script type="text/javascript" src="js/echarts/dist/echarts.common.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%--<jsp:useBean id="anime" class="bean.Anime" scope="page" />--%>
</head>

<body id="page-top">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
        <span class="d-block d-lg-none">${anime.title}</span>
        <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded mx-auto mb-2" src="https://cdn.myanimelist.net/images${anime.image_url}" alt="">
      </span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#about">Name</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#information">Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#score">Score</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="#recommended">Recommended</a>
            </li>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="search_bootstrap.jsp">Back</a>
            </li>
            <%
                if (session.getAttribute("username") != null && request.getAttribute("collected") == null){
            %>
            <li class="nav-item">
                <a class="nav-link js-scroll-trigger" href="/anime_collect?anime_id=${anime.anime_id}">Collect</a>
            </li>
            <%
                }
            %>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link js-scroll-trigger" href="#awards">Awards</a>--%>
            <%--</li>--%>
        </ul>
    </div>
</nav>

<div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
        <div class="w-100">
            <h1 class="mb-0">${anime.title}</h1>
            <div class="subheading mb-5">${anime.title_japanese}
                <a href="https://myanimelist.net/anime/${anime.anime_id}">     MYANIMELIST</a>
            </div>
            <%--<p class="lead mb-5">I am experienced in leveraging agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition.</p>--%>
            <%--<div class="social-icons">--%>
                <%--<a href="#">--%>
                    <%--<i class="fab fa-linkedin-in"></i>--%>
                <%--</a>--%>
                <%--<a href="#">--%>
                    <%--<i class="fab fa-github"></i>--%>
                <%--</a>--%>
                <%--<a href="#">--%>
                    <%--<i class="fab fa-twitter"></i>--%>
                <%--</a>--%>
                <%--<a href="#">--%>
                    <%--<i class="fab fa-facebook-f"></i>--%>
                <%--</a>--%>
            <%--</div>--%>
        </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="information">
        <div class="w-100">
            <h2 class="mb-5">Information</h2>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                <div class="resume-content">
                    <h3 class="mb-0">Title Japanese</h3>
                    <%--<div class="subheading mb-3">Intelitec Solutions</div>--%>
                    <%--<p>Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.</p>--%>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">${anime.title_japanese}</span>
                </div>
            </div>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                <div class="resume-content">
                    <h3 class="mb-0">Episode</h3>
                    <%--<div class="subheading mb-3">Intelitec Solutions</div>--%>
                    <%--<p>Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.</p>--%>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">${anime.episodes}</span>
                </div>
            </div>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                <div class="resume-content">
                    <h3 class="mb-0">Score</h3>
                    <%--<div class="subheading mb-3">Shout! Media Productions</div>--%>
                    <%--<p>Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.</p>--%>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">${anime.score}</span>
                </div>
            </div>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
                <div class="resume-content">
                    <h3 class="mb-0">Score By</h3>
                    <%--<div class="subheading mb-3">Shout! Media Productions</div>--%>
                    <%--<p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>--%>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">${anime.score_by}</span>
                </div>
            </div>

            <div class="resume-item d-flex flex-column flex-md-row justify-content-between">
                <div class="resume-content">
                    <h3 class="mb-0">Rank</h3>
                    <%--<div class="subheading mb-3">Shout! Media Productions</div>--%>
                    <%--<p>Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits. Dramatically visualize customer directed convergence without revolutionary ROI.</p>--%>
                </div>
                <div class="resume-date text-md-right">
                    <span class="text-primary">${anime.rank}</span>
                </div>
            </div>

        </div>

    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="score">
        <div class="w-100">
            <h2 class="mb-5">Score</h2>

            <%--<div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">--%>
                <%--<div class="resume-content">--%>
                    <%--<h3 class="mb-0">University of Colorado Boulder</h3>--%>
                    <%--<div class="subheading mb-3">Bachelor of Science</div>--%>
                    <%--<div>Computer Science - Web Development Track</div>--%>
                    <%--<p>GPA: 3.23</p>--%>
                <%--</div>--%>
                <%--<div class="resume-date text-md-right">--%>
                    <%--<span class="text-primary">August 2006 - May 2010</span>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="resume-item d-flex flex-column flex-md-row justify-content-between">--%>
                <%--<div class="resume-content">--%>
                    <%--<h3 class="mb-0">James Buchanan High School</h3>--%>
                    <%--<div class="subheading mb-3">Technology Magnet Program</div>--%>
                    <%--<p>GPA: 3.56</p>--%>
                <%--</div>--%>
                <%--<div class="resume-date text-md-right">--%>
                    <%--<span class="text-primary">August 2002 - May 2006</span>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div id="main" style="width: 1200px; height: 600px;"></div>
            <script type="text/javascript">
                var mychart = echarts.init(document.getElementById('main'));
                var url = 'http://localhost:8080/animeAverage?anime_id=${anime.anime_id}';
                mychart.setOption({
                    title:{
                        text: 'AVERAGE CHANGED BY TIME'
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
                        data: ['AVERAGE YEARLY', 'MIN SCORE COUNT', 'MAX SCORE COUNT']
                    },
                    xAxis: {
                        type:'category',
                        // data: times
                        data: []
                    },
                    yAxis: [{
                        name: 'score',
                        type: 'value',
                    }, {
                        name: 'count',
                        type: 'value',
                    }],
                    series: [{
                        name: 'AVERAGE YEARLY',
                        // data: score,
                        data: [],
                        type: 'line',
                        smooth: true,
                        yAxisIndex: 0
                    }, {
                        name: 'MIN SCORE COUNT',
                        // data: min,
                        data: [],
                        type: 'line',
                        smooth: true,
                        yAxisIndex: 1
                    }, {
                        name: 'MAX SCORE COUNT',
                        // data: max,
                        data: [],
                        type: 'line',
                        smooth: true,
                        yAxisIndex: 1
                    }]
                });

                mychart.showLoading();

                $.getJSON(url).done(function(json){
                    mychart.hideLoading();
                    times = json.times;
                    score = json.score;
                    min = json.min;
                    max = json.max;
                    mychart.setOption({
                        xAxis: {
                            data: times
                        },
                        series: [{
                            name: 'AVERAGE YEARLY',
                            data: score
                        },{
                            name: 'MIN SCORE COUNT',
                            data: min
                        },{
                            name: 'MAX SCORE COUNT',
                            data: max
                        }]
                    })
                })
            </script>

        </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="recommended">
        <div class="w-100">
            <h2 class="mb-5">Recommended</h2>
            <div class="container">
                <div class="row">
                    <c:forEach items="${animes}" var="ani" >
                        <div class="col-lg-4">
                            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
                                    <%--<a href="https://myanimelist.net/anime/${anime.anime_id}">--%>
                                    <%--<img class="img-fluid rounded-circle mb-3" src="https://cdn.myanimelist.net/images${anime.image_url}" alt="">--%>
                                    <%--</a>--%>
                                <a href="./show_anime?anime_id=${ani.anime_id}">
                                    <h5>${ani.title}</h5>
                                </a>
                                <p class="font-weight-light mb-0">${ani.title_japanese}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

    <%--<hr class="m-0">--%>

    <%--<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="interests">--%>
        <%--<div class="w-100">--%>
            <%--<h2 class="mb-5">Interests</h2>--%>
            <%--<p>Apart from being a web developer, I enjoy most of my time being outdoors. In the winter, I am an avid skier and novice ice climber. During the warmer months here in Colorado, I enjoy mountain biking, free climbing, and kayaking.</p>--%>
            <%--<p class="mb-0">When forced indoors, I follow a number of sci-fi and fantasy genre movies and television shows, I am an aspiring chef, and I spend a large amount of my free time exploring the latest technology advancements in the front-end web development world.</p>--%>
        <%--</div>--%>
    <%--</section>--%>

    <%--<hr class="m-0">--%>

    <%--<section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="awards">--%>
        <%--<div class="w-100">--%>
            <%--<h2 class="mb-5">Awards &amp; Certifications</h2>--%>
            <%--<ul class="fa-ul mb-0">--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--Google Analytics Certified Developer</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--Mobile Web Specialist - Google Certification</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--1<sup>st</sup>--%>
                    <%--Place - University of Colorado Boulder - Emerging Tech Competition 2009</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--1<sup>st</sup>--%>
                    <%--Place - University of Colorado Boulder - Adobe Creative Jam 2008 (UI Design Category)</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--2<sup>nd</sup>--%>
                    <%--Place - University of Colorado Boulder - Emerging Tech Competition 2008</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--1<sup>st</sup>--%>
                    <%--Place - James Buchanan High School - Hackathon 2006</li>--%>
                <%--<li>--%>
                    <%--<i class="fa-li fa fa-trophy text-warning"></i>--%>
                    <%--3<sup>rd</sup>--%>
                    <%--Place - James Buchanan High School - Hackathon 2005</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</section>--%>

</div>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for this template -->
<script src="js/resume.min.js"></script>

</body>

</html>
