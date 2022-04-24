<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>한데모아 - 북마크</title>
<script src="/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link rel='stylesheet' type='text/css' href='/css/index.css'>
<link rel='stylesheet' type='text/css' href='/css/bookmark/bookmarkcheck.css'>
<script src='/js/index.js'></script>
<script type="text/javascript" src='/js/bookmark/bookmarkcheck.js'></script>
</head>
<body>

    <div class="container">
        <!-- 네비게이션 start -->
        <div id="nav_area">
            <div id="nav_space">
                <div id="logo">
                    <a href="/adminindex"> 
                        <img src="/css/images/logo.png" />
                    </a>
                </div>
                <div id="nav_profile">
					<div id="nav_profile_img">
						<img src="css/images/login_before.png" />
					</div>
					<c:choose>
                   		<c:when test="${isLogOn == true && member!= null}">
                      		<h3 style="text-align: center;">${member.nickname} 님</h3>
                    		<button id="nav_login_btn" onclick="location.href='/logout'">로그아웃</button>
                   		</c:when>
                    	<c:otherwise>
                    		<button id="nav_login_btn" onclick="location.href='/login'">로그인</button>
                    	</c:otherwise>
                    </c:choose>
				</div>
                <div id="nav_list">
					<div class="nav_list_area">
						<a href="/bookmark"> <!-- 해당 링크 이동 -->
							<h4>북마크</h4></a>
					</div>
					<div class="nav_list_area">
						<a href="/ranking?catedetailcode=8&page=1"> <!-- 해당 링크 이동 -->
							<h4>강의랭킹</h4></a>
					</div>
					<div class="nav_list_area">
						<a href="/communitylist"> <!-- 해당 링크 이동 -->
							<h4>커뮤니티</h4></a>
					</div>
					<div class="nav_list_area">
						<a href="/notic"> <!-- 해당 링크 이동 -->
							<h4>공지사항</h4></a>
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
                <div id="bookmark_content">
					<!-- 컨텐츠 넣어주세요! -->
				
					<div id="bookmark">
						<!-- 로그인 / 비로그인-->
						<c:choose>
							<c:when test="${isLogOn == true && member!= null}">
								<!-- 로그인 되어 있으면 북마크 있는지 체크하고 on/off-->
								<c:choose>
                   					<c:when test="${checkBookMark == 1}">
										<img class="bookmark_btn" id="bookmark_on" src="/css/images/bookmark_on.png"/>
                   					</c:when>
                    				<c:otherwise>
										<img class="bookmark_btn" id="bookmark_off" src="/css/images/bookmark_off.png"/>
                    				</c:otherwise>
                    			</c:choose>
							</c:when>
							<c:otherwise>
                    			<img class="bookmark_btn" id="bookmark_logout" src="/css/images/bookmark_off.png"/>
                    		</c:otherwise>
						</c:choose>
					</div>
					
					<!-- 비로그인시 모달창 -->					
					<div id="modal_bookmarkcheck">
						<div class="modal_bookmarkcheck_layer">
							<div class="modal_bookmarkcheck_content">
								<div class="modal_bookmarkcheck_title">
									<h3>로그인 회원만 이용이 가능합니다.</h3>
									<h3>로그인하시겠습니까?</h3>
								</div>
								<div class="modal_bookmarkcheck_btn">
									<button type="button" id="modal_bookmarkcheck_ok_btn">네</button>
									<button type="button" id="modal_bookmarkcheck_close_btn">아니요</button>
								</div>								
							</div>
						</div>
					</div>

                </div> <!-- div content end -->     

            </div><!--content_container end -->
            
        </div> <!-- content_container_space end -->
    </div>
</body>
</html>