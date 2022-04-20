<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Insert title here</title>
<script src="/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='/css/index.css'>
<link rel='stylesheet' type='text/css' href='/css/report.css'>
<link rel='stylesheet' type='text/css' href='/css/postreport.css'>
<script src='/js/index.js'></script>
<script type="text/javascript" src='/js/report.js'></script>
<script type="text/javascript" src='/js/postreport.js'></script>
</head>
<body>

    <div class="container">
        <!-- 네비게이션 start -->
        <div id="nav_area">
            <div id="nav_space">
                <div id="logo">
                    <a href="#"> 
                        <img src="/css/images/logo.png" />
                    </a>
                </div>
                <div id="nav_profile">
                    <div id="nav_profile_img">
                        <img src="/css/images/login_before.png"/>
                    </div>
                    <h4>관리자</h4>
                    <button id="nav_login_btn"	onclick="location.href='http://localhost:8083/adminlogout'">로그아웃</button>
                </div>
                <div id="nav_list">
                    <div class="nav_list_area">
                        <a href="#"> <!-- 해당 링크 이동 -->
                            <h4>회원관리</h4></a>
                    </div>
                    <div class="nav_list_area">
                        <a href="/adminpostreport"> <!-- 해당 링크 이동 -->
                            <h4>신고관리</h4></a>
                    </div>
                    <div class="nav_list_area">
                        <a href="#"> <!-- 해당 링크 이동 -->
                            <h4>게시글/댓글관리</h4></a>
                    </div>
                    <div class="nav_list_area">
                        <a href="#"> <!-- 해당 링크 이동 -->
                            <h4>공지사항 관리</h4></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 네비게이션 end -->

        <div id="content_container">
            <div id="content_container_space">
                <div id="search_area">
                    <div id="search_box">
                        <input id="search" type="search"/>
                    </div>
                    <div id="search_icon_area">
                        <a href="#"><img src="/css/images/search_icon.png"/></a>
                    </div>
                    <div id="search_box_space"></div>
                </div>
            	<div id="inner_space"></div>
                <div id="content">
					<!-- 컨텐츠 넣어주세요! -->

					<!-- 신고 상세 내역 모달창 -->
					<div id="modal_report">
						<div class="modal_layer">
							<div class="modal_content">
								<div class="modal_content_title">
									<h2>신고 상세 내역</h2>
									<hr>
								</div>
								<div class="modal_content_body">
									<div class="reportdetail">
										<div class="reportdetail_head">
											<div class="report"></div>
											<div class="report">신고 회원 아이디</div>
											<div class="report">신고 사유</div>
										</div>
									</div>
								</div>
								<button type="button" id="modal_close_btn">창 닫기</button>
							</div>
						</div>
					</div>
					
					
					
                </div> <!-- div content end -->     

            </div><!--content_container end -->
            
        </div> <!-- content_container_space end -->
    </div>
</body>
</html>