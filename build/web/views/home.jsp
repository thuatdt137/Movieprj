<%-- 
    Document   : home
    Created on : Mar 3, 2024, 2:27:10 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">


    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!-- Basic need -->
        <title>Open Pediatrics</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link rel="profile" href="#">

        <!--Google Font-->
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
        <!-- Mobile specific meta -->
        <meta name=viewport content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone-no">

        <!-- CSS files -->
        <link rel="stylesheet" href="css/plugins.css">
        <link rel="stylesheet" href="css/style.css">
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                document.getElementById('searchForm').addEventListener('submit', function (e) {
                    e.preventDefault(); // Ngăn chặn hành động mặc định của form
                    var form = e.target;
                    var selectValue = form.querySelector('#searchType').value; // Lấy giá trị của select
                    var inputText = form.querySelector('input[type="text"]').value;

                    // Thay đổi action của form dựa trên giá trị của select
                    if (selectValue === 'movie') {
                        form.action = 'movielist';
                    } else if (selectValue === 'actor') {
                        form.action = 'actorlist';
                    }

                    // Gửi form đi với action đã thay đổi
                    form.submit();
                });
            });
        </script>
    </head>
    <body>

        <!-- BEGIN | Header -->
        <header class="ht-header">
            <div class="container">
                <nav class="navbar navbar-default navbar-custom">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header logo">
                        <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <div id="nav-icon1">
                                <span></span>
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <a href="homepage"><img class="logo" src="images/logo1.png" alt="" width="119" height="58"></a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav flex-child-menu menu-left">
                            <li class="hidden">
                                <a href="#page-top"></a>
                            </li>
                            <li class="dropdown first">
                                <a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
                                    movies<i class="fa fa-angle-down" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu level1">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" >Movie grid<i class="ion-ios-arrow-forward"></i></a>
                                        <ul class="dropdown-menu level2">
                                            <li><a href="moviegrid.html">Movie grid</a></li>
                                            <li><a href="moviegridfw.html">movie grid full width</a></li>
                                        </ul>
                                    </li>			
                                    <li><a href="movielist">Movie list</a></li>
                                </ul>
                            </li>
                            <li class="dropdown first">
                                <a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
                                    celebrities <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu level1">
                                    <li><a href="actorlist">celebrity list</a></li>
                                    <li class="it-last"><a href="celebritysingle.html">celebrity single</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav flex-child-menu menu-right">
                            <li class="dropdown first">
                                <a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
                                    pages <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu level1">
                                    <li><a href="landing.html">Landing</a></li>
                                    <li><a href="404.html">404 Page</a></li>
                                    <li class="it-last"><a href="comingsoon.html">Coming soon</a></li>
                                </ul>
                            </li>                
                            <li><a href="#">Help</a></li>
                                <c:choose>
                                    <c:when test="${empty sessionScope.us}">
                                    <li class="loginservlet"><a href="login">LOG In</a></li>
                                    <li class="btn registerservlet"><a href="register">sign up</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${sessionScope.role eq 0}">
                                        <li><a href="manageuser">Manager</a></li>
                                        </c:if>
                                    <li class="logoutservlet"><a href="logout">Log OUT</a></li>
                                    <li class="btn"><a href="userprofile">${sessionScope.us}</a></li>
                                    </c:otherwise>
                                </c:choose>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>

                <!-- top search form -->
                <form class="top-search" action="" method="get" id="searchForm">
                    <select id="searchType">
                        <option value="movie">Movie</option>
                        <option value="actor">Actor</option>
                    </select>
                    <input name="title" type="text" placeholder="Search for a movie, actor that you are looking for">
                    <button type="submit" style="display:none"></button>
                </form>
            </div>
        </header>
        <!-- END | Header -->

        <div class="slider movie-items">
            <div class="container">
                <div class="row">
                    <div class="social-link">
                        <p>Follow us: </p>
                        <a href="#"><i class="ion-social-facebook"></i></a>
                        <a href="#"><i class="ion-social-twitter"></i></a>
                        <a href="#"><i class="ion-social-googleplus"></i></a>
                        <a href="#"><i class="ion-social-youtube"></i></a>
                    </div>
                    <div  class="slick-multiItemSlider">

                        <c:forEach items="${movies_new}" var="movie_new">
                            <div class="movie-item">
                                <div class="mv-img">
                                    <a href="moviedetail?movie=${movie_new.id}"><img src="${urlImg}/${movie_new.img}" alt="" style="width: 285px; height: 437px"></a>
                                </div>
                                <div class="title-in">
                                    <div class="cate">
                                        <c:forEach items="${movie_new.genre}" var="genre_1">
                                            <span class="blue"><a href="movielist?genre_movie=${genre_1.name}">${genre_1.name}</a></span>
                                            </c:forEach>
                                    </div>
                                    <h6><a href="moviedetail?movie=${movie_new.id}">${movie_new.title}</a></h6>
                                    <p><i class="ion-android-star"></i><span>${movie_new.rate}</span> /5</p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="movie-items">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <c:forEach items="${genres_list}" var="genre_list">
                            <div class="title-hd">
                                <h2>${genre_list.name}</h2>
                                <a href="movielist?genre_movie=${genre_list.name}" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                            </div>
                            <div class="tabs">
                                <ul class="tab-links">
                                    <li class="active"><a href="#tab1-h${genre_list.id}">#Top rated</a></li>
                                    <li><a href="#tab2-h${genre_list.id}"> #Coming soon</a></li>
                                    <li><a href="#tab3-h${genre_list.id}">  #New movie  </a></li>                   
                                </ul>
                                <div class="tab-content">
                                    <div id="tab1-h${genre_list.id}" class="tab active">
                                        <div class="row">
                                            <div class="slick-multiItem2">
                                                <c:forEach items="${movies_rate}" var="movie_rate">
                                                    <c:forEach items="${movie_rate.genre}" var="movie_rate_genre">
                                                        <c:if test="${movie_rate_genre.name eq genre_list.name}">
                                                            <div class="slide-it">
                                                                <div class="movie-item">
                                                                    <div class="mv-img">
                                                                        <img src="${urlImg}/${movie_rate.img}" alt="" style="width: 163px; height: 250px">
                                                                    </div>
                                                                    <div class="hvr-inner">
                                                                        <a  href="moviedetail?movie=${movie_rate.id}"> Watch <i class="ion-android-arrow-dropright"></i> </a>
                                                                    </div>
                                                                    <div class="title-in">
                                                                        <h6><a href="#">${movie_rate.title}</a></h6>
                                                                        <p><i class="ion-android-star"></i><span>${movie_rate.rate}</span> /5</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab2-h${genre_list.id}" class="tab">
                                        <div class="row">
                                            <div class="slick-multiItem2">
                                                <c:forEach items="${movies_cms}" var="movie_cms">
                                                    <c:forEach items="${movie_cms.genre}" var="movie_cms_genre">
                                                        <c:if test="${movie_cms_genre.name eq genre_list.name}">
                                                            <div class="slide-it">
                                                                <div class="movie-item">
                                                                    <div class="mv-img">
                                                                        <img src="${urlImg}/${movie_cms.img}" alt="" style="width: 163px; height: 250px">
                                                                    </div>
                                                                    <div class="hvr-inner">
                                                                        <a  href="moviedetail?movie=${movie_cms.id}"> Watch <i class="ion-android-arrow-dropright"></i> </a>
                                                                    </div>
                                                                    <div class="title-in">
                                                                        <h6><a href="#">${movie_cms.title}</a></h6>
                                                                        <p><i class="ion-android-star"></i><span>${movie_cms.rate}</span> /5</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="tab3-h${genre_list.id}" class="tab">
                                        <div class="row">
                                            <div class="slick-multiItem2">
                                                <c:forEach items="${movies_new}" var="movie_new">
                                                    <c:forEach items="${movie_new.genre}" var="movie_new_genre">
                                                        <c:if test="${movie_new_genre.name eq genre_list.name}">
                                                            <div class="slide-it">
                                                                <div class="movie-item">
                                                                    <div class="mv-img">
                                                                        <img src="${urlImg}/${movie_new.img}" alt="" style="width: 163px; height: 250px">
                                                                    </div>
                                                                    <div class="hvr-inner">
                                                                        <a  href="moviedetail?movie=${movie_new.id}"> Watch <i class="ion-android-arrow-dropright"></i> </a>
                                                                    </div>
                                                                    <div class="title-in">
                                                                        <h6><a href="#">${movie_new.title}</a></h6>
                                                                        <p><i class="ion-android-star"></i><span>${movie_new.rate}</span> /5</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="trailers">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-12">
                        <div class="title-hd">
                            <h2>in theater</h2>
                            <a href="#" class="viewall">View all <i class="ion-ios-arrow-right"></i></a>
                        </div>
                        <div class="videos">
                            <div class="slider-for-2 video-ft">
                                <c:forEach items="${movies_cms}" var="movie_cms">
                                    <div>
                                        <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/${movie_cms.trail}"></iframe>
                                    </div>
                                </c:forEach>

                            </div>  
                            <div class="slider-nav-2 thumb-ft">
                                <c:forEach items="${movies_cms}" var="movie_cms">
                                    <div class="item">
                                        <div class="trailer-img">
                                            <img src="images/uploads/trailer7.jpg"  alt="photo by Barn Images" width="4096" height="2737">
                                        </div>
                                        <div class="trailer-infor">
                                            <h4 class="desc">${movie_cms.title}</h4>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </div>
        <!-- footer section-->
        <footer class="ht-footer">
            <div class="container">
                <div class="flex-parent-ft">
                    <div class="flex-child-ft item1">
                        <a href="index-2.html"><img class="logo" src="images/logo1.png" alt=""></a>
                        <p>Thon 3, Thach Hoa, Hanh Tinh HOLA<br>
                            HA NOI, Viet Nam 11313</p>
                        <p>Call us: <a href="#">(+84) 012 345 6789</a></p>
                    </div>
                    <div class="flex-child-ft item2">
                        <h4>Resources</h4>
                        <ul>
                            <li><a href="#">About</a></li> 
                            <li><a href="#">Blockbuster</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Forums</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Help Center</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item3">
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms of Use</a></li> 
                            <li><a href="#">Privacy Policy</a></li>	
                            <li><a href="#">Security</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item4">
                        <h4>Account</h4>
                        <ul>
                            <li><a href="#">My Account</a></li> 
                            <li><a href="#">Watchlist</a></li>	
                            <li><a href="#">Collections</a></li>
                            <li><a href="#">User Guide</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item5">
                        <h4>Newsletter</h4>
                        <p>Subscribe to our newsletter system now <br> to get latest news from us.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your email...">
                        </form>
                        <a href="#" class="btn">Subscribe now <i class="ion-ios-arrow-forward"></i></a>
                    </div>
                </div>
            </div>
            <div class="ft-copyright">
                <div class="ft-left">
                    <p><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></p>
                </div>
                <div class="backtotop">
                    <p><a href="#" id="back-to-top">Back to top  <i class="ion-ios-arrow-thin-up"></i></a></p>
                </div>
            </div>
        </footer>
        <!-- end of footer section-->

        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/plugins2.js"></script>
        <script src="js/custom.js"></script>
    </body>


</html>


