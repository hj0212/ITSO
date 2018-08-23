package kh.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebsocketController {
	
	
	@RequestMapping("/chatting.do")
	public ModelAndView chat(ModelAndView mav) {
		mav.setViewName("chat.jsp");
		
/*		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name: " + user.getUsername());
		
		mav.addObject("userid", user.getUsername());
*/		return mav;
	}
	
	
}
