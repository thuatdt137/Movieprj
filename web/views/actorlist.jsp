<%-- 
    Document   : actorlist
    Created on : Mar 13, 2024, 2:44:35 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <!-- celebritylist11:56-->
    <head>
        <!-- Basic need -->
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <div class="hero common-hero">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="hero-ct">
                            <h1>celebrity listing - list</h1>
                            <ul class="breadcumb">
                                <li class="active"><a href="homepage">Home</a></li>
                                <li> <span class="ion-ios-arrow-right"></span> celebrity listing</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- celebrity list section-->
        <div class="page-single">
            <div class="container">
                <div class="row ipad-width2">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="row">
                            <c:forEach items="${listA}" var="a">
                                <div class="col-md-12">
                                    <div class="ceb-item-style-2">
                                        <img src="${urlImg}/${a.src}" alt="" height="103" width="141">
                                        <div class="ceb-infor">
                                            <h2><a href="celebritysingle.html">${a.name}</a></h2>
                                            <span>${a.birthday}</span>
                                            <p>${a.descript}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>


                        <div class="topbar-filter">
                            <label>Showing <b>${listA.size()}</b> out of <b>${num}</b> entries</label>

                            <div class="pagination2">
                                <c:set var="c" value="1"></c:set>
                                <c:forEach begin="1" end="${endPage}" var ="i">
                                    <c:choose>
                                        <c:when test="${currPage eq i}">
                                            <a id="${i}" href="actorlist?index=${i}" class="page-link active">${i}</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a id="${i}" href="actorlist?index=${i}" class="page-link">${i}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-12 col-sm-12">
                        <div class="sidebar">
                            <div class="searh-form">
                                <h4 class="sb-title">Search celebrity</h4>
                                <form class="form-style-1 celebrity-form" action="#">
                                    <div class="row">
                                        <div class="col-md-12 form-it">
                                            <label>Celebrity name</label>
                                            <input type="text" placeholder="Enter keywords">
                                        </div>
                                        <div class="col-md-12 form-it">
                                            <label>Celebrity Letter</label>
                                            <select>
                                                <option value="range">A</option>
                                                <option value="saab">B</option>
                                            </select>
                                        </div>
                                        <div class="col-md-12 form-it">
                                            <label>Category</label>
                                            <select>
                                                <option value="range">Actress</option>
                                                <option value="saab">Others</option>
                                            </select>
                                        </div>
                                        <div class="col-md-12 form-it">
                                            <label>Year of birth</label>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <select>
                                                        <option value="range">1970</option>
                                                        <option value="number">Other</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <select>
                                                        <option value="range">1990</option>
                                                        <option value="number">others</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 ">
                                            <input class="submit" type="submit" value="submit">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="ads">
                                <img src="images/uploads/ads1.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end of celebrity list section-->

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

    <!-- celebritylist12:04-->
</html>