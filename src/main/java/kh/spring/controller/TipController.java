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
	public ModelAndView tipBoardMainPageWithAllData(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		List<TipDTO> upvotingArticles = service.getUpvotingArticles();
		String category = request.getParameter("category");
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		int totalCount = service.getTipBoardCount(category);
		// 한 페이지당 들어갈 글 수
		int countList = 10;
		
		int totalPage = totalCount / countList;
		
		if(totalCount > countList * totalPage) {
			totalPage++;
		}
		
		if(totalPage < page) {
			page = totalPage;
		}
		
		int countPage = 5;
		
		int startPage = ((page - 1) / countPage) * countPage + 1;
		int endPage = startPage + countPage - 1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		
		if(page > 1) {
			System.out.println("<a href=\"page=" + (page-1) + "\">이전</a>");
		}
		
		for (int i = startPage; i <= endPage; i++) {
			if(i == page) {
				System.out.println("<b>"+i+"</b>");
			}else {
				System.out.println(" " + i + " ");
			}
		}
		
		if(page < totalPage) {
			System.out.println("<a href=\"?page=" + (page + 1)  + "\">다음</a>");
		}
		
		int startCount = (page - 1) * countList + 1;
		int endCount = page * countList;
		List<TipDTO> tipBoardList = service.getTipBoardListRange(category, startCount, endCount);
		
		
		
		for(TipDTO dto : tipBoardList) {
			System.out.println(dto.getName());
		}
		
		

		mav.addObject("tipBoardList", tipBoardList);
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
	public void insertTipCommentProc(@RequestBody TipCommentDTO dto, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			System.out.println("댓글 등록~");

			int writer = ((MemberDTO) request.getSession().getAttribute("user")).getSeq();
			System.out.println(dto.getUser_seq());
			System.out.println(writer);
			int result = service.insertTipCommentProc(dto);

			ObjectMapper om = new ObjectMapper();
			List<TipCommentDTO> commentList = service.getCommentsFromTip(dto.getTip_seq());
			ArrayNode array = om.createArrayNode();

			for (TipCommentDTO tdto : commentList) {
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
		} catch (Exception e) {
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

	@RequestMapping("tipModification.go")
	public ModelAndView tipModificationGo(HttpServletRequest req) {

		int tipSeq = Integer.parseInt(req.getParameter("tipSeq"));
		System.out.println(tipSeq);

		ModelAndView mav = new ModelAndView();
		mav.addObject("tipSeq",tipSeq);
		mav.setViewName("tipModifyPage.jsp");
	
		return mav;
	}

	@RequestMapping("tipModifyProc.tip")
	public @ResponseBody int tipModifyProc(@RequestBody TipDTO dto) {
		
		
		dto.toString();
		int result = service.tipModifyProc(dto);
		System.out.println("tipModify result :" + result);
		
		return result;
	}
	
	
	@RequestMapping("deleteTipComment.tip") //창영 댓글 지우기 기능
	public void deleteTipComment(HttpServletRequest request, HttpServletResponse response) {
		try {
			ObjectMapper om = new ObjectMapper();
			int comment_seq = Integer.parseInt(request.getParameter("comment_seq"));
			int tip_seq = Integer.parseInt(request.getParameter("tip_seq"));
			int result = service.deleteTipComment(comment_seq);
			int writer = ((MemberDTO) request.getSession().getAttribute("user")).getSeq();

			List<TipCommentDTO> commentList = service.getCommentsFromTip(tip_seq);
			ArrayNode array = om.createArrayNode();

			for (TipCommentDTO tdto : commentList) {
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
