<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

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
                    <li class="tm-nav-item active"><a href="index.jsp" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                    <li class="tm-nav-item"><a href="post.html" class="tm-nav-link">
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
                
				<c:forEach var="v" items="${datas}" varStatus="i">
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary">   
                    <a href="control.jsp?action=post&mnum=${v.mnum}" class="effect-lily tm-post-link tm-pt-60">
                        <div class="tm-post-link-inner">
                            <img src="img/img-0${i.count}.jpg" alt="Image" class="img-fluid">                            
                        </div>
                        <span class="position-absolute tm-new-badge">New</span>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">${v.title}</h2>
                    </a>                    
                    <p class="tm-pt-30">
                        ${v.content}
                   
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">Travel . Events</span>
                        <span class="tm-color-primary">
                        	${v.wdate}
                       </span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between">
                        <span>36 comments</span>
                        <span><a href="control.jsp?action=edit&mnum=${v.mnum}">by ${v.writer}</a></span>
                    </div>
                </article>
                </c:forEach>  
                
            </div>
            <div class="row tm-row tm-mt-100 tm-mb-75">
                <div class="tm-prev-next-wrapper">
                    <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
                    <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
                </div>
                <div class="tm-paging-wrapper">
                    <span class="d-inline-block mr-3">Page</span>
                    <nav class="tm-paging-nav d-inline-block">
                        <ul>
                            <li class="tm-paging-item active">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">1</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">2</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">3</a>
                            </li>
                            <li class="tm-paging-item">
                                <a href="#" class="mb-2 tm-btn tm-paging-link">4</a>
                            </li>
                        </ul>
                    </nav>
                </div> 
                <div>       
                <a href=form.jsp><button>글 작성</button></a>
                </div>                
            </div>            
            <footer class="row tm-row">
                <hr class="col-12">
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