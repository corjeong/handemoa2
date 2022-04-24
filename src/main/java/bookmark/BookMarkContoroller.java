package bookmark;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.MemberDTO;

@Controller
public class BookMarkContoroller {
	
	@Autowired
	@Qualifier("bookmarkservice")
	BookMarkService service;
	
	//페이지 출력 행, 페이지 수 고정값
	private int limitRows = 8;
	private int limitPage = 5;
	
	@RequestMapping("/bookmark")
	public String bookmark(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		
		//로그인 여부 체크
		if(isLogOn == null || isLogOn == false){
			return "redirect:/login";
		}
		else{
			return "redirect:/bookmarkview?currentpage=1&searchtxt=";
		}
	}
	
	@RequestMapping("/bookmarkview")
	public ModelAndView bookmark(HttpServletRequest request, int currentpage, String searchtxt) {
		System.out.println("searchtxt : " + searchtxt + " , currentpage : " + currentpage);
		HttpSession session = request.getSession();
		MemberDTO logindto = (MemberDTO) session.getAttribute("member");
		
		//페이징
		int pageStartRow = limitRows * ( currentpage - 1);
		
		Map<String, Object> searchdetail = new HashMap<String, Object>();
		searchdetail.put("memberid", logindto.getId());
		searchdetail.put("searchtxt", searchtxt);
		searchdetail.put("pagestartrow", pageStartRow);
		searchdetail.put("limitrows", limitRows);

		//북마크 조회 기본, 제목 기준 검색
		List<BookMarkJoinDTO> bookMarkList = service.bookMarkList(searchdetail);
		int bookMarkRows = service.bookMarkRows(searchdetail);					
		
		BookMarkPageDTO pagedto = new BookMarkPageDTO(limitRows, limitPage, currentpage, bookMarkRows);

		ModelAndView mv = new ModelAndView();		
		mv.addObject("searchdetail", searchdetail);
		mv.addObject("pagedto", pagedto);
		mv.addObject("bookMarkList", bookMarkList);
		
		mv.setViewName("bookmark/bookmark");
		return mv;
	}
	
	@RequestMapping("/bookmarkcheck")
	public ModelAndView bookmarkcheck(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();		
		
		HttpSession session = request.getSession();
		Boolean isLogOn = (Boolean)session.getAttribute("isLogOn");
		String loginid = null;
		//로그인 여부 체크
		if(isLogOn == null || isLogOn == false){
			
		}
		else{
			MemberDTO logindto = (MemberDTO) session.getAttribute("member");
			loginid = logindto.getId();
			int postnum = 1;
			
			Map<String, Object> bookmark = new HashMap<String, Object>();
			bookmark.put("memberid", loginid);
			bookmark.put("postnum", postnum);
			
			int checkBookMark = service.checkBookMark(bookmark);
			mv.addObject("checkBookMark", checkBookMark);
		}			
		
		mv.setViewName("bookmark/bookmarkcheck");
		return mv;
	}
	
	@PostMapping("/bookmarkinsert")
	@ResponseBody
	public int bookmarkinsert(BookMarkDTO dto) {
		int result = 0;
		//북마크에 등록하기
		result = service.insertBookMark(dto);
		
		return result;
	}
	
	@PostMapping("/bookmarkdelete")
	@ResponseBody
	public int bookmarkdelete(BookMarkDTO dto) {
		int result = 0;
		//북마크 삭제하기
		result = service.deleteBookMark(dto);
		
		return result;
	}
}
