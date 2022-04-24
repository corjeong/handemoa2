package admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminController {

//	@RequestMapping("/login")
//	public ModelAndView login() {
//		ModelAndView mv= new ModelAndView();
//		mv.addObject("model", "login");
//		mv.setViewName("login");
//		return mv;
//	}
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("model", "index");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/loginindex")
	public ModelAndView loginindex() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("model", "index");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/member")
	public ModelAndView member() {
		ModelAndView mv= new ModelAndView();
		mv.addObject("model", "member");
		mv.setViewName("member");
		return mv;
	}
	
	
	
}





