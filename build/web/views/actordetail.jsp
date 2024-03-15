<%-- 
    Document   : actordetail
    Created on : Mar 14, 2024, 2:23:42 AM
    Author     : thuat
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">

    <!-- celebritysingle12:04-->
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

        <div class="hero hero3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!-- <h1> movie listing - list</h1>
                        <ul class="breadcumb">
                                <li class="active"><a href="#">Home</a></li>
                                <li> <span class="ion-ios-arrow-right"></span> movie listing</li>
                        </ul> -->
                    </div>
                </div>
            </div>
        </div>
        <!-- celebrity single section-->

        <div class="page-single movie-single cebleb-single">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-4 col-sm-12 col-xs-12">
                        <div class="mv-ceb">
                            <img src="${urlImg2}/${actor.src}" alt="">
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-12 col-xs-12">
                        <div class="movie-single-ct">
                            <h1 class="bd-hd">${actor.name}</h1>
                            <p class="ceb-single">Actor  |  Producer</p>
                            <div class="social-link cebsingle-socail">
                                <a href="#"><i class="ion-social-facebook"></i></a>
                                <a href="#"><i class="ion-social-twitter"></i></a>
                                <a href="#"><i class="ion-social-googleplus"></i></a>
                                <a href="#"><i class="ion-social-linkedin"></i></a>
                            </div>
                            <div class="movie-tabs">
                                <div class="tabs">
                                    <ul class="tab-links tabs-mv">
                                        <li class="active"><a href="#overviewceb">Overview</a></li>
                                        <li><a href="#biography"> biography</a></li>
                                        <li><a href="#mediaceb"> Media</a></li>                  
                                    </ul>
                                    <div class="tab-content">
                                        <div id="overviewceb" class="tab active">
                                            <div class="row">
                                                <div class="col-md-8 col-sm-12 col-xs-12">
                                                    <p>${actor.descript}</p>
                                                    <p class="time"><a href="#">See full bio <i class="ion-ios-arrow-right"></i></a></p>
                                                    <div class="title-hd-sm">
                                                        <h4>Videos & Photos</h4>
                                                        <a href="#" class="time">All 5 Videos & 245 Photos <i class="ion-ios-arrow-right"></i></a>
                                                    </div>
                                                    <div class="mvsingle-item ov-item">
                                                        <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image11.jpg" ><img src="images/uploads/image1.jpg" alt=""></a>
                                                        <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image21.jpg" ><img src="images/uploads/image2.jpg" alt=""></a>
                                                        <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image31.jpg" ><img src="images/uploads/image3.jpg" alt=""></a>
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/image4.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                    </div>
                                                    <div class="title-hd-sm">
                                                        <h4>filmography</h4>
                                                        <a href="#" class="time">Full Filmography<i class="ion-ios-arrow-right"></i></a>
                                                    </div>
                                                    <!-- movie cast -->
                                                    <div class="mvcast-item">
                                                        <c:forEach items="${movies}" var="movie">
                                                            <div class="cast-it">
                                                                <div class="cast-left cebleb-film">
                                                                    <img src="${urlImg}/${movie.img}" alt="" width="55" height="77">
                                                                    <div>
                                                                        <a href="moviedetail?movie=${movie.id}">${movie.title}</a>
                                                                        <c:forEach items="${movie.genre}" var="genre">
                                                                            <p class="time">${genre.name}</p>
                                                                        </c:forEach>
                                                                    </div>
                                                                </div>
                                                                <p>${movie.date}</p>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 col-xs-12 col-sm-12">
                                                    <div class="sb-it">
                                                        <h6>Fullname:  </h6>
                                                        <p><a href="#">${actor.name}</a></p>
                                                    </div>
                                                    <div class="sb-it">
                                                        <h6>Date of Birth: </h6>
                                                        <p>${actor.birthday}</p>
                                                    </div>
                                                    <div class="ads">
                                                        <img src="images/uploads/ads1.png" alt="">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="biography" class="tab">
                                            <div class="row">
                                                <div class="rv-hd">
                                                    <div>
                                                        <h3>Biography of</h3>
                                                        <h2>Hugh Jackman</h2>
                                                    </div>							            						
                                                </div>
                                                <p>${actor.descript}</p>
                                            </div>
                                        </div>
                                        <div id="mediaceb" class="tab">
                                            <div class="row">
                                                <div class="rv-hd">
                                                    <div>
                                                        <h3>Biography of</h3>
                                                        <h2>Hugh Jackman</h2>
                                                    </div>
                                                </div>
                                                <div class="title-hd-sm">
                                                    <h4>Videos <span>(8)</span></h4>
                                                </div>
                                                <div class="mvsingle-item media-item">
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item1.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow"  href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Trailer:  Watch New Scenes</a></h6>
                                                            <p class="time"> 1: 31</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item2.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Featurette: “Avengers Re-Assembled</a></h6>
                                                            <p class="time"> 1: 03</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item3.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Interview: Robert Downey Jr</a></h6>
                                                            <p class="time"> 3:27</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item4.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Interview: Scarlett Johansson</a></h6>
                                                            <p class="time"> 3:27</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item1.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Featurette: Meet Quicksilver & The Scarlet Witch</a></h6>
                                                            <p class="time"> 1: 31</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item2.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Interview: Director Joss Whedon</a></h6>
                                                            <p class="time"> 1: 03</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item3.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Interview: Mark Ruffalo</a></h6>
                                                            <p class="time"> 3:27</p>
                                                        </div>
                                                    </div>
                                                    <div class="vd-item">
                                                        <div class="vd-it">
                                                            <img class="vd-img" src="images/uploads/vd-item4.jpg" alt="">
                                                            <a class="fancybox-media hvr-grow" href="https://www.youtube.com/embed/o-0hcF97wy0"><img src="images/uploads/play-vd.png" alt=""></a>
                                                        </div>
                                                        <div class="vd-infor">
                                                            <h6> <a href="#">Official Trailer #2</a></h6>
                                                            <p class="time"> 3:27</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="title-hd-sm">
                                                    <h4>Photos <span> (21)</span></h4>
                                                </div>
                                                <div class="mvsingle-item">
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image11.jpg" ><img src="images/uploads/image1.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery"  href="images/uploads/image21.jpg" ><img src="images/uploads/image2.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image31.jpg" ><img src="images/uploads/image3.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image41.jpg" ><img src="images/uploads/image4.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image51.jpg" ><img src="images/uploads/image5.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image61.jpg" ><img src="images/uploads/image6.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image71.jpg" ><img src="images/uploads/image7.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image81.jpg" ><img src="images/uploads/image8.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image91.jpg" ><img src="images/uploads/image9.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image101.jpg" ><img src="images/uploads/image10.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image111.jpg" ><img src="images/uploads/image1-1.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image121.jpg" ><img src="images/uploads/image12.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image131.jpg" ><img src="images/uploads/image13.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image141.jpg" ><img src="images/uploads/image14.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image151.jpg" ><img src="images/uploads/image15.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image161.jpg" ><img src="images/uploads/image16.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image171.jpg" ><img src="images/uploads/image17.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image181.jpg" ><img src="images/uploads/image18.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image191.jpg" ><img src="images/uploads/image19.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image201.jpg" ><img src="images/uploads/image20.jpg" alt=""></a>
                                                    <a class="img-lightbox"  data-fancybox-group="gallery" href="images/uploads/image211.jpg" ><img src="images/uploads/image2-1.jpg" alt=""></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- celebrity single section-->

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

<!-- celebritysingle12:18-->
</html>
