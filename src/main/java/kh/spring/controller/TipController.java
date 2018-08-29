package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kh.spring.dto.MemberDTO;
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
	@ResponseBody
	public int tipArticleLikeProc(@RequestParam int tipSeq, @RequestParam int tipLikingUser, Model model) {

		System.out.println(tipSeq + ":" + tipLikingUser);

		List<TipGoodDTO> isThisLikeWhetherFirst = service.isThisLikeWhetherFirst(tipSeq, tipLikingUser);

		int result = 0;
		// To check whether the clicking user did it before or not
		if (isThisLikeWhetherFirst.isEmpty()) { // true
			result = service.tipArticleLikeProc(tipSeq, tipLikingUser);
		}

		if (result > 0) {
			System.out.println("글번호 " + tipSeq + " 좋아요 +1 성공 by " + tipLikingUser);
		} else {
			System.out.println("Ajax Error!");
			return 9; // it has already liked before, so return 9 to tipSpecificArticleView.jsp
		}
		return result;
	}

	@RequestMapping("insertTipCommentProc.tip")
	public void insertTipCommentProc(@RequestBody TipCommentDTO dto, HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println(1);
			System.out.println(dto.toString());

			int result = service.insertTipCommentProc(dto);
			int writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();
			
			ObjectMapper om = new ObjectMapper();
			List<TipCommentDTO> commentList = service.getCommentsFromTip(dto.getTip_seq());
			ArrayNode array = om.createArrayNode();
			
			for(TipCommentDTO tdto : commentList) {
				ObjectNode on = om.createObjectNode();
				on.put("tip_comment_seq", tdto.getTip_comment_seq());
				on.put("tip_seq", tdto.getTip_seq());
				on.put("user_seq", tdto.getUser_seq());
				on.put("tip_comment_contents", tdto.getTip_comment_contents());
				on.put("tip_comment_time", tdto.getTip_comment_time());
				on.put("name", tdto.getName());
				on.put("photo", tdto.getPhoto());
				on.put("writer", writer);
				
				array.add(on);
			}
			
			response.getWriter().println(array);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("deleteSpecificTip.tip")
	public @ResponseBody int deleteSpecificTip(@RequestParam int tipSeq) {

		System.out.println(tipSeq);
		int result = service.deleteSpecificTip(tipSeq);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("deleteTipComment.tip")
	public void deleteTipComment(HttpServletRequest request, HttpServletResponse response) {
		try {
			ObjectMapper om = new ObjectMapper();
			int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
			int tip_seq = Integer.parseInt(request.getParameter("tip_seq"));
			int result = service.deleteTipComment(comment_seq);
			int writer = ((MemberDTO)request.getSession().getAttribute("user")).getSeq();
			
			List<TipCommentDTO> commentList = service.getCommentsFromTip(tip_seq);
			ArrayNode array = om.createArrayNode();
			
			for(TipCommentDTO tdto : commentList) {
				ObjectNode on = om.createObjectNode();
				on.put("tip_comment_seq", tdto.getTip_comment_seq());
				on.put("tip_seq", tdto.getTip_seq());
				on.put("user_seq", tdto.getUser_seq());
				on.put("tip_comment_contents", tdto.getTip_comment_contents());
				on.put("tip_comment_time", tdto.getTip_comment_time());
				on.put("name", tdto.getName());
				on.put("photo", tdto.getPhoto());
				on.put("writer", writer);
				
				array.add(on);
			}
			
			response.getWriter().println(array);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
