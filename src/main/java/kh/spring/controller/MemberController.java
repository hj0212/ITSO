package kh.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = service.loginExist(dto);
		mav.addObject("result", result);
	
		System.out.println(result);
		mav.setViewName("loginProc.jsp");
		return mav;
	}
}
