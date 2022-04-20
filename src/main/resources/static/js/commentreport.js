	/**
 * 
 */ 
 
 	//분류별 검색 버튼 클릭
	$(document).on('click', '#division_btn', (function () {
		//console.log($('#divisioncode option:selected').val());
		var division = $('#divisioncode option:selected').val();
		location.href = '/admincommentreport/division?divisioncode=' + division + '&currentpage=1';	
	}));
	//삭제 버튼 클릭 이벤트
	$(document).on('click', '#delete_btn', (function () {
		if (!$('input:checkbox').is(':checked')) {
			$("#modal_check").show();

			//모달 창 닫기 버튼
			$(document).on('click', '#modal_check_close_btn', (function () {
				$("#modal_check").hide();
			}));
			return;
		}

		$("#modal_confirm").show();

		// 창 닫기 버튼
		$(document).on('click', '#modal_confirm_close_btn', (function () {
			$("#modal_confirm").hide();
		}));

		//삭제 확인 버튼
		$(document).on('click', '#modal_confirm_ok_btn', (function () {
			$("#modal_confirm").hide();

			//선택된 신고기록번호
			var commentnums = [];

			$("input[name='ck_report']:checked").each(function () {
				var num = $(this).val();
				commentnums.push(num);
			});

			//console.log(postnums);

			$.ajax({
				url: "/admincommentreport/delete",
				data: { 'commentnums': commentnums },
				type: 'post',
				dataType: 'json',
				success: function (result) {
					console.log(result);
					location.replace("/admincommentreport/division?divisioncode=0&currentpage=1");
				}
			});
		})); //삭제 확인 end

	})); //삭제버튼 이벤트 end
	// 클릭시 상세 신고 내역 확인
	$(document).on('click', '.toggle', (function () {

		$("#modal_report").show();

		var postnum = $(this).children('input').attr('value');
		$('.reportdetail_body').remove();

		$.ajax({
			url: "/admincommentreport/detail",
			data: { 'postnum': postnum },
			type: 'post',
			dataType: 'json',
			success: function (data) {

				for (var i = 0; i < data.length; i++) {
					$('.modal_content_body').append("<div class='reportdetail_body'>");
					$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + (i + 1) + "</div>");
					$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + data[i].reportid + "</div>");
					$('.modal_content_body').children('.reportdetail_body').eq(i).append("<div class='report'>" + data[i].reason + "</div>");
					$('.modal_content_body').append("</div>");
				}
			}
		});

		//모달 창 닫기 버튼
		$(document).on('click', '#modal_close_btn', (function () {
			$("#modal_report").hide();
		}));

	})); //.toggle click end 