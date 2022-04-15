package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reportservice")
public class ReportServiceImpl implements ReportService {

	@Autowired
	@Qualifier("reportDAO")
	ReportDAO reportDAO;
	
	@Override
	public List<PostReportJoinDTO> postReportList() {
		return reportDAO.postreportList();
	}
	
	@Override
	public List<PostReportDTO> postReportDetail(int postnum) {
		return reportDAO.postReportDetail(postnum);
	}
	
	@Override
	public List<PostReportJoinDTO> divisionPostReport(int divisioncode) {
		return reportDAO.divisionPostReport(divisioncode);
	}

	@Override
	public List<CommentReportJoinDTO> commentReportList() {
		return reportDAO.commentreportList();
	}

	@Override
	public CommentReportDTO commentReportDetail(int commentreportnum) {
		return reportDAO.commentReportDetail(commentreportnum);
	}

}
