package admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reportDAO")
public interface ReportDAO {

	//게시판 신고관리
	public List<PostReportJoinDTO> postreportList();	
	public List<PostReportDTO> postReportDetail(int postnum);
	
	//댓글 신고관리
	public List<CommentReportJoinDTO> commentreportList();	
	public CommentReportDTO commentReportDetail(int commentreportnum);
	
}
