package kh.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class AjaxController {
	@Autowired
	private IMemberService service;
	
	@Autowired
	private ISocialBoardService sbService;
	
	@RequestMapping("/emailcheck.ajax")
	public @ResponseBody String emailExist(String email,HttpServletResponse response) {
		System.out.println("일단들어옴");
		System.out.println(email);
		List<MemberDTO> emailcheck = service.emailExist(email);
		String msg;
		
			System.out.println(emailcheck);
			if(emailcheck.size()==0) {
				System.out.println("성공");
				msg= "fa fa-check prefix";
				
			}else {
				System.out.println("실패");
				msg= "fa fa-close prefix";
			}
		
		try {
			URLEncoder.encode(msg,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("/mainHeart.ajax")
	public @ResponseBody int mainHeart(int social_seq,HttpServletResponse response,HttpSession session) {				
		int user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		GoodDTO gdto = new GoodDTO(social_seq,user_seq);
		
		int goodCount = sbService.selectGoodCount(gdto);
		System.out.println(goodCount);
			
		if(goodCount>0) {
			int delete = sbService.deleteGoodCount(gdto);
		}else {
			int insert = sbService.insertGoodCount(gdto);
		}
		
		int count = sbService.allGoodCount(gdto);
		
		System.out.println(social_seq);
		System.out.println(user_seq);
		
		
		return count;
		
	}
	
}
