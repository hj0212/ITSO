package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.interfaces.IMemberService;

@Controller
public class FileController {
	@Autowired
	private IMemberService service;
	
	@RequestMapping("/editProfileImg")
	public void editProfileImg(HttpServletRequest request, HttpServletResponse response) {
		
		
		
	}
}
