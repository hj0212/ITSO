package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.StyleBoardDTO;
import kh.spring.interfaces.IStyleBoardService;

@Controller
public class StyleController {	
	@Autowired
	private IStyleBoardService sbservice;
	
	@RequestMapping("/style.go")
	public ModelAndView showStyleBoard(HttpSession session) {
		List<StyleBoardDTO> result = this.sbservice.showStyleBoard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("styleShareBoard.jsp");
		return mav;
	}
	
	//@RequestMapping("/styleComment.go")

}
