package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/*")
public class ReportController {
	
	@Autowired
	@Qualifier("reportservice")
	ReportService service;
	
	@RequestMapping("/postreport")
	public ModelAndView postReportAllList() {
		ModelAndView mv = new ModelAndView();		
		List<PostReportJoinDTO> postReportList = service.postReportList();
		mv.addObject("postReportList", postReportList);
		mv.setViewName("postreport");	
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/postreport", method=RequestMethod.POST)
	public List<PostReportDTO> postReportDetail(int postnum) {
		List<PostReportDTO> postReportDetail = service.postReportDetail(postnum);
		return postReportDetail;
	}
	
	@ResponseBody
	@RequestMapping("/postreport/division")
	public List<PostReportJoinDTO> divisionReportList(int divisioncode) {
		List<PostReportJoinDTO> postReportList = service.divisionPostReport(divisioncode);
		System.out.println(divisioncode);
		System.out.println(postReportList.get(0).posttitle);
		return postReportList;
	}	
	
	@RequestMapping("/commentreport")
	public ModelAndView postReportList() {
		ModelAndView mv = new ModelAndView();
		List<CommentReportJoinDTO> commentReportList = service.commentReportList();
		mv.addObject("commentReportList", commentReportList);
		mv.setViewName("postreport");	
		return mv;
	}
}
