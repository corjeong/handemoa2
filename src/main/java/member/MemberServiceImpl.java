package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


@Repository
@Service("memberservice")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;


	@Override
	public int memberinsert(MemberDTO dto) {
		return dao.memberinsert(dto);
	}

	@Override
	public int checkmember(String id) {
		return dao.checkmember(id);
	}
	@Override
	public int checkmember_nickname(String nickname) {
		return dao.checkmember_nickname(nickname);
	}
	
	@Override
	public int checkmember_email(String email) {
		return dao.checkmember_email(email);
	}
	
	@Override
	public int checkmember_phone(String phone) {
		return dao.checkmember_phone(phone);
	}
	
	//trim 문자열을 제거하는 함수 ==???
	
	@Override
	public MemberDTO login(MemberDTO memberdto) {
		return dao.login(memberdto);
	}
	

}


