package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
		int postnum = 1;
		List<PostReportDTO> postReportDetail = service.postReportDetail(postnum);
		mv.addObject("postReportDetail", postReportDetail);
		mv.setViewName("report");
		return mv;
	}
	
	@RequestMapping("/commentreport")
	public ModelAndView postReportList() {
		ModelAndView mv = new ModelAndView();
		List<CommentReportJoinDTO> commentReportList = service.commentReportList();
		mv.addObject("commentReportList", commentReportList);
		mv.setViewName("report");	
		return mv;
	}
}
