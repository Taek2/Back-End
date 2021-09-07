<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
%> 
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Xtra Blog</title>
	<link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<!--
    
TemplateMo 553 Xtra Blog

https://templatemo.com/tm-553-xtra-blog

-->
</head>
<body>
	<header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                <h1 class="text-center">Xtra Blog</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item"><a href="index.jsp" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                    <li class="tm-nav-item active"><a href="post.html" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        Single Post
                    </a></li>
                    <li class="tm-nav-item"><a href="about.html" class="tm-nav-link">
                        <i class="fas fa-users"></i>
                        About Xtra
                    </a></li>
                    <li class="tm-nav-item"><a href="contact.html" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        Contact Us
                    </a></li>
                </ul>
            </nav>
           <div class="tm-mb-65">
            	<c:if test="${memnum == null}">
                <form method="post" action="control.jsp">
					<input type="hidden" name="action" value="login">
					<input class="form-login" type="text" name="mid" id="demo-name" value="" placeholder="ID를 입력" />	
					<input class="form-login" type="password" name="mpw" id="demo-email" value="" placeholder="PW를 입력" />	
					<input class= "tm-btn tm-btn-primary tm-btn-small" type="submit" value="로그인" />
					<br>		
				</form>
				<a href="join.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">회원가입</button></a>
				</c:if>
				
				 <c:if test="${memnum!=null}">
				 <p class="tm-mb-80 pr-5 text-white">
				 	${id}님 반갑습니다!
				 	<a href="logout.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">로그아웃</button></a>
				 	<a href="mypage.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">마이페이지</button></a>
				 </p>
				 </c:if>
				
            </div>
            <p class="tm-mb-80 pr-5 text-white">
                Xtra Blog is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
            </p>
        </div>
    </header>
    <div class="container-fluid">
        <main class="tm-main">
            <!-- Search form -->
            <div class="row tm-row">
                <div class="col-12">
                    <form method="post" action="control.jsp" class="form-inline tm-mb-80 tm-search-form">                
                        <input type="hidden" name="action" value="search">
                        <input class="form-control tm-search-input" name="content" type="text" placeholder="작성자로 찾기" aria-label="Search">
                        <button class="tm-search-button" type="submit">
                            <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                        </button>                                
                    </form>
                </div>                
            </div>            
            <div class="row tm-row">
                <div class="col-12">
                    <hr class="tm-hr-primary tm-mb-55">
                    <!-- Video player 1422x800 -->
                    <video width="954" height="535" controls class="tm-mb-40">
                        <source src="video/wheat-field.mp4" type="video/mp4">							  
                        Your browser does not support the video tag.
                    </video>
                </div>
            </div>
            <div class="row tm-row">
                <div class="col-lg-8 tm-post-col">
                    <div class="tm-post-full">                    
                        <div class="mb-4">
                            <h2 class="pt-2 tm-color-primary tm-post-title">${data.title}</h2>
                            <p class="tm-mb-40">${data.wdate} posted by ${data.writer}</p>
                            <p>
                           		${data.content}     
                            </p>
                            
                            <span class="d-block text-right tm-color-primary">Creative . Design . Business</span>
                        </div>
                        
                        <!-- Comments -->
                        <div>
                            <h2 class="tm-color-primary tm-post-title">Comments</h2>
                            <hr class="tm-hr-primary tm-mb-45">
                            <div class="tm-comment tm-mb-45">
                                <figure class="tm-comment-figure">
                                    <img src="img/comment-1.jpg" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                    <figcaption class="tm-color-primary text-center">Mark Sonny</figcaption>
                                </figure>
                                <div>
                                    <p>
                                        Praesent aliquam ex vel lectus ornare tritique. Nunc et eros
                                        quis enim feugiat tincidunt et vitae dui. Nullam consectetur
                                        justo ac ex laoreet rhoncus. Nunc id leo pretium, faucibus 
                                        sapien vel, euismod turpis.
                                    </p>
                                    <div class="d-flex justify-content-between">
                                        <a href="#" class="tm-color-primary">REPLY</a>
                                        <span class="tm-color-primary">June 14, 2020</span>
                                    </div>                                                 
                                </div>                                
                            </div>
                            <div class="tm-comment-reply tm-mb-45">
                                <hr>
                                <div class="tm-comment">
                                    <figure class="tm-comment-figure">
                                        <img src="img/comment-2.jpg" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                        <figcaption class="tm-color-primary text-center">Jewel Soft</figcaption>    
                                    </figure>
                                    <p>
                                        Nunc et eros quis enim feugiat tincidunt et vitae dui.
                                        Nullam consectetur justo ac ex laoreet rhoncus. Nunc
                                        id leo pretium, faucibus sapien vel, euismod turpis.
                                    </p>
                                </div>                                
                                <span class="d-block text-right tm-color-primary">June 21, 2020</span>
                            </div>
                            <form action="" class="mb-5 tm-comment-form">
                                <h2 class="tm-color-primary tm-post-title mb-4">Your comment</h2>
                                <div class="mb-4">
                                    <input class="form-control" name="name" type="text">
                                </div>
                                <div class="mb-4">
                                    <input class="form-control" name="email" type="text">
                                </div>
                                <div class="mb-4">
                                    <textarea class="form-control" name="message" rows="6"></textarea>
                                </div>
                                <div class="text-right">
                                    <button class="tm-btn tm-btn-primary tm-btn-small">Submit</button>                        
                                </div>                                
                            </form>                          
                        </div>
                    </div>
                </div>
                <aside class="col-lg-4 tm-aside-col">
                    <div class="tm-post-sidebar">
                        <hr class="mb-3 tm-hr-primary">
                        <h2 class="mb-4 tm-post-title tm-color-primary">Categories</h2>
                        <ul class="tm-mb-75 pl-5 tm-category-list">
                            <li><a href="#" class="tm-color-primary">Visual Designs</a></li>
                            <li><a href="#" class="tm-color-primary">Travel Events</a></li>
                            <li><a href="#" class="tm-color-primary">Web Development</a></li>
                            <li><a href="#" class="tm-color-primary">Video and Audio</a></li>
                            <li><a href="#" class="tm-color-primary">Etiam auctor ac arcu</a></li>
                            <li><a href="#" class="tm-color-primary">Sed im justo diam</a></li>
                        </ul>
                        <hr class="mb-3 tm-hr-primary">
                        <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related Posts</h2>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="img/img-02.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Duis mollis diam nec ex viverra scelerisque a sit</figcaption>
                            </figure>
                        </a>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="img/img-05.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Integer quis lectus eget justo ullamcorper ullamcorper</figcaption>
                            </figure>
                        </a>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="img/img-06.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Nam lobortis nunc sed faucibus commodo</figcaption>
                            </figure>
                        </a>
                    </div>                    
                </aside>
            </div>
            <footer class="row tm-row">
                <div class="col-md-6 col-12 tm-color-gray">
                    Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
                </div>
                <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                    Copyright 2020 Xtra Blog Company Co. Ltd.
                </div>
            </footer>
        </main>
    </div>
    <script src="js/jquery.min.js"></script>
    <script src="js/templatemo-script.js"></script>
</body>
</html>