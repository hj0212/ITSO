package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipService;

@Controller
public class TipController {

	@Autowired
	private ITipService service;

	@RequestMapping("/tipInsertProc.tip")
	public @ResponseBody int tipWriteProc(@RequestBody TipDTO dto) {

		System.out.println(dto.toString());
		System.out.println("------------------------------------------------------------------------");
		System.out.println(dto.getTip_title());
		System.out.println(dto.getTip_contents());
		System.out.println(dto.getTip_writer());
		System.out.println(dto.getTip_date());
		System.out.println(dto.getTip_viewcount());
		System.out.println(dto.getCategory());
		int result = service.insertTipData(dto);
		return result;
	}

	@RequestMapping("tipBoardMainPage.go")
	public String goTipBoardHome() {
		return "redirect:tipBoardMainPage.jsp";
	}

	@RequestMapping("tipInsertPage.go")
	public String goTipInsertPage() {
		return "redirect:tipInsertPage.jsp";
	}

	@RequestMapping("tipBoardMainPage.tip")
	public ModelAndView tipBoardMainPageWithAllData() {

		ModelAndView mav = new ModelAndView();
		List<TipDTO> beautyTipData = service.getBeautyTipData();
		List<TipDTO> dietTipData = service.getDietTipData();
		List<TipDTO> fashionTipData = service.getFashionTipData();
		List<TipDTO> businessTipData = service.getBusinessTipData();

		if (beautyTipData != null) {
			System.out.println(beautyTipData.toString());

		} else {
			return null;
		}

		mav.addObject("beautyTipData", beautyTipData);
		mav.addObject("dietTipData", dietTipData);
		mav.addObject("fashionTipData", fashionTipData);
		mav.addObject("businessTipData", businessTipData);

		mav.setViewName("tipBoardMainPage.jsp");
		return mav;
	}

	@RequestMapping("getSpecificTipView.tip")
	public ModelAndView getSpecificTipView(HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		System.out.println(seq);

		List<TipDTO> tipContent = service.getSpecificTipView(seq);

		System.out.println(tipContent);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("tipContent", tipContent);
		mav.setViewName("tipSpecificArticleView.jsp");
		return mav;
	}

}
