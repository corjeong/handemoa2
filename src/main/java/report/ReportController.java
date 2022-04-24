package report;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import adminreport.CommentReportDTO;
import adminreport.PostReportDTO;

@Controller
public class ReportController {
	
	@Autowired
	@Qualifier("reportservice")
	ReportService service;
	
	@RequestMapping("/report")
	public String report(HttpServletRequest request) {
		//세션 처리
		//임의로 로그인 아이디 등록
		HttpSession session = request.getSession();                        
	    session.setAttribute("loginid", "jeong");
		return "report";
	}
	
	//게시글 신고 등록
	@ResponseBody
	@RequestMapping(value="/postreport", method = RequestMethod.POST)
	public int postReportInsert(PostReportDTO dto, HttpServletRequest request) {
		System.out.println("reason : " + dto.getReason());
		System.out.println("divisioncode : " + dto.getDivisioncode());
		System.out.println("postnum : " + dto.getPostnum());
		//세션에서 로그인 아이디 받아와서 setReportid
		HttpSession session = request.getSession(); 
		session.setAttribute("loginid", "jeong");
		String loginid = (String) session.getAttribute("loginid");
		dto.setReportid(loginid);
		//test
		//dto.setDivisioncode(1);
		//dto.setPostnum(29);
		int result = service.insertPostReport(dto);
		//int result = 0;
		return result;
	}
	
	//댓글 신고 등록
	@ResponseBody
	@RequestMapping(value="/commentreport", method = RequestMethod.POST)
	public int commentReportInsert(CommentReportDTO dto, HttpServletRequest request) {
		System.out.println("reason : " + dto.getReason());
		System.out.println("divisioncode : " + dto.getDivisioncode());
		System.out.println("commentnum : " + dto.getCommentnum());
		//세션에서 로그인 아이디 받아와서 setReportid
		HttpSession session = request.getSession(); 
		String loginid = (String) session.getAttribute("loginid");
		dto.setReportid(loginid);
		//test
		//dto.setDivisioncode(1);
		//dto.setCommentnum(3);
		//int result = 0;
		int result = service.insertCommentReport(dto);
		return result;
	}

}
