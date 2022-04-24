	/**
 * 
 */ 
 $(window).on('load', (function(){
	//페이지 새로 고침 후 선택했던 카테고리 유지
	const searchParams = new URLSearchParams(location.search);
	var divisioncode = searchParams.get("divisioncode");

})); //on ready

 	//북마크 버튼 클릭 이벤트
	$(document).on('click', '.bookmark_btn', (function () {
		let check = $(this).attr('id');
		if(check == 'bookmark_on'){
			console.log($(this).attr('id'));
			//북마크 off하기 - delete
			$.ajax({
				url: "/bookmarkdelete",
				//data: { 'postnum': $("#getPostnum").val(),
                //        'userid' : $("#userid").val()},
                data: { 'postnum': '1',
                        'memberid' : 'jeong'},
				type: 'post',
				dataType: 'json',
				success: function (result) {
					console.log(result);
					if(result == 1){						
						$("#bookmark").empty();
						$("#bookmark").html("<img class='bookmark_btn' id='bookmark_off' src='/css/images/bookmark_off.png'/>");
					}
					else{
						alert("북마크 off 실패");
					}
				}
			});
		}
		else if(check == 'bookmark_off'){
			//북마크 on하기 - insert
			$.ajax({
				url: "/bookmarkinsert",
				//data: { 'postnum': $("#getPostnum").val(),
                //        'userid' : $("#userid").val()},
                data: { 'postnum': '1',
                        'memberid' : 'jeong'},
				type: 'post',
				dataType: 'json',
				success: function (result) {
					console.log(result);
					if(result == 1){
					$("#bookmark").empty();
					$("#bookmark").html("<img class='bookmark_btn' id='bookmark_on' src='/css/images/bookmark_on.png'/>");
					}
					else{
						alert("북마크 on 실패")
					}						
				}
			});
		}
	}));

	//로그인 안한 상태 북마크 버튼 클릭
	$(document).on('click', '#bookmark_logout', (function () {
		$("#modal_bookmarkcheck").show();	
	}));
	//모달창 네 버튼 ->로그인 화면으로 이동
	$(document).on('click', '#modal_bookmarkcheck_ok_btn', (function () {
		$("#modal_bookmarkcheck").hide();
		location.href = '/login';	
	}));
	//모달창 아니요 버튼
	$(document).on('click', '#modal_bookmarkcheck_close_btn', (function () {
		$("#modal_bookmarkcheck").hide();
	}));
