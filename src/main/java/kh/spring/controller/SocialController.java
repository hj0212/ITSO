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
		System.out.println(dto.getSocial_gender());
		System.out.println(dto.getSocial_age());
		
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
				
				SocialTagDTO stdto = new SocialTagDTO(social_seq,tag_name,tag_brand,tag_store,tag_url,tag_lat,tag_along,tag_category);
				tagService.insertSocialTag(stdto);
			}
			
		}
		
//		mav.setViewName("readSocial.jsp");
//		return mav;
	}
}
