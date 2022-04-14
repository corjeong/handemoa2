package admin;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;

@Component
@Getter @Setter
public class CommentReportJoinDTO {
	String divisionname;
	String nickname;
	String commentcontent;
	int count;	
}
