	/**
 * 
 */ 
 	//신고 사유 textarea 글자 수 제한
 	$(document).on('keyup', '#reportTxt', function() {
        $('#reportTxt_count').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#reportTxt_count').html("(100 / 100)");
        }
    });
    
 	let type = ""; //신고하기 버튼 타입 글 or 댓글 구분
 	let divisioncode = "";
 	let reportnum = ""; //신고하는 게시글 or 댓글 번호
	//신고하기 버튼 클릭 이벤트
	$(document).on('click', '.report_btn button', (function () {
		//게시글인지 댓글인지
		type = $(this).attr('class');
		let str =  $(this).attr('id');
		divisioncode = str.substring(0, 1);
		if(type == "reportpostbtn"){
			reportnum = str.substring(5);
		}
		else{
			reportnum = str.substring(8);
		}
		console.log(type);
		console.log("str : " + str);
		console.log("divisioncode : " + divisioncode);		
		console.log("reportnum : " + reportnum);
		
		$("#modal_report").show();
		//$('#reportTxt').attr('readonly', true);		

	})); //신고하기 버튼 이벤트 end
	
	//radio 9번 클릭시 textarea 활성화
	$(document).on('click', 'input[name="radioTxt"]', (function(){
		if($(this).val() == "9"){				
			$('#reportTxt').attr('readonly', false);
		}
		else{
			$('#reportTxt').attr('readonly', true);
			$('#reportTxt').val("");
		}			
	}));

	//신고 취소 버튼
	$(document).on('click', '#modal_report_close_btn', (function () {
		$("#modal_report").hide();
		//radio, textarea 초기화
		$('#reportTxt').val("");
		$('#reportTxt_count').html("(0 / 100)");
		$('input[value="1"]').prop('checked', true);				
	}));

	//신고 확인 버튼
	$(document).on('click', '#modal_report_ok_btn', (function () {
		let radioval =  $('input[name="radioTxt"]:checked').val();
		let reason = "";
		if(radioval == 9){
			reason = "기타 : " + $('#reportTxt').val();	
		}
		else{
			reason = $("label[for='radio"+radioval+"']").text();
		}
		console.log("신고이유" + reason);
		//신고하기 insert ajax
		//게시글 신고인 경우
		if(type == "reportpostbtn"){
			console.log("reportpostbtn");
			$.ajax({
				url: "/postreport",
				data: { 'reason': reason,
						'divisioncode' : divisioncode,
						'postnum' : reportnum},
				type: 'post',
				dataType: 'json',
				success: function (result) {
					console.log("게시글 신고 성공");
					console.log(result);
					$("#modal_report").hide();	
							
					//radio, textarea 초기화
					$('#reportTxt').val("");
					$('#reportTxt_count').html("(0 / 100)");
					$('input[value="1"]').prop('checked', true);
				}
			});
		}
		//댓글 신고인 경우
		else{
			console.log("reportcommentbtn");
			
			$.ajax({
				url: "/commentreport",
				data: { 'reason': reason,
						'divisioncode' : divisioncode,
						'commentnum' : reportnum
					},
				type: 'post',
				async: false,
				dataType: 'json',
				success: function (data) {						
					console.log("댓글 신고 성공");
					console.log(data);
					$("#modal_report").hide();	
							
					//radio, textarea 초기화
					$('#reportTxt').val("");
					$('#reportTxt_count').html("(0 / 100)");
					$('input[value="1"]').prop('checked', true);
				}
			});	
		}			
	})); //신고 확인 버튼 이벤트 end	
