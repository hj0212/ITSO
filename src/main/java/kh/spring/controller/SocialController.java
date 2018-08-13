package kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.type.TypeFactory;

import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.jsonobject.SocialTag;

@Controller
public class SocialController {
	@Autowired
	private ISocialBoardService service;
	
	@RequestMapping("/Main2.go")
	public ModelAndView showSocialBoardList(SocialBoardDTO dto) {	
		System.out.println(dto.getSocial_title() + " : " + dto.getSocial_writer());
		List<SocialBoardDTO> result = this.service.showSocialBoardList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("Main2.jsp");
		return mav;
	}
	
	
	@Transactional
	@RequestMapping("/test.go")
	public ModelAndView test(HttpServletRequest request) throws IOException {
		String title = request.getParameter("stylename");
		String content = request.getParameter("stylecontent");
//		String writer = 글쓴이
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		String photo = request.getParameter("imageinfo");
		
		SocialBoardDTO dto = new SocialBoardDTO(title, content, 0, photo, gender, age);
		System.out.println(dto.getSocial_title());
		System.out.println(dto.getSocial_contents());
		System.out.println(dto.getSocial_writer());
		System.out.println(dto.getPhoto());
		System.out.println(dto.getSocial_gender());
		System.out.println(dto.getSocial_age());
		
		service.insertSocialBoard(dto);
		
		// 글 번호
		int social_seq = service.getSocialBoardcurrval();
		
		// 태그 정보
		String taginfo = request.getParameter("taginfo");
		
		if(taginfo.equals("{}")) {
			System.out.println("태그가 없음");
		}else {
			ObjectMapper om = new ObjectMapper();
			om.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
			SocialTag[] myObjects = om.readValue(taginfo, SocialTag[].class);
			
			// 오브젝트 세개 image_db -> {} -> 0 : {} ,1 : {} , 2 : {}...
			ObjectNode InfoNode = om.createObjectNode();
			// 각 태그
			ObjectNode objNodeNumber = om.createObjectNode();
			for(int i = 0; i < myObjects.length; i++) {
				// tag 하나당 넣어야 하는 객체
				ObjectNode objNode = om.createObjectNode();
				// 좌표를 넣을 객체
				ObjectNode objNodeCoords = om.createObjectNode();
				
				objNode.put("name",myObjects[i].getName());
				objNode.put("brand",myObjects[i].getBrand());
				objNode.put("store",myObjects[i].getStore());
				objNode.put("url",myObjects[i].getUrl());
				objNode.put("category",myObjects[i].getCategory());
				
				// 좌표
				objNodeCoords.put("lat", Double.parseDouble(myObjects[i].getCoords().getLat()));
				objNodeCoords.put("along", Double.parseDouble(myObjects[i].getCoords().getAlong()));
				
				objNode.put("coords", objNodeCoords);
				
				objNodeNumber.put(i+"", objNode);
			}
			
			// canvs 객체 추가
			ObjectNode canvas = om.createObjectNode();
			canvas.put("width", 500);
			canvas.put("height", 500);
			canvas.put("src", "upload/social/"+request.getParameter("imageinfo"));
			
			objNodeNumber.put("canvas", canvas);
			InfoNode.put("image_db", objNodeNumber);
			
			String json = om.writeValueAsString(InfoNode);
			request.setAttribute("markerdata", json);
		}
		request.setAttribute("src", request.getParameter("imageinfo"));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NewFile.jsp");
		return mav;
	}
}
