package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.SearchedUserInfoDTO;
import kh.spring.exception.NotLoginException;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ITipService;

@Controller
public class SearchController {
	@Autowired
	private IMemberService service;
	
	@Autowired
	private ITipService tipService;
	
	@RequestMapping("/searchWord.se")
	public ModelAndView searchWord(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberDTO writer = ((MemberDTO)request.getSession().getAttribute("user"));
		
		try {
			if(writer == null) {
				throw new NotLoginException();
			}
			
			String word = request.getParameter("word");
			System.out.println(word);
			
			List<SearchedUserInfoDTO> userList = null;
			List<SearchedTipDTO> tipList = null;
			
			if(!word.trim().equals("")) {
				userList = this.service.getSearchedUserList(word);
				tipList = this.tipService.getSearchedTipList(word);
			}
			
			mav.addObject("userList", userList);
			mav.addObject("tipList", tipList);
			mav.setViewName("searchResults.jsp");
		}catch(NotLoginException e) {
			mav.setViewName("login.go");
		}
		return mav;
	}
}
