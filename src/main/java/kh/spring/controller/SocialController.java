package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;
	
	@RequestMapping("/main.go")
	public ModelAndView showSocialBoardList(HttpSession session) {
		List<SocialBoardDTO> result = this.service.showSocialBoardList();
		List<CollectionDTO> result2 = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("socialList",result);
		mav.addObject("collectionList",result2);
		mav.setViewName("main2.jsp");
		return mav;
	}
	
	

}
