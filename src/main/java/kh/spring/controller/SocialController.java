package kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import kh.spring.dto.CollectionDTO;
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
	public ModelAndView showSocialBoardList(HttpSession session, HttpServletRequest request) {
		List<SocialBoardDTO> result = this.service.showSocialBoardList();
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());
			List<CollectionDTO> collectionList = this.service.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.service.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));

			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
		}catch(NullPointerException e) {
			System.out.println("로그인x");
		}finally {
			mav.addObject("socialList",result);
			mav.setViewName("main3.jsp");
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
	public ModelAndView readSocial(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		long dummy = System.currentTimeMillis();
		// json에 넣을 순번
		int i = 0;
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		SocialBoardDTO dto = service.selectSocialBoard(seq);
		String[] writeDate = dto.getSocial_date().toString().split("-");
		
		int social_seq = dto.getSocial_seq();
		List<SocialTagDTO> list = tagService.showSelectedTagList(social_seq);
		System.out.println(dto.getSocial_date());
		// image_db -> {} -> 0 : {}, 1 : {}
		ObjectNode infoNode = om.createObjectNode();
		// 각 태그
		ObjectNode objNodeNumber = om.createObjectNode();
		
		if(list.size() == 0) {
			mav.addObject("markerdata","{}");
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
		
		mav.addObject("content",dto);
		mav.addObject("date",writeDate);
		mav.addObject("src", dto.getPhoto());
		mav.addObject("dummy",dummy);
		mav.setViewName("styleShareBoard.jsp");
		return mav;
	}


	@Transactional
	@RequestMapping("/insertSocial.go")
	public void insertSocial(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String title = request.getParameter("stylename");
		String content = request.getParameter("stylecontent");
		//int writer = 글쓴이
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String photo = request.getParameter("imageinfo");

		SocialBoardDTO dto = new SocialBoardDTO(title, content, 0, photo, gender, age);
//		System.out.println(dto.getSocial_title());
//		System.out.println(dto.getSocial_contents());
//		System.out.println(dto.getSocial_writer());
//		System.out.println(dto.getPhoto());
//		System.out.println(dto.getSocial_gender());
//		System.out.println(dto.getSocial_age());
		
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
				
				SocialTagDTO stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
				tagService.insertSocialTag(stdto);
			}
			
		}
		
//		mav.setViewName("readSocial.jsp");
//		return mav;
	}
	
	@Transactional
	@RequestMapping("/modifySocial.go")
	public ModelAndView modifySocial(HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		ObjectMapper om = new ObjectMapper();
		int social_seq = Integer.parseInt(request.getParameter("seq"));
		int i = 0;
		long dummy = System.currentTimeMillis();
		
		SocialBoardDTO sbdto = service.selectSocialBoard(social_seq);
		mav.addObject("sbdto",sbdto);
		
		List<SocialTagDTO> list = tagService.showSelectedTagList(social_seq);
		
		ObjectNode infoNode = om.createObjectNode();
		// 각 태그
		ObjectNode objNodeNumber = om.createObjectNode();
		
		if(list.size() == 0) {
			mav.addObject("markerdata", "{}");
			mav.addObject("dataflag","false");
		}else {
			for(SocialTagDTO tag : list) {
				// tag 하나당 넣어야 하는 객체
				ObjectNode objNode = om.createObjectNode();
				// 좌표를 넣을 객체
				ObjectNode objNodeCoords = om.createObjectNode();
				objNode.put("name", tag.getTag_name());
				
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
			canvas.put("src", "upload/social/"+sbdto.getPhoto());
			canvas.put("width", 500);
			canvas.put("height", 500);
			
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
		
		mav.addObject("dummy", dummy);
		mav.addObject("seq",social_seq);
		mav.setViewName("modifySocial.jsp");
		return mav;
	}
	
	@Transactional
	@RequestMapping("/modifySocialProc.go")
	public ModelAndView modifySocialProc(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String title = request.getParameter("stylename");
		String content = request.getParameter("stylecontent");
		// int writer = 글쓴이
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String photo = request.getParameter("imageinfo");
		// 수정된 글 번호
		int social_seq = Integer.parseInt(request.getParameter("seq"));
		
		SocialBoardDTO dto = new SocialBoardDTO(social_seq,title,content,0,photo,gender,age);
		
//		System.out.println(dto.getSocial_title());
//		System.out.println(dto.getSocial_contents());
//		System.out.println(dto.getSocial_writer());
//		System.out.println(dto.getPhoto());
//		System.out.println(dto.getSocial_gender());
//		System.out.println(dto.getSocial_age());
		
		// 글 수정
		service.updateSocialBoard(dto);
		
		// 태그 정보
		String taginfo = request.getParameter("taginfo");
		//System.out.println(taginfo);
		
		if(taginfo.equals("{}")) {
			System.out.println("태그가 없음 : 파일만 저장");
		} else {
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
				String tag_key = myObjects[i].getKey();
				
				if(!tag_url.startsWith("http://")) {
					myObjects[i].setUrl("http://"+myObjects[i].getUrl());
					tag_url = myObjects[i].getUrl();
				}
				SocialTagDTO stdto;
				if(myObjects[i].getKey().equals("un")) {
					stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
					tagService.insertSocialTag(stdto);
					myObjects[i].setKey(tagService.getSocialTagcurrval()+"");
				}else {
					stdto = new SocialTagDTO(Integer.parseInt(tag_key),social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
					tagService.updateSocialTag(stdto);
				}
			}
			
			List<SocialTagDTO> tagList = tagService.showSelectedTagList(social_seq);
			
			for(int i = 0; i < myObjects.length; i++) {
				for(int j = 0; j < tagList.size(); j++) {
					if(tagList.get(j).getTag_seq() == Integer.parseInt(myObjects[i].getKey())) {
						tagList.remove(tagList.get(j));
					}
				}
			}
			
			for(SocialTagDTO tagdto : tagList) {
				tagService.deleteSocialTag(tagdto.getTag_seq());
			}
		}
		
		mav.setViewName("redirect:readSocial.go?seq="+social_seq);
		return mav;
	}
}
