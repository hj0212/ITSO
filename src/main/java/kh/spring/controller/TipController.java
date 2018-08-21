package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.TipCommentDTO;
import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;
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
		// List<TipDTO> tipThumpsUpCountData = service.getThumpsUpData(int seq);
		List<TipDTO> upvotingArticles = service.getUpvotingArticles();
		
		
		if (beautyTipData != null) {
			System.out.println(beautyTipData.toString());

		} else {
			return null;
		}

		mav.addObject("beautyTipData", beautyTipData);
		mav.addObject("dietTipData", dietTipData);
		mav.addObject("fashionTipData", fashionTipData);
		mav.addObject("businessTipData", businessTipData);
		// mav.addObject("tipThumpsUpCountData", tipThumpsUpCountData);
		mav.addObject("upvotingArticles", upvotingArticles);
		mav.setViewName("tipBoardMainPage.jsp");
		return mav;
	}

	@RequestMapping("getSpecificTipView.tip")
	public ModelAndView getSpecificTipView(HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		System.out.println(seq);
		List<TipDTO> tipContent = service.getSpecificTipView(seq);
		List<TipGoodDTO> tipLikeCounts = service.getTipLikeCounts(seq);
		List<TipCommentDTO> tipComments = service.getCommentsFromTip(seq);
		
		
		
		// viewcount +1
		int viewCountPlus = service.viewCountPlus(seq);
		if (viewCountPlus > 0) {
			System.out.println("ViewCount added +1");
		}

		System.out.println(tipContent);
		System.out.println(tipComments.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("tipContent", tipContent);
		mav.addObject("tipLikeCounts", tipLikeCounts);
		mav.addObject("tipComments", tipComments);
		mav.setViewName("tipSpecificArticleView.jsp");
		return mav;
	}

	@RequestMapping("tipArticleLikeProc.tip")
	public @ResponseBody int tipArticleLikeProc(@RequestParam int tipSeq) {
		int result = service.tipArticleLikeProc(tipSeq);
	
		if (result > 0) {
			System.out.println("글번호 " + tipSeq + " 좋아요 +1 성공");
		} else {
			System.out.println("Ajax Error!");
		}
		return result;
	}

	@RequestMapping("insertTipCommentProc.tip")
	public @ResponseBody int insertTipCommentProc(@RequestBody TipCommentDTO dto) {
	System.out.println(1);
		System.out.println(dto.toString());

		
		int result = service.insertTipCommentProc(dto);
		return result;
	}
	@RequestMapping("deleteSpecificTip.tip")
	public @ResponseBody int deleteSpecificTip(@RequestParam int tipSeq) {

		System.out.println(tipSeq);
		int result = service.deleteSpecificTip(tipSeq);
		System.out.println(result);
		return result;
		
	}
	
	
}
