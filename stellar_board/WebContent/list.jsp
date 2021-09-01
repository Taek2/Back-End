<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

<% int flag = (int)request.getAttribute("flag"); %>
<!DOCTYPE HTML>
<!--
	Stellar by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Stellar by HTML5 UP</title>
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
					
					<!-- Form -->
						<section>
							<form method="post" action="control.jsp">
								<input type="hidden" name="action" value="search">
								<div class="row gtr-uniform">
									<div class="col-6 col-12-xsmall">
										<select name="condition">
											<option selected value="title">제목</option>
											<option value="writer">작성자</option>
										</select>
									</div>
									<div class="col-6 col-12-xsmall">
										<input type="text" name="content">
									</div>
									<div class="col-12">
										<ul class="actions">
											<li><input type="submit" value="검색하기"></li>
											<li><input type="reset" value="Reset" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>
					<!-- Table -->
					<section id="intro" class="main">
						
						<h2>글 목록</h2>
						
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>글 번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
								</thead>
								<tbody>
									<%
										for(MessageVO vo:(ArrayList<MessageVO>)datas){
									%>
									<tr>
										<!-- 글 번호를 누르면 edit(수정)으로 포워딩, & 연산자를 사용해 원하는 파라미터 값을 넘길 수 있다. -->
										<!--  "control.jsp?action=edit&mnum=<%=vo.getMnum()%>" -->
										<td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td>
										<td><a href="control.jsp?action=read&mnum=<%=vo.getMnum()%>"><%=vo.getTitle() %></a></td>
										<td><%=vo.getWriter() %></td>
										<td><%=vo.getWdate() %></td>
									</tr>
									<%
										}
									%>
				
							</table>
							<%  if(session.getAttribute("memnum") != null){
									if(flag == 0){	
							%>
							<a href="control.jsp?action=myList" class="button">내가 쓴 글 보기</a>
							<%} else if(flag == 1){ %>
							<a href="control.jsp?action=list" class="button">전체 글 보기</a>
							<%} %>
							<a href="logout.jsp" class="button primary">로그아웃</a>
							<% } %>
							<a href="form.jsp" class="button">글 등록</a>
							<%  if(session.getAttribute("memnum") == null){ %>
							<a href="index.jsp" class="button primary">메인으로</a>
							<% } %>
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