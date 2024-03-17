<%-- 
    Document   : userfavoritemovie
    Created on : Mar 14, 2024, 4:31:46 AM
    Author     : thuat
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <!-- userfavoritelist13:49-->
    <head>
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

        <!--preloading-->
        <div id="preloader">
            <img class="logo" src="images/logo1.png" alt="" width="119" height="58">
            <div id="status">
                <span></span>
                <span></span>
            </div>
        </div>
        <!--end of preloading-->
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

        <div class="hero user-hero">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="hero-ct">
                            <h1>Edward kennedy’s profile</h1>
                            <ul class="breadcumb">
                                <li class="active"><a href="#">Home</a></li>
                                <li class="active"> <span class="ion-ios-arrow-right"></span><a href="userprofile">Profile</a></li>
                                <li> <span class="ion-ios-arrow-right"></span>Favorite movies</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-single userfav_list">
            <div class="container">
                <div class="row ipad-width2">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="user-information">
                            <div class="user-img">
                                <a href="#"><img src="images/uploads/user-img.png" alt=""><br></a>
                                <a href="#" class="redbtn">Change avatar</a>
                            </div>
                            <div class="user-fav">
                                <p>Account Details</p>
                                <ul>
                                    <li><a href="userprofile?action=userprofile">Profile</a></li>
                                    <li class="active"><a href="userprofile?action=favoritemovie">Favorite movies</a></li>
                                    <li><a href="userrate.html">Rated movies</a></li>
                                </ul>
                            </div>
                            <div class="user-fav">
                                <p>Others</p>
                                <ul>
                                    <li><a href="#">Change password</a></li>
                                    <li><a href="#">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="flex-wrap-movielist user-fav-list">
                            <c:forEach items="${movies}" var="movie">
                                <div class="movie-item-style-2">
                                    <img src="${urlImg}/${movie.img}" alt="" style="width: 260px; height: 370px;">
                                    <div class="mv-item-infor">
                                        <h6><a href="moviedetail?movie=${movie.id}">${movie.title}  <span>(${movie.date})</span></a></h6>
                                        <p class="rate"><i class="ion-android-star"></i><span>${movie.rate}</span> /5</p>
                                        <p class="describe">${movie.descript}...</p>
                                        <p class="run-time">Release: ${movie.date}</p>
                                        <p>Stars:
                                            <c:forEach items="${movie.actor}" var="actor">
                                                <a href="actordetail?actor=${actor.id}">${actor.name}</a>
                                            </c:forEach></p>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>		
                        <div class="topbar-filter">
                            <label>Showing <b>${movies.size()}</b> out of <b>${num}</b> entries</label>

                            <div class="pagination2">
                                <c:set var="c" value="1"></c:set>
                                <c:forEach begin="1" end="${endPage}" var ="i">
                                    <c:choose>
                                        <c:when test="${currPage eq i}">
                                            <a id="${i}" href="userprofile?user=2&action=favoritemovie&index=${i}" class="page-link active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a id="${i}" href="userprofile?user=2&action=favoritemovie&index=${i}" class="page-link">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
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
                        <p>5th Avenue st, manhattan<br>
                            New York, NY 10001</p>
                        <p>Call us: <a href="#">(+01) 202 342 6789</a></p>
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

    <!-- userfavoritelist14:04-->
</html>