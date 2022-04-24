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
<link rel='stylesheet' type='text/css' href='/css/bookmark/bookmark.css'>
<script src='/js/index.js'></script>
<script type="text/javascript" src='/js/bookmark/bookmark.js'></script>
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

					<!-- 페이지 제목 -->
					<div class="content_title">
						<div class="title_bar"><h2>북마크</h2></div>
					</div>
					<!-- 상세 검색 -->
					<div class="content_head">
						<div class="content_head_item">						
							글 제목 검색
						</div>						
						<div class="content_head_item">
							<div id="comment_search_box">
							<input type="text" id="comment_searchdetail">
							</div>
						</div>
						<div class="content_head_item">
							<img id="search_btn" src="/css/images/search_icon.png"/>
						</div>
					</div>

					<!-- 북마크 목록-->
					<div id="bookmark_list">
						<c:forEach var="bookmark" items="${bookMarkList}" varStatus="i">
							<div class="list_body">
								<div class="list_row">
									<div class="report">${bookmark.author }</div>
									<div class="report">${bookmark.classtitle }</div>
									<div class="report">${bookmark.regdate }</div>
									<div class="report">${bookmark.nickname }</div>
									<div class="report">${bookmark.posttitle }</div>
								</div>								
							</div>
						</c:forEach>
					</div> <!-- report_list end -->
					<!-- 페이지 번호 -->
					<div id="bookmark_page">
						<div class="direction_prev">
							<div class="direction_first_page">
								<c:if test="${pagedto.currentpage != 1}">
									<a class="true" href="/bookmarkview?currentpage=1&searchtxt=${searchdetail.searchtxt}">&lt;&lt;</a>
								</c:if>
								<c:if test="${pagedto.currentpage == 1}">
									<a class="false">&lt;&lt;</a>
								</c:if>
							</div>
							<div class="direction_prev_page">
								<c:if test="${pagedto.hasPrevPage == true}">
									<a class="true" href="/bookmarkview?currentpage=${pagedto.currentpage -1}&searchtxt=${searchdetail.searchtxt}">&lt;</a>
								</c:if>
								<c:if test="${pagedto.hasPrevPage == false}">
									<a class="false">&lt;</a>
								</c:if>							
							</div>
						</div>

						<c:forEach var="i" begin="${pagedto.beginPage}" end="${pagedto.endPage }">
							<div class="page">
								<a class="pagenum" href="/bookmarkview?currentpage=${i }&searchtxt=${searchdetail.searchtxt}">${i}</a>
							</div>						
						</c:forEach>
							
						<div class="direction_next">
							<div class="direction_next_page">
								<c:if test="${pagedto.hasNextPage == true}">
									<a class="true" href="/bookmarkview?currentpage=${pagedto.currentpage + 1}&searchtxt=${searchdetail.searchtxt}">&gt;</a>
								</c:if>
								<c:if test="${pagedto.hasNextPage == false}">
									<a class="false">&gt;</a>
								</c:if>
							</div>
							<div class="direction_last_page">
								<c:if test="${pagedto.currentpage != pagedto.totalPage}">
									<a class="true" href="/bookmarkview?currentpage=${pagedto.totalPage}&searchtxt=${searchdetail.searchtxt}">&gt;&gt;</a>
								</c:if>
								<c:if test="${pagedto.currentpage == pagedto.totalPage}">
									<a class="false">&gt;&gt;</a>
								</c:if>
							</div>
						</div>						
					</div> <!-- 페이지번호 end-->

                </div> <!-- div content end -->     

            </div><!--content_container end -->
            
        </div> <!-- content_container_space end -->
    </div>
</body>
</html>