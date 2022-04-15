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


		//checkbox 클릭 이벤트
		$('#allCheck').click(function(){
			if($('#allCheck').is(':checked')){
				$('input:checkbox').prop('checked',true);
			}
			else{
				$('input:checkbox').prop('checked',false);
			}			
			
		}); //checkbox click end

		//삭제 버튼 클릭 이벤트
		$('#delete_btn').click(function(){
			$("#modal_confirm").show();				
			
			//모달 창 닫기 버튼
			$("#modal_confirm_close_btn").click(function () {
				$("#modal_confirm").hide();				
			});

		});


		//상세 검색 버튼 클릭
		$('#division_btn').click(function(){
			console.log($('#divisioncode option:selected').val());

			$('.list_body').remove();	

			$.ajax({
				url: "/admin/postreport/division",
				data: {'divisioncode': $('#divisioncode option:selected').val()},
				type: 'get',
				dataType: 'json',
				success: function (data) {		
					console.log(data);

					for(var i = 0; i < data.length; i++){
						$('#post_report_list').append("<div class='list_body'><div class='list_row'>");
						$('.list_row').append("<div class='report'><input type='checkbox'></div>");
						$('.list_row').append("<div class='report'>" + data[i].divisionname + "</div>");
						$('.list_row').append("<div class='report'>" + data[i].nickname + "</div>");
						$('.list_row').append("<div class='report'><span class='toggle'>" + data[i].posttitle + "<input type='hidden' value=" + data[i].postnum + "></span></div>");
						$('.list_row').append("<div class='report'>" + data[i].count + "</div></div></div");	
					}

				}
			});


		}); 

		//글제목 클릭시 상세 신고 내역 확인
 		$(document).on('click', '.toggle',(function(){
			
			$("#modal_report").show();		

			var postnum = $(this).children('input').attr('value');
			$('.reportdetail_body').remove();	

			$.ajax({
				url: "/admin/postreport",
				data: {'postnum': postnum},
				type: 'post',
				dataType: 'json',
				success: function (data) {
									
					for(var i = 0; i < data.length; i++){				
						$('.modal_content_body').append("<div class='reportdetail_body'>");	
						$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + (i+1) + "</div>");
						$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + data[i].reportid + "</div>");
						$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + data[i].reason + "</div>");
						$('.modal_content_body').append("</div>");
					}					
				}
			});

			//모달 창 닫기 버튼
			$("#modal_close_btn").click(function () {
				$("#modal_report").hide();				
			}); 

		})); //.toggle click end 
	}); //document ready end

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

					<!-- 게시글 신고관리 / 댓글 신과관리 탭 -->


					<!-- 상세 검색 / 삭제 버튼-->
					<div id="content_head">
						<select id="divisioncode" name="divisioncode">
							<option value="1">커뮤니티</option>
							<option value="2">강의랭킹</option>
						</select>
						<img id="division_btn" src="/css/images/search_icon.png"/>
						<button id="delete_btn">삭제</button>
					</div>

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
										<input type="checkbox">
									</div>
									<div class="report">${post.divisionname }</div>
									<div class="report">${post.nickname }</div>
									<div class="report">
										<span class="toggle" id="${i.count }" onclick='detailshow()'>${post.posttitle }
											<input type="hidden" value="${post.postnum }">
										</span>
									</div>
									<div class="report">${post.count }</div>
								</div>								
							</div>
						</c:forEach>
					</div> <!-- post_report_list end -->


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

					<!-- 삭제 확인 모달창 -->

                    <div id="modal_confirm">
                        <div class="modal_layer">
                        <div class="modal_content">
							<div class="modal_content_title">
                            	<h2>정말로 삭제하시겠습니까?</h2>
							</div>
							<div class="confirm_btn">                    
                            	<button type="button" id="modal_confirm_close_btn">아니요</button>
								<button type="button" id="modal_confirm_ok_btn">삭제</button>
							</div>                           
                        </div>
                       </div>
                    </div>

                </div> <!-- div content end -->     

            </div>
        </div>
    </div>
</body>
</html>