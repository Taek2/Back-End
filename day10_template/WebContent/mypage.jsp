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
					<input class="form-login" type="text" name="mid" id="demo-name" value="" placeholder="ID??? ??????" />	
					<input class="form-login" type="password" name="mpw" id="demo-email" value="" placeholder="PW??? ??????" />	
					<input class= "tm-btn tm-btn-primary tm-btn-small" type="submit" value="?????????" />
					<br>		
				</form>
				<a href="join.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">????????????</button></a>
				</c:if>
				
				 <c:if test="${memnum!=null}">
				 <p class="tm-mb-80 pr-5 text-white">
				 	${id}??? ???????????????!
				 	<a href="logout.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">????????????</button></a>
				 	<a href="mypage.jsp"><button class="tm-btn tm-btn-primary tm-btn-small">???????????????</button></a>
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
        
            <form method="post" action="control.jsp" class="mb-5 tm-comment-form">
			    <input type="hidden" name="action" value="mypage">
			    <input type="hidden" name="memnum" value="${memnum}">
			    <h2 class="tm-color-primary tm-post-title mb-4">??????????????????</h2>
			    <div class="mb-4">
			        <input class="form-control" name="mid" type="text" value="${id}" readonly>
			    </div>
			    <div class="mb-4">
			        <input class="form-control" name="mpw" type="password" placeholder="????????? ????????????">
			    </div>
			    <div class="mb-4">
			        <textarea class="form-control" name="message" rows="6"></textarea>
			    </div>
			    <div class="text-right">
			        <button class="tm-btn tm-btn-primary tm-btn-small">Submit</button>                        
			    </div>                                
			</form>         
			
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