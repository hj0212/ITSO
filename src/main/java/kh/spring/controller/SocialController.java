package kh.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	@RequestMapping("/test.go")
	public ModelAndView test(HttpServletRequest request) throws IOException {
		System.out.println(request.getParameter("stylename"));
		System.out.println(request.getParameter("stylecontent"));
		System.out.println(request.getParameter("gender"));
		System.out.println(request.getParameter("age"));
		System.out.println(request.getParameter("imageinfo"));
		String taginfo = request.getParameter("taginfo");
		
		if(taginfo.equals("{}")) {
			System.out.println("태그가 없음");
		}else {
			ObjectMapper om = new ObjectMapper();
			om.configure(DeserializationFeature.ACCEPT_SINGLE_VALUE_AS_ARRAY, true);
			
			SocialTag[] myObjects = om.readValue(taginfo, SocialTag[].class);
			
			System.out.println(myObjects.length);
			
//				System.out.println("===================");
//				System.out.println(dto.getName());
//				System.out.println(dto.getBrand());
//				System.out.println(dto.getStore());
//				System.out.println(dto.getUrl());
//				System.out.println(dto.getCategory());
//				System.out.println(dto.getCoords().getLat());
//				System.out.println(dto.getCoords().getAlong());
			
			System.out.println(myObjects.length);
			
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
				objNodeCoords.put("lat", myObjects[i].getCoords().getLat());
				objNodeCoords.put("along", myObjects[i].getCoords().getAlong());
				
				objNode.put("coords", objNodeCoords);
				
				objNodeNumber.put(i+"", objNode);
			}
			
			InfoNode.put("image_db", objNodeNumber);
			
			System.out.println(om.writerWithDefaultPrettyPrinter().writeValueAsString(InfoNode));
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("writeSocial.jsp");
		return mav;
	}
}
