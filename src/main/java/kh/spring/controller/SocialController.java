package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;

	@RequestMapping("/main.go")
	public ModelAndView showSocialBoardList(HttpSession session,HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		String main =null;
		String gender =null;
		String age =null;

		String pGender =null;
		int pAge =0;
		//여기는 성별입니다.
		try {
			gender =	request.getParameter("gender");		 
			pGender = request.getParameter("gender");
			if(pGender.equals("")) {
				pGender=null;
			}
			if(gender.equals("f")) {
				gender = "여성";
			}else if(gender.equals("m")) {
				gender =" 남성";
			}else {
				gender ="무관";
			}
		}catch(Exception e2) {
			gender ="무관";			
		}

		try {
			pAge =Integer.parseInt(request.getParameter("age"));
			age = request.getParameter("age");
			if(pAge==0) {
				pAge=0;
			}
			if(age.equals("10")) {
				age="10대";
			}else if(age.equals("20")) {
				age="20대";
			}else if(age.equals("30")) {
				age="30대";
			}else if(age.equals("40")) {
				age="40대";
			}else {
				age="모든연령";
			}

		}catch(Exception e3) {
			age="모든연령";
		}

		try {
			main = request.getParameter("main");
			if(main.equals("full")) {
				mav.setViewName("main.jsp");
			}else if(main.equals("tumbnail")) {
				mav.setViewName("main3.jsp");
			}else {
				mav.setViewName("main.jsp");
			}


		}catch(Exception e4) {
			mav.setViewName("main.jsp");
		}


		SocialBoardDTO sdto = new SocialBoardDTO(pAge,pGender);
		List<SocialBoardDTO> result = this.service.showSocialBoardList(sdto);

		List<Integer> ggdto = new ArrayList<>();
		for(SocialBoardDTO sdd : result) {	
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq());
			ggdto.add(this.service.allGoodCount(gdto)) ;
			
			/*System.out.println(ggdto);*/

		}

		int user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		List<Integer> goodCount = new ArrayList<>();
		for(SocialBoardDTO sdd : result) {
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq(),user_seq);
			goodCount.add(this.service.selectGoodCount(gdto));
			/*System.out.println("goodCount"+goodCount);*/
		}
		
		
		try {
			/*System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());*/
			List<CollectionDTO> collectionList = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.service.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> goodList = this.service.getMyGoodSocialList((MemberDTO)session.getAttribute("user"));
			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
			mav.addObject("goodList", goodList);
		}catch(NullPointerException e) {
			/*		System.out.println("로그인x");*/
		}finally {
			mav.addObject("goodCount",goodCount);
			mav.addObject("heart",ggdto);
			mav.addObject("pAge",pAge);
			mav.addObject("main", main);
			mav.addObject("pGender",pGender);
			mav.addObject("gender",gender);		
			mav.addObject("age",age);
			mav.addObject("socialList",result);

		}
		return mav;
	}



}
