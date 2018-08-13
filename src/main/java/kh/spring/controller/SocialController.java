package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;
	
	@RequestMapping("/Main2.go")
	public ModelAndView showSocialBoardList(SocialBoardDTO dto) {	
		System.out.println(dto.getSocial_title() + " : " + dto.getSocial_writer());
		List<SocialBoardDTO> result = this.service.showSocialBoardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("Main2.jsp");
		return mav;
	}
	
	
	@RequestMapping("/test.go")
	public ModelAndView test(HttpServletRequest request) {
		System.out.println(request.getParameter("stylename"));
		System.out.println(request.getParameter("stylecontent"));
		System.out.println(request.getParameter("gender"));
		System.out.println(request.getParameter("age"));
		System.out.println(request.getParameter("taginfo"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("writeSocial.jsp");
		return mav;
	}
}
