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
		<title>글 읽기 페이지</title>
		<script>
			function back(){
				history.go(-1);
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
						<!-- Table -->
									<section id="intro" class="main">
										<button type="button" onClick="back()">뒤로 가기</button><br><br>
										<h2>글 읽기</h2>
										<div class="table-wrapper">
											<table>
												<thead>
													<tr>
														<th>제목</th>
														<th>작성자</th>
														<th>작성시간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><%=data.getTitle() %></td>
														<td><%=data.getWriter() %></td>
														<td><%=data.getWdate() %></td>
													</tr>
													<tr>
														<td colspan='3'><textarea id="demo-message" rows="6" readonly><%=data.getContent()%></textarea></td>
													</tr>
											</table>
										</div>
						

									</section>	
					</div>					
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