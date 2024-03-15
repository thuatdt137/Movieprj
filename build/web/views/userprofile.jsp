<%-- 
    Document   : userprofile
    Created on : Mar 14, 2024, 3:22:53 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <!-- userprofile14:04-->
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
                                    <li><a href="movielist.html">Movie list</a></li>
                                    <li><a href="moviesingle.html">Movie single</a></li>
                                    <li class="it-last"><a href="seriessingle.html">Series single</a></li>
                                </ul>
                            </li>
                            <li class="dropdown first">
                                <a class="btn btn-default dropdown-toggle lv1" data-toggle="dropdown" data-hover="dropdown">
                                    celebrities <i class="fa fa-angle-down" aria-hidden="true"></i>
                                </a>
                                <ul class="dropdown-menu level1">
                                    <li><a href="celebritygrid01.html">celebrity grid 01</a></li>
                                    <li><a href="celebritygrid02.html">celebrity grid 02 </a></li>
                                    <li><a href="celebritylist.html">celebrity list</a></li>
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
                            <li class="loginservlet"><a href="login">LOG In</a></li>
                            <li class="btn registerservlet"><a href="register">sign up</a></li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>

                <!-- top search form -->
                <div class="top-search">
                    <select>
                        <option value="united">TV show</option>
                        <option value="saab">Others</option>
                    </select>
                    <input type="text" placeholder="Search for a movie, TV Show or celebrity that you are looking for">
                </div>
            </div>
        </header>
        <!-- END | Header -->

        <div class="hero user-hero">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="hero-ct">
                            <h1>${user.name}’s profile</h1>
                            <ul class="breadcumb">
                                <li class="active"><a href="#">Home</a></li>
                                <li> <span class="ion-ios-arrow-right"></span>Profile</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="page-single">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="user-information">
                            <div class="user-img">
                                <a href="#"><img src="images/uploads/user-img.png" alt=""><br></a>
                                <a href="#" class="redbtn">Change avatar</a>
                            </div>
                            <div class="user-fav">
                                <p>Account Details</p>
                                <ul>
                                    <li  class="active"><a href="userprofile?action=userprofile">Profile</a></li>
                                    <li><a href="userprofile?user=2&action=favoritemovie">Favorite movies</a></li>
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
                        <div class="form-style-1 user-pro" action="#">
                            <form action="userprofile" method="post" class="user">
                                <h4>01. Profile details</h4>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                        <label>Username</label>
                                        <input name="username" type="text" placeholder="${user.username}">
                                    </div>
                                    <div class="col-md-6 form-it">
                                        <label>Email Address</label>
                                        <input name="email" type="text" placeholder="${user.email}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                        <label>Name</label>
                                        <input name="name" type="text" placeholder="${user.name}">
                                    </div>
                                    <div class="col-md-6 form-it">
                                        <label>ID</label>
                                        <input type="text" placeholder="${user.id}">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                        <label>Old Password</label>
                                        <input class="old_password" name="oldpassword" type="text" placeholder="***********">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                        <label>New Password</label>
                                        <input class="new_password" name="newpassword" type="password" placeholder="***************">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 form-it">
                                        <label>Confirm New Password</label>
                                        <input class="confirm_password" type="password" placeholder="*************** ">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2" style="">
                                        <button class="button submit hehe" type="submit">Change</button>
                                    </div>
                                </div>
                            </form>
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

    <style>
        .hehe {
            font-family: 'Dosis', sans-serif;
            font-size: 14px;
            color: #ffffff;
            font-weight: bold;
            text-transform: uppercase;
            background: #dd003f;
            width: 100%;
            height: 40px;
            border-radius: 50px !important;
            border: none;
        }
    </style>
    <script>
        document.querySelector('.button').onclick = function () {
            var password = document.querySelector('.new_password').value,
                    confirmPassword = document.querySelector('.confirm_password').value;
            if (password === "") {
                alert("Field cannot be empty.");
            } else if (password !== confirmPassword) {
                alert("Password didn't match try again.");
                return false;
            }
        };
    </script>
</html>