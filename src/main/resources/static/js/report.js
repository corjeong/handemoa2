	/**
 * 
 */ 
$(window).on('load', (function(){
	//페이지 새로 고침 후 선택했던 카테고리 유지
	const searchParams = new URLSearchParams(location.search);
	var divisioncode = searchParams.get("divisioncode");
	if(divisioncode == null) divisioncode = 0;
	$('#divisioncode').val(divisioncode).prop('selected', true);
	
	//현재 페이지 번호에 색상 변경
	var currentpage = searchParams.get("currentpage");
	//console.log(currentpage);
	var page = (currentpage-1)%5;
	$('.pagenum').eq(page).css("color", "red");
	
})); //on ready

	//checkbox 클릭 이벤트
	$(document).on('click', '#allCheck', (function () {
		if ($('#allCheck').is(':checked')) {
			$('input:checkbox').prop('checked', true);
		}
		else {
			$('input:checkbox').prop('checked', false);
		}

	})); //checkbox click end
