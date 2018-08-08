package kh.spring.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IMemberService;

@Controller
public class FileController {
	@Autowired
	private IMemberService service;
	
	private String path = "D:/upload/";
	
	@RequestMapping("/editProfileImg")
	public String editProfileImg(MultipartFile uploadfile, HttpSession session) {
		if(uploadfile != null) {
			File file = new File(path);
			
			String ofileName = uploadfile.getOriginalFilename();
			String sfileName = "";
			if (ofileName != null && !ofileName.equals("")) {
				if(file.exists()) {
					sfileName = System.currentTimeMillis() + "_" + ofileName;
					file = new File(path+sfileName);
				}
			}
			
			MemberDTO dto = (MemberDTO)session.getAttribute("user");
			dto.setPhoto(sfileName);

			try {
				uploadfile.transferTo(file);
				service.updateUserData(dto);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return "redirect:myinfo.go";
	}
}
