package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		System.out.println(dto.getEmail()+":"+dto.getPw());
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = service.loginExist(dto);
<<<<<<< HEAD
		mav.addObject("result", result);
	
		System.out.println(result);
=======
		if(result.size()>0) {
			session.setMaxInactiveInterval(60*60);
			MemberDTO user = result.get(0);
			session.setAttribute("user", user);
			System.out.println(dto.getEmail());
		}
		mav.addObject("result",result.size());
>>>>>>> master
		mav.setViewName("loginProc.jsp");
		return mav;
	}
	
	@RequestMapping("/login.go")
	public String loginMain() {
		return "redirect:login.jsp";
	}
	
	@RequestMapping("/loginProc.do")
	public ModelAndView loginProc(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main.jsp");
		return mav;
	}
	@RequestMapping("/signin.do")
	public ModelAndView SigninProc(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.insertUserData(dto);
		mav.addObject("result", result);
		mav.setViewName("signinProc.jsp");
		return mav;
	}
	@RequestMapping("/mypage.go")
	public String goMypage() {
		return "redirect:mypage.jsp";
	}
	
	@RequestMapping("/myinfo.go")
	public String goMyinfo() {
		return "redirect:myinfo.jsp";
	}
}
