package kh.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.exception.NotLoginException;
import kh.spring.interfaces.IStylingService;

@Controller
public class StylingController {

	@Autowired
	private IStylingService styservice;

	@RequestMapping("/insertStylingVote.style")
	public ModelAndView insertStylingVote(HttpSession session, StylingVoteDTO svdto, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles, @RequestParam("votetitleimgfile")MultipartFile titlefile) {
		/*		System.out.println(svdto.getStyling_end());
		System.out.println(svdto.getStyling_title());*/		
		ModelAndView mav = new ModelAndView();
		MemberDTO user =(MemberDTO)session.getAttribute("user");				
		/*svdto.setStyling_writer(user.getSeq());*/
		String path = session.getServletContext().getRealPath("/")+"upload/stylingvote";

		//사진파일 업로드-주제
		if(titlefile != null) {
			File file2 = new File(path);

			String ofileName = titlefile.getOriginalFilename();
			String sfileName = "";
			if (ofileName != null && !ofileName.equals("")) {
				if(file2.exists()) {
					sfileName = System.currentTimeMillis() + "_" + ofileName;
					/*System.out.println("sfileName : " + sfileName);*/		
					svdto.setPhoto(sfileName);
					System.out.println("성공인가");
				}
			}
			try {
				byte[] data = titlefile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + sfileName);
				fos.write(data);
				fos.close();	
			}catch(Exception e) {

			}
		}

		int insertResult =styservice.insertStylingVote(svdto);
		/*List<StylingVoteItemDTO> svitemdtos = (List<StylingVoteItemDTO>) svitemdto;*/
		/*System.out.println(svitemdtos.size());*/
		int stylingseq = styservice.selectStylingSeq()-1;
		/*System.out.println(stylingseq);*/
		
		//------------------------------------voteItem insert
		//사진파일 업로드-후보
		if(uploadfiles.size() != 0) {
			File file = new File(path);
			for(MultipartFile uploadfile: uploadfiles) {			
				String ofileName = uploadfile.getOriginalFilename();
				String sfileName = "";
				if (ofileName != null && !ofileName.equals("")) {
					if(file.exists()) {
						sfileName = System.currentTimeMillis() + "_" + ofileName;
						/*System.out.println("sfileName : " + sfileName);*/					
					}
				}
				try {
					byte[] data = uploadfile.getBytes();
					FileOutputStream fos = new FileOutputStream(path + "/" + sfileName);
					fos.write(data);
					fos.close();	
				}catch(Exception e) {

				}
			}
		}
		mav.addObject("result",insertResult);
		mav.setViewName("stylingBoard.jsp");
		return mav;

	}
}
