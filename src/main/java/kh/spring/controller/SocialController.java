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
		int user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();

		ModelAndView mav = new ModelAndView();
		String main =null;
		String gender =null;
		String age =null;

		String pGender =null;
		int pAge =0;
		//성별 나이 
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


		SocialBoardDTO sdto = new SocialBoardDTO(pAge,pGender,user_seq);

		List<SocialBoardDTO> result =null ;
		String feed=null;
		try {
			feed = request.getParameter("feed");
			System.out.println(feed);
			if(feed.equals("new")) { //최신
				result= this.service.showSocialBoardList(sdto);
				System.out.println("1");
				
			}else if(feed.equals("hot")) {//인기
				result = this.service.showSocialHotBoardList(sdto);
				
			
			}else if(feed.equals("following")) { //팔로잉
				result =this.service.showSocialFollowBoardList(sdto);
				System.out.println("3");

			}
		}catch(Exception ea) {
			result = this.service.showSocialBoardList(sdto);
			System.out.println("10");
			feed="new";
		}



		List<Integer> ggdto = new ArrayList<>();
		for(SocialBoardDTO sdd : result) {	
			GoodDTO gdto = new GoodDTO(sdd.getSocial_seq());
			ggdto.add(this.service.allGoodCount(gdto)) ;

			/*System.out.println(ggdto);*/

		}

		
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
			/*		System.out.println("濡쒓렇�씤x");*/
		}finally {

			mav.addObject("feed",feed);
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
