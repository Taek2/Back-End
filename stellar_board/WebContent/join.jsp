<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

						<!-- Introduction -->
							<section id="intro" class="main">
								<div class="spotlight">
									<!-- Form -->
									<section>
										<h2>회원가입</h2>
										<form method="post" action="control.jsp">
											<input type="hidden" name="action" value="join">
											<div class="row gtr-uniform">
												<div class="col-6 col-12-xsmall">
													<input type="text" name="mid" id="demo-name" value="" placeholder="ID를 입력" />
												</div>
												<div class="col-6 col-12-xsmall">
													<input type="password" name="mpw" id="demo-email" value="" placeholder="PW를 입력" />
												</div>
												<div class="col-12">
													<select name="demo-category" id="demo-category">
														<option value="">- Category -</option>
														<option value="1">C</option>
														<option value="1">JAVA</option>
														<option value="1">JSP</option>
														<option value="1">HTML/CSS</option>
													</select>
												</div>
												<div class="col-4 col-12-small">
													<input type="radio" id="demo-priority-low" name="demo-priority" checked>
													<label for="demo-priority-low">Low</label>
												</div>
												<div class="col-4 col-12-small">
													<input type="radio" id="demo-priority-normal" name="demo-priority">
													<label for="demo-priority-normal">Normal</label>
												</div>
												<div class="col-4 col-12-small">
													<input type="radio" id="demo-priority-high" name="demo-priority">
													<label for="demo-priority-high">High</label>
												</div>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="demo-copy" name="demo-copy">
													<label for="demo-copy">Email me a copy</label>
												</div>
												<div class="col-6 col-12-small">
													<input type="checkbox" id="demo-human" name="demo-human" checked>
													<label for="demo-human">Not a robot</label>
												</div>
												<div class="col-12">
													<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
												</div>
												<div class="col-12">
													<ul class="actions">
														<li><input type="submit" value="회원가입" class="primary" /></li>
														<li><input type="reset" value="Reset" /></li>
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