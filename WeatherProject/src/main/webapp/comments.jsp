<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <!-- google Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
    <!--// google Icons -->
    <title>Xtreme Admin Template - The Ultimate Multipurpose admin template</title>
    <!-- Custom CSS -->
    <link href="dist/css/style.min.css" rel="stylesheet">
    <!-- common.css -->
    <link href="dist/css/common.css" rel="stylesheet">
    <!--// common.css -->
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
                        <h4 class="page-title">Starter Page</h4>
                        <div class="d-flex align-items-center">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Library</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <div class="col-7">
                        <div class="text-right upgrade-btn">
                            <a href="https://wrappixel.com/templates/xtremeadmin/" class="btn btn-danger text-white" target="_blank">Upgrade to Pro</a>
                        </div>
                    </div>
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
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                  <!-- write form -->
	              <form class="write_container">
		               <span class="user"></span>
		                <textarea placeholder="방명록을 작성하세요."></textarea> 
		                <input type="submit" class="btn write_btn" id="write_btn" value="작성하기">
		          </form>
                <!-- //write form -->
                
                <div class="row">
                    <div class="col-12">
                       
                          <!--div class="card-body">
                              This is some text within a card block.
                          </div-->
                          <div class="guestBook_wrap">
                             <c:forEach var="v" items="${pData}">
                             <div class="guestBook">
                               <div class="guest_profile"><img src="assets/profileImage/${v.p_user}_profile.jpg" alt="userProfileImage" /></div>
                               <div class="guest_contents">  
                                  <h3 class="guest_id">${v.writer}</h3>
                                  <div class="guest_txt">${v.content}</div>
                                  <p class="date">${v.pdate}</p>
                               </div>
                               <span class="good_icon material-icons">thumb_up_off_alt</span>
                             </div>
                             </c:forEach>
                             
                             <!-- <div class="guestBook">
                               <div class="guest_profile"></div>
                               <div class="guest_contents">  
                                  <h3 class="guest_id">오현택12</h3>
                                  <div class="guest_txt">방명록 내용 들어가는 위치방명록 내용 들어가는 위치방명록 내용 들어가는 위치방명록 내용 들어가는 위치방명록 내용 들어가는 위치</div>
                                  <p class="date">2021.10.23</p>
                               </div>
                               <span class="good_icon material-icons">thumb_up_off_alt</span>

                             </div>
                             <div class="guestBook">
                               <div class="guest_profile"><img src="assets/images/users/2.jpg" alt="user" /></div>
                               <div class="guest_contents">  
                                  <h3 class="guest_id">오현택12</h3>
                                  <div class="guest_txt">방명록 내용 들어가는 위치</div>
                                  <p class="date">2021.10.23</p>
                               </div>
                               <span class="good_icon material-icons">thumb_up_off_alt</span>
                             </div>
                             <div class="guestBook">
                               <div class="guest_profile"></div>
                               <div class="guest_contents">  
                                  <h3 class="guest_id">오현택12</h3>
                                  <div class="guest_txt">방명록 내용 들어가는 위치</div>
                                  <p class="date">2021.10.23</p>
                               </div>
                               <span class="good_icon material-icons">thumb_up_off_alt</span>
                             </div>
                             <div class="guestBook">
                               <div class="guest_profile"></div>
                               <div class="guest_contents">  
                                  <h3 class="guest_id">오현택12</h3>
                                  <div class="guest_txt">방명록 내용 들어가는 위치</div>
                                  <p class="date">2021.10.23</p>
                               </div>
                               <span class="good_icon material-icons">thumb_up_off_alt</span>
                             </div> -->
                          </div>
                        
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
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
</body>

</html>