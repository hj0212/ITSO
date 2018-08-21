package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.interfaces.IStylingService;

@Controller
public class StylingController {
	
	@Autowired
	private IStylingService styservice;
	
	@RequestMapping("/insertStylingVote.style")
	public void test(StylingVoteDTO svdto) {
		System.out.println(svdto.getStyling_vote_title());
		
	}
	
}
