package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	public ModelAndView test(HttpServletRequest request) throws JsonProcessingException {
		System.out.println(request.getParameter("stylename"));
		System.out.println(request.getParameter("stylecontent"));
		System.out.println(request.getParameter("gender"));
		System.out.println(request.getParameter("age"));
		String taginfo = request.getParameter("taginfo");
		
		if(taginfo.equals("{}")) {
			System.out.println("으악");
		}else {
			ObjectMapper om = new ObjectMapper();
			String sJson = om.writeValueAsString(taginfo);
			System.out.println(sJson);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("writeSocial.jsp");
		return mav;
	}
}
