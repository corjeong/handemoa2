package member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberservice")
	MemberService service;
	
	@RequestMapping(value="/memberinsert", method = RequestMethod.GET)
	public String insertform() throws Exception{
		return "/member";
	}
	
	
	@RequestMapping(value="/memberinsert", method = RequestMethod.POST)
	public String insertresult(MemberDTO dto) throws Exception{
		int result = service.memberinsert(dto);//id, email, phone �ߺ� �Ұ���
		return "redirect:login";
	}
	
	@RequestMapping(value="/adminlogin", method = RequestMethod.GET)
	public String adminlogin() throws Exception{
		return "adminlogin";
	}
	
	@RequestMapping(value="/admin", method = RequestMethod.POST)
	public String admin() throws Exception{
		return "admin";
	}
	
	@RequestMapping(value="/adminindex", method = RequestMethod.GET)
	public String adminindex() throws Exception{
		return "adminindex";
	}
	
	@RequestMapping(value="/adminlogout", method = RequestMethod.GET)
	public String logout() throws Exception{
		return "adminlogout";
	}
	

	@ResponseBody
	@RequestMapping(value="/membercheck", method = RequestMethod.POST)
	public int selectMember(String id) throws Exception{
		int result = service.checkmember(id);
		System.out.println(result);
		System.out.println(id);
			//result = 0 사용o
		 
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/membercheck_nickname", method = RequestMethod.POST)
	public int selectMember_nickname(String nickname) throws Exception{
		int result = service.checkmember_nickname(nickname);
		System.out.println(result);
		System.out.println(nickname);
			//result = 0 사용o
		 
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/membercheck_email", method = RequestMethod.POST)
	public int selectMember_email(String email) throws Exception{
		int result = service.checkmember_email(email);
		System.out.println(result);
		System.out.println(email);
			//result = 0 사용o
		 
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/membercheck_phone", method = RequestMethod.POST)
	public int selectMember_phone(String phone) throws Exception{
		int result = service.checkmember_phone(phone);
		System.out.println(result);
		System.out.println(phone);
			//result = 0 사용o
		 
		return result;
	}

	
	@RequestMapping(value = "/login", method =  RequestMethod.GET)
	public ModelAndView form() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(MemberDTO dto, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO logindto = service.login(dto);
		if(logindto != null) {
		    HttpSession session = request.getSession();
		    session.setAttribute("member", logindto);
		    System.out.println(logindto.id);
		    session.setAttribute("isLogOn", true);
		    
		    mv.setViewName("redirect:/index");
		}else {
			rAttr.addAttribute("result","loginFailed");
		    mv.setViewName("redirect:/login");
		}
		return mv;
	}
	
	@RequestMapping(value = "/logout", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index");
		return mav;
	}
	
	@RequestMapping(value="/memberedit", method = RequestMethod.GET)
	public String memberedit() throws Exception{
		return "memberedit";
	}
	
	
}
	


/*
request.setCharacterEncoding("UTF-8");
//ajax로 값을 받기 때문에 UTF-8 인코딩
	response.setCharacterEncoding("EUC-KR");

String id = request.getParameter("id");
//key값이 idcheck_font
//value값은 유저가 실제로 적은값, String idcheck_font에는 value값이 들어감.
PrintWriter out = response.getWriter();

MemberDAO dao = new MemberDAO();

int checkId_font = dao.idcheck_font(id);

//성공여부 확인 : 개발자용
if (checkId_font ==0) {
	System.out.println("이미 존재하는 아이디 입니다.");
} else if (checkId_font == 1) {
	System.out.println("사용 가능한 아이디 입니다.");
}

out.write(checkId_font + ""); // -> ajax 결과값인 result가 됨
//-> String으로 값을 내보낼 수 있도록 + ""를 해준다.

}

*/

