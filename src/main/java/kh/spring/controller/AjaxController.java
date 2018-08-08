package kh.spring.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class AjaxController {
	@Autowired
	private IMemberService service;
	
	
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
}
