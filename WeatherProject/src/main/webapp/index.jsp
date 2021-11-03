<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>Xtreme Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- google Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
    <!--// google Icons -->
    <!-- Custom CSS -->
    <link href="assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- common CSS -->
    <link href="dist/css/common.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <mytag:topbarTag/>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <mytag:sidebarTag/>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
         <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row align-items-center">
                    <div class="col-5">
                        <h4 class="page-title">Dashboard</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!-- 
                    <div class="col-7">
                        <div class="text-right upgrade-btn">
                            <a href="https://wrappixel.com/templates/xtremeadmin/" class="btn btn-danger text-white" target="_blank">Upgrade to Pro</a>
                        </div>
                    </div>
                     -->
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <div class="row weather_wrap">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">주간 기온 그래프</h4>
                                        <h5 class="card-subtitle">A Weekly Overview</h5>
                                    </div>
                                    <div class="ml-auto d-flex no-block align-items-center">
                                        <ul class="list-inline font-12 dl m-r-15 m-b-0">
                                            <li class="list-inline-item text-info"><i class="fa fa-circle"></i>&nbsp;최고온도</li>
                                            <li class="list-inline-item text-primary"><i class="fa fa-circle"></i>&nbsp;최저온도</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- column -->
                                    <div class="col-lg-12">
                                        <div class="campaign ct-charts"></div>
                                    </div>
                                    <!-- column -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 weather_txt">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" id="address">내 위치 : <span>정보 없음</span></h4>
                                <div id="replay"><span class="material-icons" onclick="refresh()">replay</span></div>
                                <div class="feed-widget">
                                    <ul class="list-style-none feed-body m-0 p-b-20">
                                        <li class="feed-item">
                                            <div class="feed-icon bg-info"><i class="far fa-bell"></i></div> You have 4 pending tasks. <span class="ml-auto font-12 text-muted">Just Now</span></li>
                                        <li class="feed-item">
                                            <div class="feed-icon bg-success"><i class="ti-server"></i></div> Server #1 overloaded.<span class="ml-auto font-12 text-muted">2 Hours ago</span></li>
                                        <li class="feed-item">
                                            <div class="feed-icon bg-warning"><i class="ti-shopping-cart"></i></div> New order received.<span class="ml-auto font-12 text-muted">31 May</span></li>
                                        <li class="feed-item">
                                            <div class="feed-icon bg-danger"><i class="ti-user"></i></div> New user registered.<span class="ml-auto font-12 text-muted">30 May</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Sales chart -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Table -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <!-- title -->
                                <div class="d-md-flex align-items-center">
                                    <div>
                                        <h4 class="card-title">Top Selling Products</h4>
                                        <h5 class="card-subtitle">Overview of Top Selling Items</h5>
                                    </div>
                                    <div class="ml-auto">
                                        <div class="dl">
                                            <select class="custom-select">
                                                <option value="0" selected>해와 달</option>
                                                <option value="1">기온</option>
                                                <option value="2">날씨</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <!-- title -->
                            </div>
                            <div class="table-responsive">
                                <table class="table v-middle">
                                    <thead>
                                        <tr class="bg-light">
                                            <th class="border-top-0" id="th0">Date</th>
                                            <th class="border-top-0" id="th1">Sunrise</th>
                                            <th class="border-top-0" id="th2">Sunset</th>
                                            <th class="border-top-0" id="th3">Moonrise</th>
                                            <th class="border-top-0" id="th4">Moonset</th>
                                            <th class="border-top-0" id="th5">Moon_phase</th>
                                            <th class="border-top-0" id="th6">clouds</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-info text-white" id="weekday0">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date0">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise0">Single Use</td>
                                            <td id="sunset0">John Doe</td>
                                            <td id="moonrise0">angular</td>
                                            <td id="moonset0">46</td>
                                            <td id="moon_phase0">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds0">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-orange text-white" id="weekday1">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date1">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise1">Single Use</td>
                                            <td id="sunset1">John Doe</td>
                                            <td id="moonrise1">angular</td>
                                            <td id="moonset1">46</td>
                                            <td id="moon_phase1">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds1">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-success text-white" id="weekday2">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date2">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise2">Single Use</td>
                                            <td id="sunset2">John Doe</td>
                                            <td id="moonrise2">angular</td>
                                            <td id="moonset2">46</td>
                                            <td id="moon_phase2">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds2">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-purple text-white" id="weekday3">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date3">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise3">Single Use</td>
                                            <td id="sunset3">John Doe</td>
                                            <td id="moonrise3">angular</td>
                                            <td id="moonset3">46</td>
                                            <td id="moon_phase3">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds3">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-info text-white" id="weekday4">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date4">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise4">Single Use</td>
                                            <td id="sunset4">John Doe</td>
                                            <td id="moonrise4">angular</td>
                                            <td id="moonset4">46</td>
                                            <td id="moon_phase4">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds4">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-orange text-white" id="weekday5">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date5">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise5">Single Use</td>
                                            <td id="sunset5">John Doe</td>
                                            <td id="moonrise5">angular</td>
                                            <td id="moonset5">46</td>
                                            <td id="moon_phase5">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds5">$2850.06</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="m-r-10"><a class="btn btn-circle btn-purple text-white" id="weekday6">EA</a></div>
                                                    <div class="">
                                                        <h4 class="m-b-0 font-16" id="date6">Elite Admin</h4>
                                                    </div>
                                                </div>
                                            </td>
                                            <td id="sunrise6">Single Use</td>
                                            <td id="sunset6">John Doe</td>
                                            <td id="moonrise6">angular</td>
                                            <td id="moonset6">46</td>
                                            <td id="moon_phase6">356</td>
                                            <td>
                                                <h5 class="m-b-0" id="clouds6">$2850.06</h5>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Table -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Recent Comments</h4>
                                <div style="text-align:right;"> <a href="comments.do">더 보기</a></div>
                            </div>
                            <div class="comment-widgets scrollable">
                                <!-- Comment Row -->
                                <c:forEach var="v" items="${recentData}">
                                <div class="d-flex flex-row comment-row m-t-0">
                                    <div class="p-2"><img src="assets/profileImage/${v.p_user}_profile.jpg" alt="userProfileImage" width="50" class="rounded-circle" onerror="this.src='assets/profileImage/defaultImage.jpg'"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">${v.writer}</h6>
                                        <span class="m-b-15 d-block">${v.content}</span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">${v.pdate}</span> 
                                            <span class="label label-success label-rounded">Approved</span>
                                            <span class="action-icons active">
                                                <a href="javascript:void(0)"><i class="ti-pencil-alt"></i></a>
                                                <a href="javascript:void(0)"><i class="icon-close"></i></a>
                                                <a href="javascript:void(0)"><i class="ti-heart text-danger"></i></a>     
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- Comment Row 
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/images/users/4.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text active w-100">
                                        <h6 class="font-medium">Michael Jorden</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
                                        <div class="comment-footer ">
                                            <span class="text-muted float-right">April 14, 2016</span>
                                            <span class="label label-rounded label-primary">Pending</span>
                                            <span class="action-icons active">
                                                    <a href="javascript:void(0)"><i class="ti-pencil-alt"></i></a>
                                                    <a href="javascript:void(0)"><i class="icon-close"></i></a>
                                                    <a href="javascript:void(0)"><i class="ti-heart text-danger"></i></a>    
                                                </span>
                                        </div>
                                    </div>
                                </div>
                                -->
                                <!-- Comment Row 
                                <div class="d-flex flex-row comment-row">
                                    <div class="p-2"><img src="assets/images/users/5.jpg" alt="user" width="50" class="rounded-circle"></div>
                                    <div class="comment-text w-100">
                                        <h6 class="font-medium">Johnathan Doeting</h6>
                                        <span class="m-b-15 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry. </span>
                                        <div class="comment-footer">
                                            <span class="text-muted float-right">April 14, 2016</span>
                                            <span class="label label-rounded label-danger">Rejected</span>
                                            <span class="action-icons">
                                                    <a href="javascript:void(0)"><i class="ti-pencil-alt"></i></a>
                                                    <a href="javascript:void(0)"><i class="ti-check"></i></a>
                                                    <a href="javascript:void(0)"><i class="ti-heart"></i></a>    
                                                </span>
                                        </div>
                                    </div>
                                </div>
                                -->
                            </div>
                        </div>
                    </div>
                    
                    <!--  <i class="wi wi-day-showers"></i>-->
                    <!-- column -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">현재 날씨 정보</h4>
                                <div class="d-flex align-items-center flex-row m-t-30">
                                    <div class="display-5 text-info"><img src="" id="currentIcon"> <span id="currentTemp">73<sup>°</sup></span></div>
                                    <div class="m-l-10" id="weatherInfo">
                                        <h3 class="m-b-0" id="currentWeek">Saturday</h3><small id="currentTime">Ahmedabad, India</small>
                                    </div>
                                </div>
                                <table class="table no-border mini-table m-t-20">
                                    <tbody>
                                        <tr>
                                            <td class="text-muted">WindSpeed</td>
                                            <td class="font-medium" id="currentWind">ESE 17 mph</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Humidity</td>
                                            <td class="font-medium" id="currentHumidity">83%</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Pressure</td>
                                            <td class="font-medium" id="currentPressure">28.56 in</td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted">Cloud Cover</td>
                                            <td class="font-medium" id="currentCloud">78%</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- 
                                <i class="wi wi-day-sunny">
                                <i class="wi wi-day-cloudy"></i>
                                <i class="wi wi-day-hail"></i>
                                <i class="wi wi-day-sprinkle"></i>
                                 -->
                                
                                <ul class="row list-style-none text-center m-t-30">
                                    <li class="col-3">
                                        <h4 class="text-info"><img src="" id="hourlyImg1"></h4>
                                        <span class="d-block text-muted" id="hourly1">09:30</span>
                                        <h3 class="m-t-5" id="hourlyTemp1">70<sup>°</sup></h3>
                                    </li>
                                    <li class="col-3">
                                        <h4 class="text-info"><img src="" id="hourlyImg3"></h4>
                                        <span class="d-block text-muted" id="hourly3">11:30</span>
                                        <h3 class="m-t-5" id="hourlyTemp3">72<sup>°</sup></h3>
                                    </li>
                                    <li class="col-3">
                                        <h4 class="text-info"><img src="" id="hourlyImg5"></h4>
                                        <span class="d-block text-muted" id="hourly5">13:30</span>
                                        <h3 class="m-t-5" id="hourlyTemp5">75<sup>°</sup></h3>
                                    </li>
                                    <li class="col-3">
                                        <h4 class="text-info"><img src="" id="hourlyImg7"></h4>
                                        <span class="d-block text-muted" id="hourly7">15:30</span>
                                        <h3 class="m-t-5" id="hourlyTemp7">76<sup>°</sup></h3>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- Recent comment and chats -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer text-center">
                All Rights Reserved by Xtreme Admin. Designed and Developed by <a href="https://wrappixel.com">WrapPixel</a>.
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="dist/js/app-style-switcher.js"></script>
    <!--Wave Effects -->
    <script src="dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="dist/js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="dist/js/common.js"></script>
    <script src="assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="dist/js/pages/dashboards/dashboard1.js"></script>
</body>

</html>