package kh.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.FollowDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.NotificationDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.INotificationService;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.websocket.EchoHandler;

@Controller
public class AjaxController {
	@Autowired
	private IMemberService service;
	@Autowired
	private ISocialBoardService sservice;
	
	@Autowired
	private INotificationService noservice;
	
	@Autowired
	private ISocialBoardService sbService;


	
	@RequestMapping("/emailcheck.ajax")
	public @ResponseBody String emailExist(String email,HttpServletResponse response) {
		System.out.println(email);
		List<MemberDTO> emailcheck = service.emailExist(email);
		String msg =null;
		
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
	public @ResponseBody int mainHeart(int social_seq,int social_writer,HttpServletResponse response,HttpSession session) {				
		int user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		GoodDTO gdto = new GoodDTO(social_seq,user_seq);
		
		int goodCount = sbService.selectGoodCount(gdto);
		System.out.println(goodCount);
			
		if(goodCount>0) {
			int delete = sbService.deleteGoodCount(gdto);
		}else {
			int insert = sbService.insertGoodCount(gdto);
			
			if(user_seq != social_writer) {
				NotificationDTO nodto = new NotificationDTO(social_writer,user_seq,"good","좋아요를 눌렀습니다.","n","아무거나",social_seq);
				int noInsert = noservice.insertNotification(nodto);
				
				NotificationDTO list = noservice.selectNotification(nodto).get(0);
				System.out.println(list);
					try {
						ObjectMapper mapper = new ObjectMapper();
						String jsonString  = mapper.writeValueAsString(list);
						System.out.println(jsonString);
						EchoHandler.users.get(nodto.getUser_seq()).getBasicRemote().sendText(jsonString);
					}catch(Exception e) {
						e.printStackTrace();
					}
			}
		}
		
		int count = sbService.allGoodCount(gdto);
		System.out.println("작성자"+social_writer);
		System.out.println("게시물번호"+social_seq);
		System.out.println("누른사람 번호"+user_seq);
		return count;
	}
	
	
	@RequestMapping("/saveCollection.ajax")
	public @ResponseBody Object saveCollection(int collection_seq, int social_seq, HttpSession session) {
		System.out.println("ajax:"+collection_seq+":"+social_seq);
		SocialBoardDTO dto = new SocialBoardDTO();
		dto.setCollection_seq(collection_seq);
		dto.setSocial_seq(social_seq);
		
		List<SocialBoardDTO> list = sservice.selectCollectionContent(dto);	// 테이블에 있는지
		
		SocialBoardDTO result = null;
		if(list.size() > 0) {
			int delete = sservice.deleteCollectionContent(dto);
			System.out.println(delete>0?"delete성공":"delete실패");
			result = dto;
		}else {
			int insert = sservice.insertCollectionContent(dto);
			System.out.println(insert>0?"insert성공":"insert실패");
			result = sservice.selectSocialBoard(social_seq);
		}
		return result;
	}
	
	@RequestMapping("/createCollection.ajax")
	public @ResponseBody void createCollection(String collection_title, String collection_contents, HttpSession session) {
		int seq = ((MemberDTO)session.getAttribute("user")).getSeq();
		CollectionDTO dto = new CollectionDTO();
		dto.setCollection_title(collection_title);
		dto.setCollection_contents(collection_contents);
		dto.setWriter(seq);
		System.out.println(dto.getCollection_title()+":"+dto.getCollection_contents());
		int result = sservice.insertCollection(dto);
		String resultmsg = result>0?"생성성공":"생성실패";
		System.out.println(resultmsg);
	}
	
	@RequestMapping("/removeCollection.ajax")
	public @ResponseBody void removeCollection(int collection_seq) {
		CollectionDTO dto = new CollectionDTO();
		dto.setCollection_seq(collection_seq);
		int result = sservice.deleteCollection(dto);
		String resultmsg = result>0?"삭제성공":"삭제실패";
		System.out.println(resultmsg);
	}
	
	@RequestMapping("/editCollection.ajax")
	public @ResponseBody void editCollection(CollectionDTO dto) {
		System.out.println(dto.getCollection_seq()+":"+dto.getCollection_title());
		int result = sservice.updateCollection(dto);
		String resultmsg = result>0?"수정성공":"수정실패";
		System.out.println(resultmsg);
	}
	
	@RequestMapping("/followUser.ajax")
	public @ResponseBody String followProc(int seq, String text, HttpSession session, HttpServletResponse resp) {
		FollowDTO dto = new FollowDTO();
		int user_seq = ((MemberDTO)session.getAttribute("user")).getSeq();

		dto.setUser_seq(user_seq);
		dto.setFollowing_seq(seq);
		
		System.out.println("text:" + text);
		String resultmsg = "";
		if(text.contains("언팔로우")) {
			int result = service.deleteFollowData(dto);
			resultmsg = result>0?"언팔로우성공":"언팔로우실패";
			System.out.println(resultmsg);
		} else {
			int result = service.insertFollowData(dto);
			resultmsg = result>0?"팔로우성공":"팔로우실패";
			System.out.println(resultmsg);
		}
		return resultmsg;
	}
	
	
}
