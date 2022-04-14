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
<script src='/js/index.js'></script>
<script type="text/javascript">
	$(document).ready(function(){
	//jquery code
		$('#allCheck').click(function(){
			if($('#allCheck').is(':checked')){
				$('input:checkbox').prop('checked',true);
			}
			else{
				$('input:checkbox').prop('checked',false);
			}
		}); //checkbox click end

		//a태그 클릭이벤트로 변경
		//a태그 클릭시 파라미터값으로 postnum 값 요청
		//ajax로 받아와서 ($('.reportdetail')에 append..
		$('#toggle').click(function(){
			if($('.reportdetail').css("display") == "none"){
				$('.reportdetail').css("display", "block");
			}
			else{
				$('.reportdetail').css("display", "none")
			}
		}); //toggle click end
	});
</script>
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
                    <button id="nav_login_btn">로그인</button>
                </div>
                <div id="nav_list">
                    <div class="nav_list_area">
                        <a href="#"> <!-- 해당 링크 이동 -->
                            <h4>회원관리</h4></a>
                    </div>
                    <div class="nav_list_area">
                        <a href="#"> <!-- 해당 링크 이동 -->
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
					<div id="post_report_list">
						<div class="list_head">
							<div class="report">
								<input type="checkbox" id="allCheck">
							</div>
							<div class="report">글 분류</div>
							<div class="report">닉네임</div>
							<div class="report">글 제목</div>
							<div class="report">신고 횟수</div>
						</div>
						<c:forEach var="post" items="${postReportList}" varStatus="i">
							<div class="list_body">
								<div class="list_row">
									<div class="report">
										<input type="checkbox" id="${i.count }">
									</div>
									<div class="report">${post.divisionname }</div>
									<div class="report">${post.nickname }</div>
									<div class="report"><span id="toggle">${post.posttitle }</span></div>
									<div class="report">${post.count }</div>
								</div>
								<div class="reportdetail">
								<div class="reportdetail_head">
									<div class="report"></div>
									<div class="report">신고 회원 아이디</div>
									<div class="report">신고 사유</div>
									<div class="report"></div>
									<div class="report"></div>
								</div>
								<c:forEach var="detail" items="${postReportDetail}">
								<div class="reportdetail_body">
									<div class="report"></div>
									<div class="report">${detail.reportid }</div>
									<div class="report">${detail.reason }</div>
									<div class="report"></div>
									<div class="report"></div>
								</div>
								</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- post_report_list -->

					<!-- 					<div id="comment"> -->
<%-- 					<c:forEach var="comment" items="${commentReportList}"> --%>
<%-- 						${comment.divisionname }, ${comment.nickname }, ${comment.commentcontent }, ${comment.count } <br> --%>
<%-- 					</c:forEach> --%>
<!-- 					</div> -->
                </div> <!-- div content end -->               
            </div>
        </div>
    </div>
</body>
</html>