package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.SearchedUserInfoDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class SearchController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/searchWord.se")
	public ModelAndView searchWord(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String word = request.getParameter("word");
		List<SearchedUserInfoDTO> userList = null;
		
		if(!word.trim().equals("")) {
			userList = this.service.getSearchedUserList(word);
		}
		
		mav.addObject("userList", userList);
		mav.setViewName("searchResults.jsp");
		return mav;
	}
}
