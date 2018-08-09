package kh.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IFileService;

@Controller
public class FileController {
	@Autowired
	private IFileService service;


	@RequestMapping("/editProfileImg.do")
	public String editProfileImg(@RequestParam("file") MultipartFile uploadfile, HttpSession session, HttpServletRequest request) {
		System.out.println("여기 : " + uploadfile);
		String path = request.getSession().getServletContext().getRealPath("/")+"upload/profile";
		System.out.println(path);

		if(uploadfile != null) {
			File file = new File(path);

			String ofileName = uploadfile.getOriginalFilename();
			String sfileName = "";
			if (ofileName != null && !ofileName.equals("")) {
				if(file.exists()) {
					sfileName = System.currentTimeMillis() + "_" + ofileName;
					System.out.println("sfileName : " + sfileName);
				}
			}

			MemberDTO dto = (MemberDTO)session.getAttribute("user");
			dto.setPhoto(sfileName);
			System.out.println("dto : " + dto.getPhoto() + "," + dto.getSeq());


			try {
				byte[] data = uploadfile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + sfileName);
				fos.write(data);
				fos.close();
				int result = service.editProfileImage(dto);
				System.out.println("result" + result);
				String resultmsg = result>0?"성공":"실패";
				System.out.println(resultmsg);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		System.out.println("저기");
		return "redirect:myinfo.go";
	}
	

	@RequestMapping("/uploadSocialImg.sns")
	public ModelAndView uploadSocialImg(@RequestParam("file") MultipartFile uploadfile, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String path = request.getSession().getServletContext().getRealPath("/")+"upload/social";
		System.out.println(path);

		if(uploadfile != null) {
			File file = new File(path);

			String ofileName = uploadfile.getOriginalFilename();
			String sfileName = "";
			if (ofileName != null && !ofileName.equals("")) {
				if(file.exists()) {
					sfileName = System.currentTimeMillis() + "_" + ofileName;
					System.out.println("sfileName : " + sfileName);
				}
			}

			try {
				byte[] data = uploadfile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + sfileName);
				fos.write(data);
				fos.close();
				System.out.println("마지막");

			} catch (IOException e1) {
				e1.printStackTrace();
			}
			mav.addObject("path",path);
			mav.addObject("sfileName", sfileName);
			mav.setViewName("writeSocial2.jsp");
		}
		
		return mav;
	}
	
}





