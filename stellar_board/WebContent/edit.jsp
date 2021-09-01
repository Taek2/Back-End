<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Stellar by HTML5 UP</title>
		<script type="text/javascript">
			// 삭제 버튼 onClick 옵션 함수 정의
			function del(){
				result=confirm("정말로 삭제하시겠습니까?");
				if(result==true){
					document.form1.action.value="delete";
					document.form1.submit();
				}
				else{
					return;
				} 
			}
		</script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" class="alt">
						<span class="logo"><img src="images/bono.png" alt="" /></span>
						<h1>~~참치라이더~~</h1>
						<p>게시판 기능을 구현해보자<br />
						built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a>.</p>
					</header>

				<!-- Nav -->
					<nav id="nav">
						<ul>
							<li><a href="#intro" class="active">Introduction</a></li>
							<li><a href="#first">First Section</a></li>
							<li><a href="#second">Second Section</a></li>
							<li><a href="#cta">Get Started</a></li>
						</ul>
					</nav>

				<!-- Main -->
					<div id="main">

						<!-- Introduction -->
							<section id="intro" class="main">
							<a class="button" href="control.jsp?action=list">메인으로 돌아가기</a><br><br>
								<div class="spotlight">
									<!-- Form -->
									<section>
										<h2>글 수정</h2>
										<form method="post" action="control.jsp">
											<input type="hidden" name="action" value="update">
											<input type="hidden" name="mnum" value="<%=data.getMnum()%>">
											<input type="hidden" name="member" value="<%=data.getMember()%>">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													<input type="text" name="writer" value="<%=data.getWriter()%>">
												</div>
												<div class="col-6 col-12-xsmall">
													<input type="date" name="date" value="<%=data.getWdate()%>">
												</div>
												<div class="col-12">
													<input type="text" name="title" value="<%=data.getTitle()%>">
												</div>
												<div class="col-12">
													<textarea name="content" id="demo-message" placeholder="Enter your message" rows="6"><%=data.getContent()%></textarea>
												</div>
												<div class="col-12">
													<ul class="actions">
														<li><input type="submit" value="수정하기" class="primary" /></li>
														<li><input type="button" value="글 삭제하기" onClick="del()" class="button"></li>
													</ul>
												</div>
											</div>
										</form>
									</section>
								</div>
							</section>

						
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>