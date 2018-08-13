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
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());
			List<CollectionDTO> collectionList = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.service.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));

			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
		}catch(NullPointerException e) {
			System.out.println("로그인x");
		}finally {
			mav.addObject("socialList",result);
			mav.setViewName("main3.jsp");
		}
		return mav;
	}



}
