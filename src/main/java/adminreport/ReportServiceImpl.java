package adminreport;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reportservice")
public class ReportServiceImpl implements ReportService {

	@Autowired
	@Qualifier("reportDAO")
	ReportDAO reportDAO;

	@Override
	public List<PostReportJoinDTO> postReportList(int[] page) {
		return reportDAO.postReportList(page);
	}

	@Override
	public List<PostReportJoinDTO> divisionPostReport(Map<String, Integer> division) {
		return reportDAO.divisionPostReport(division);
	}

	@Override
	public int postReporTotalRows() {
		return reportDAO.postReporTotalRows();
	}

	@Override
	public int postReportDivisionRows(int divisioncode) {
		return reportDAO.postReportDivisionRows(divisioncode);
	}

	@Override
	public List<PostReportDTO> postReportDetail(int postnum) {
		return reportDAO.postReportDetail(postnum);
	}

	@Override
	public int deletePostReport(List<Integer> postnum) {
		return reportDAO.deletePostReport(postnum);
	}

	
	@Override
	public List<CommentReportJoinDTO> commentReportList(int[] page) {
		return reportDAO.commentReportList(page);
	}

	@Override
	public List<CommentReportJoinDTO> divisionCommentReport(Map<String, Integer> division) {
		return reportDAO.divisionCommentReport(division);
	}

	@Override
	public int commentReporTotalRows() {
		return reportDAO.commentReporTotalRows();
	}

	@Override
	public int commentReportDivisionRows(int divisioncode) {
		return reportDAO.commentReportDivisionRows(divisioncode);
	}

	@Override
	public List<CommentReportDTO> commentReportDetail(int postnum) {
		return reportDAO.commentReportDetail(postnum);
	}

	@Override
	public int deleteCommentReport(List<Integer> postnum) {
		return reportDAO.deleteCommentReport(postnum);
	}
	
	
}
