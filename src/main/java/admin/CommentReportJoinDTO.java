package admin;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter @Setter
public class CommentReportJoinDTO {
	int divisioncode;
	String divisionname;
	String nickname;
	int commentreportnum;
	String commentcontent;
	int count;	
}
