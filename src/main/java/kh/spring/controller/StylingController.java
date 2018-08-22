package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.StylingVoteDTO;
import kh.spring.interfaces.IStylingService;

@Controller
public class StylingController {
	
	@Autowired
	private IStylingService styservice;
	
	@RequestMapping("/insertStylingVote.style")
	public ModelAndView test(HttpSession session, StylingVoteDTO svdto, @RequestParam("file") MultipartFile uploadfile) {
		System.out.println(svdto.getStyling_vote_title());
		
		ModelAndView mav = new ModelAndView();
		MemberDTO user =(MemberDTO)session.getAttribute("user");				
		svdto.setStyling_writer(user.getSeq());
		
		int insertResult =styservice.insertStylingVote(svdto);
		mav.addObject("result",insertResult);
		mav.setViewName("stylingBoard.jsp");
		return mav;
	}
	
}
