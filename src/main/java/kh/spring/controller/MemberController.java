package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/login.do")
	public String login(MemberDTO dto, HttpSession session) {
		System.out.println("여기");
		List<MemberDTO> result = service.loginExist(dto);
		MemberDTO user = result.get(0);
		session.setAttribute("user", user);
		return "loginProc.jsp";
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
