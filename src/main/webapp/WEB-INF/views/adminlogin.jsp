<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>한데모아 - 로그인</title>
<link rel='stylesheet' type='text/css' href='/css/index.css'>
<link rel='stylesheet' type='text/css' href='/css/adminlogin.css'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<script src='/js/index.js'></script>
<script src='/js/login.js'></script>
</head>
<body>

	<!-- 네비게이션 start -->
	<div id="nav_area">
		<div id="nav_space">
			<div id="logo">
				<a href="http://localhost:8083/index"> <img
					src="css/images/logo.png" />
				</a>
			</div>
			<div id="nav_profile">
				<div id="nav_profile_img">
					<img src="css/images/login_before.png" />
				</div>
				<button id="nav_login_btn"
					onclick="location.href='http://localhost:8083/login'">로그인</button>
			</div>
			<div id="nav_list">
				<div class="nav_list_area">
					<a href="#"> <!-- 해당 링크 이동 -->
						<h4>북마크</h4></a>
				</div>
				<div class="nav_list_area">
					<a href="#"> <!-- 해당 링크 이동 -->
						<h4>강의랭킹</h4></a>
				</div>
				<div class="nav_list_area">
					<a href="#"> <!-- 해당 링크 이동 -->
						<h4>커뮤니티</h4></a>
				</div>
				<div class="nav_list_area">
					<a href="#"> <!-- 해당 링크 이동 -->
						<h4>공지사항</h4></a>
				</div>
			</div>
		</div>
	</div>
	<!-- 네비게이션 end -->
	<div id="content_container">
		<div id="content_container_space">

			<div id="inner_space"></div>
			<div id="content">
				<!-- 컨텐츠 시작 -->

				<% if (request.getParameter("error") == null) { %>
				
				<% } else { %>
				<h1><%= request.getParameter("error") %></h1>
				<% } %>

				<div class="intro_container">
					<!-- 상단 소개글 여백 -->
					<!-- 은택 코드 시작 -->
					<div class="container">
						<div class="intro">
							<br> <br> <br> <br> <br>
							<h2 style="margin-left: '10px';">
								<!-- 상단 소개글 -->
								관리자 로그인
							</h2>
							<br>
						</div>
					</div>
					<form action="admin" method="post">
						<!-- ID, PW 폼 시작 -->
						<!-- ID 박스 -->
						<div id="admin_id">
							<div id="admin_id_box">
								<input name="id" type="text" required="required" id="admin_id_text"
								placeholder="아이디 입력">
							</div>
						</div>
						<!-- 서치 박스 종료 -->

						<!-- PW 박스 -->
						<div id="admin_password">
							<div id="admin_password_box">
								<input name="pw"  type="password" 
									placeholder="비밀번호 입력" required="required" id="admin_password_text" />
							</div>
						</div>

						<!-- PW 박스 종료 -->
						<!--PW-->
						<div class="pw_line"></div>

						<div id="login_btn2" class="btn_form">
							<!--로그인-->
							<br> <input id="login_btn" type=submit value="로그인"
								class="btn btn-dark" id="login_btn">
						</div>
					</form>

				</div>
				<!-- ID, PW 폼 종료 -->

			</div>
		</div>
	</div>
</body>
</html>