package kh.spring.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class AjaxController {
	@Autowired
	private IMemberService service;
	@Autowired
	private ISocialBoardService sservice;
	
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
	
	@RequestMapping("/saveCollection.ajax")
	public @ResponseBody String saveCollection(int collection_seq, int social_seq, HttpSession session) {
		System.out.println("ajax:"+collection_seq+":"+social_seq);
		SocialBoardDTO dto = new SocialBoardDTO();
		dto.setCollection_seq(collection_seq);
		dto.setSocial_seq(social_seq);
		
		List<SocialBoardDTO> list = sservice.selectCollectionContent(dto);	// 테이블에 있는지
		
		String msg;
		if(list.size() > 0) {
			int delete = sservice.deleteCollectionContent(dto);
			System.out.println(delete>0?"delete성공":"delete실패");
			msg="delete";
		}else {
			int insert = sservice.insertCollectionContent(dto);
			System.out.println(insert>0?"insert성공":"insert실패");
			msg="insert";
		}
		return msg;
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
}
