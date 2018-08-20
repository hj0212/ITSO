package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		if(result.size()>0) {
			session.setMaxInactiveInterval(60*60);
			MemberDTO user = result.get(0);
			session.setAttribute("user", user);
			System.out.println(dto.getEmail());
		}
		mav.addObject("result",result.size());
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
	public ModelAndView SigninProc(String mail,String pw, String name,int age) {
		ModelAndView mav = new ModelAndView();
	
		MemberDTO dto = new MemberDTO(mail,pw,name,age);
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
	
	@RequestMapping("/editProfile.do")
	public String updateProfile(MemberDTO dto) {
		int result = service.updateUserData(dto);
		String resultmsg = result>0?"�꽦怨�":"�떎�뙣";
		System.out.println(resultmsg);
		return "redirect:mypage.go";
	}
}
