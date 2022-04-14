package admin;

import java.util.List;

public interface ReportService {

	//게시글 신고기록 조회, 상세 조회
	public List<PostReportJoinDTO> postReportList();
	public List<PostReportDTO> postReportDetail(int postnum);
	
	//댓글 신고기록 조회, 상세 조회
	public List<CommentReportJoinDTO> commentReportList();
	public CommentReportDTO commentReportDetail(int commentreportnum);
}
