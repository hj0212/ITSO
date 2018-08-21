package kh.spring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.dto.SocialTagDTO;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.interfaces.ISocialTagService;
import kh.spring.jsonobject.SocialTag;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;
	@Autowired 
	ISocialTagService tagService;

	@RequestMapping("/main.go")
	public ModelAndView showSocialBoardList(HttpSession session,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int user_seq = 0;
		try {
			user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		} catch(Exception e) {
			mav.setViewName("login.go");
			return mav;
		}

		
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
			}else if(main.equals("thumbnail")) {
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
	
	@RequestMapping("/collection.go")
	public ModelAndView showCollectionList(int seq) {
		CollectionDTO dto = new CollectionDTO();
		dto.setCollection_seq(seq);
		List<CollectionDTO> clist = service.getCollectionData(dto);
		List<SocialBoardDTO> list = service.getCollectionSocialList(dto);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("collectionList", clist);
		mav.addObject("socialList", list);
		mav.setViewName("collection.jsp");
		return mav;
	}
	
	@Transactional
	@RequestMapping("/readSocial.go")
	public ModelAndView gogo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		// json에 넣을 순번
		int i = 0;
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		SocialBoardDTO dto = service.selectSocialBoard(seq);
		
		int social_seq = dto.getSocial_seq();
		List<SocialTagDTO> list = tagService.showSelectedTagList(social_seq);
		
		// image_db -> {} -> 0 : {}, 1 : {}
		ObjectNode infoNode = om.createObjectNode();
		// 각 태그
		ObjectNode objNodeNumber = om.createObjectNode();
		
		if(list.size() == 0) {
			mav.addObject("marerdata","{}");
			mav.addObject("dataflag","false");
		} else {
			for(SocialTagDTO tag : list) {
				// tag 하나당 넣어야 하는 객체
				ObjectNode objNode = om.createObjectNode();
				// 좌표를 넣을 객체
				ObjectNode objNodeCoords = om.createObjectNode();
				objNode.put("name", tag.getTag_name());
				
				if(tag.getTag_store() == null) {
					tag.setTag_store("");
				}
				
				if(tag.getTag_url() == null) {
					tag.setTag_url("#");
				}
				
				if(tag.getTag_category() == null) {
					tag.setTag_category("");
				}
				
				objNode.put("brand", tag.getTag_brand());
				objNode.put("store", tag.getTag_store());
				objNode.put("url", tag.getTag_store());
				objNode.put("category", tag.getTag_category());
				objNode.put("key", tag.getTag_seq());
				
				// 좌표
				objNodeCoords.put("lat", Double.parseDouble(tag.getTag_lat()));
				objNodeCoords.put("along", Double.parseDouble(tag.getTag_along()));
				
				objNode.put("coords", objNodeCoords);
				
				objNodeNumber.put(i++ +"", objNode);
			}
			
			// canvas 객체 추가
			ObjectNode canvas = om.createObjectNode();
			canvas.put("width", 500);
			canvas.put("height", 500);
			canvas.put("src", "upload/social/"+dto.getPhoto());
			
			objNodeNumber.put("canvas", canvas);
			infoNode.put("image_db", objNodeNumber);
			
			String json = "";
			try {
				json = om.writeValueAsString(infoNode);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			
			mav.addObject("list",list);
			mav.addObject("markerdata", json);
			mav.addObject("dataflag","true");
		}
		
		mav.addObject("src", dto.getPhoto());
		mav.setViewName("styleShareBoard.jsp");
		return mav;
	}


	@Transactional
	@RequestMapping("/insertSocial.go")
	public void test(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		String title = request.getParameter("stylename");
		String content = request.getParameter("stylecontent");
		//String writer = 글쓴이
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String photo = request.getParameter("imageinfo");

		SocialBoardDTO dto = new SocialBoardDTO(title, content, 0, photo, gender, age);
		System.out.println(dto.getSocial_title());
		System.out.println(dto.getSocial_contents());
		System.out.println(dto.getSocial_writer());
		System.out.println(dto.getPhoto());
		System.out.println(dto.getGender());
		System.out.println(dto.getAge());
		
		// 글 작성
		service.insertSocialBoard(dto);
		
		// 작성된 글 번호
		int social_seq = service.getSocialBoardcurrval();

		// 태그 정보
		String taginfo = request.getParameter("taginfo");

		if(taginfo.equals("{}")) {
			System.out.println("태그가 없음 : 파일만 저장");
		}else {
			ObjectMapper om = new ObjectMapper();
			om.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
			SocialTag[] myObjects = om.readValue(taginfo, SocialTag[].class);

			for(int i = 0; i < myObjects.length; i++) {
				String tag_name = myObjects[i].getName();
				String tag_brand = myObjects[i].getBrand();
				String tag_store = myObjects[i].getStore();
				String tag_url = myObjects[i].getUrl();
				String tag_lat = myObjects[i].getCoords().getLat();
				String tag_along = myObjects[i].getCoords().getAlong();
				String tag_category = myObjects[i].getCategory();
				
				
				if(!tag_url.startsWith("http://")) {
					myObjects[i].setUrl("http://"+myObjects[i].getUrl());
					tag_url = myObjects[i].getUrl();
				}
				System.out.println(tag_url);
				SocialTagDTO stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
				tagService.insertSocialTag(stdto);
			}
			
		}
		
//		mav.setViewName("readSocial.jsp");
//		return mav;
	}
	
	
}
