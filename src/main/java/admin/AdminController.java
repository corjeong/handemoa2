package admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AdminController {

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

}
	


