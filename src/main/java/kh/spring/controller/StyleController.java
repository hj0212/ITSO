package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.StyleBoardCommentDTO;
import kh.spring.dto.StyleBoardDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.IStyleBoardCommentService;
import kh.spring.interfaces.IStyleBoardService;

@Controller
public class StyleController {	
	@Autowired
	private IStyleBoardService sbservice;
	@Autowired
	private IStyleBoardCommentService sbcservice;
	@Autowired
	private IMemberService mservice;
	
	@RequestMapping("/style.go")
	public ModelAndView showStyleBoard(HttpSession session) {
		List<StyleBoardDTO> result = this.sbservice.showStyleBoard();
		List<StyleBoardCommentDTO> result1 = this.sbcservice.showStyleComment();
		//멤버dto에서 사진 가져올것, 서비스에 해당 유저정보 보여주는거 작성해야함.
		//List<MemberDTO> result2 = this.mservice.
		System.out.println("스타일보드" +result);
		System.out.println("스타일보드코멘트" +result1);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("result1", result1);
		mav.setViewName("styleShareBoard.jsp");
		return mav;
	}
	
	@RequestMapping("/styleCommentdelete.go")
	@Transactional
	public ModelAndView deleteStyleComment(StyleBoardCommentDTO sbcdto) {			
		int result= this.sbcservice.deleteStyleComment(sbcdto);
		System.out.println("넘어오는 스퀀스값1 : " + sbcdto.getStyling_comment_seq());		
		System.out.println("리절트값 : " + result);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commetResult",result);
		mav.setViewName("styleBoardCommentDeleteProcView.jsp");
		return mav;		
	}


}
