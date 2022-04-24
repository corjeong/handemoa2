	/**
 * 
 */ 
 $(window).on('load', (function(){
	
	//현재 페이지 번호에 색상 변경
	const searchParams = new URLSearchParams(location.search);
	var currentpage = searchParams.get("currentpage");
	//console.log(currentpage);
	let page = 0;
	if(currentpage == null) {
		currentpage = 0;
	}
	else{
		page = (currentpage-1)%5;
	}
	$('.pagenum').eq(page).css("color", "red");
	
})); //on ready

