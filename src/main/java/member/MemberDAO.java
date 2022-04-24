package member;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	//public class MemberDAO {
	
	
	//@Autowired
	//SqlSession session;

	//����
	public int memberinsert(MemberDTO dto);
/*	{
		int insertrow = session.insert("memberinsert", dto);
		return insertrow;
	}*/
	
	public int checkmember(String id);
	/*
	 * { MemberDTO dto = session.selectOne("member", id); return dto; }
	 */
	public int checkmember_nickname(String nickname);
	
	public int checkmember_email(String email);
	
	public int checkmember_phone(String phone);

	
	
	public MemberDTO login(MemberDTO memberdto);
	

}
