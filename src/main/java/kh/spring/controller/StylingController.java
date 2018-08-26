package kh.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping("/stylingBoard.style")
	public ModelAndView goStylingBoard(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<StylingVoteDTO> votes = styservice.selectStylingBoard();

		mav.addObject("svdtos",votes);
		mav.setViewName("stylingBoard.jsp");
		return mav;
	}
	@RequestMapping("/voteStyling.go")
	public String govoteStyling(HttpSession session) {	
		String addr = "";
		try {
			int seq=((MemberDTO)session.getAttribute("user")).getSeq();
			addr = "redirect:voteStyling.jsp";			
		}catch(Exception e) {
			addr="redirect:login.go";
		}
		return addr;
	}
	@Transactional
	@RequestMapping("/readStylingVote.style")
	public ModelAndView goStylingBoard(HttpSession session, @RequestParam int styling_vote_seq) {
		ModelAndView mav = new ModelAndView();
		try {	
			/*int result =styservice.updateStylingViewcount(styling_vote_seq);
			System.out.println(result);
*/
			StylingVoteDTO votedto = styservice.selectStylingVote(styling_vote_seq);		
			List<StylingVoteItemDTO>svitemdtos = styservice.selectStylingVoteItem(styling_vote_seq);


			int seq=((MemberDTO)session.getAttribute("user")).getSeq();		
			int didvote = styservice.selectDidVote(seq,styling_vote_seq);		
			System.out.println(styling_vote_seq +"번글 투표했냐"+didvote);

			/*List<StylingVoteResultDTO>styservice.selectVoteResult(styling_vote_seq);*/

			mav.addObject("didVote",didvote);
			mav.addObject("voteitems",svitemdtos);
			mav.addObject("votedto",votedto);
			mav.setViewName("readStylingVote.jsp");
		}catch(Exception e) {
			e.printStackTrace();
			mav.setViewName("login.go");
		}
		return mav;
	}

	@RequestMapping("/modifyStylingVote.go")
	public ModelAndView gomodifyStylingVote(HttpSession session, @RequestParam int styling_vote_seq) {
		ModelAndView mav = new ModelAndView();

		StylingVoteDTO votedto = styservice.selectStylingVote(styling_vote_seq);
		List<StylingVoteItemDTO>svitemdtos = styservice.selectStylingVoteItem(styling_vote_seq);


		mav.addObject("voteitems",svitemdtos);
		mav.addObject("votedto",votedto);
		mav.setViewName("modiStylingVote.jsp");
		return mav;
	}



	@RequestMapping("/deleteStylingVote.style")
	public ModelAndView deleteStylingVote(HttpSession session, @RequestParam int styling_vote_seq) {
		ModelAndView mav = new ModelAndView();
		System.out.println(styling_vote_seq);
		int delresult = styservice.deleteStylingVote(styling_vote_seq);

		mav.addObject("delresult",delresult);	
		mav.setViewName("stylingBoard.style");
		return mav;
	}

	@RequestMapping("/modifyStylingVote.style")
	public ModelAndView modifyStylingVote(HttpSession session, StylingVoteDTO svdto, int styling_vote_seq, @RequestParam("titlefile")MultipartFile titlefile, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles) {
		ModelAndView mav = new ModelAndView();

		String path = session.getServletContext().getRealPath("/")+"upload/stylingvote";
		System.out.println(styling_vote_seq+"번 글 수정 Ctrl");
		System.out.println(svdto.getPhoto()+":이건 원래 있던 포토");
		System.out.println(titlefile+":새로운 제목 사진");
		if(titlefile.getOriginalFilename() == null ||titlefile.getOriginalFilename().equals("")) {
			System.out.println("여기는 오나...파일 안바꼈을떄");
			int modiresul = styservice.modifyStylingVote(svdto);
			System.out.println(svdto.getPhoto());
			System.out.println(modiresul+":수정 결과");
			mav.addObject("modiresult",modiresul);
		}
		else {
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
			int modiresul = styservice.modifyStylingVote(svdto);
			System.out.println("수정완료"+modiresul);


		}

		mav.setViewName("readStylingVote.style?styling_vote_seq="+styling_vote_seq);
		return mav;
	}
	/*@RequestMapping("/readStylingVote.go")
	public ModelAndView goreadStylingVote(HttpSession session, int styling_vote_seq) {
		ModelAndView mav = new ModelAndView();
		System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());


		mav.addObject("styling_vote_seq",styling_vote_seq);
		mav.setViewName("readStylingVote.style");
		return mav;
	}*/


	@RequestMapping("/insertStylingVote.style")
	public ModelAndView insertStylingVote(HttpSession session, StylingVoteDTO svdto, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles, @RequestParam("votetitleimgfile")MultipartFile titlefile, @RequestParam("styling_vote_item_contents[]")List<String> itemconts, HttpServletRequest req) {
		/*		System.out.println(svdto.getStyling_end());
		System.out.println(svdto.getStyling_title());*/		

		System.out.println("인서트 컨트롤러");
		ModelAndView mav = new ModelAndView();
		try {
			MemberDTO user =(MemberDTO)session.getAttribute("user");
			svdto.setStyling_writeip(req.getRemoteAddr());
			System.out.println(req.getRemoteAddr());
			svdto.setStyling_writer(user.getSeq());
			System.out.println(user.getSeq());

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
						/*System.out.println("성공인가");*/
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
			List<String> itemfilenames = new ArrayList<String>();
			int insertitem =0;
			if(uploadfiles.size() != 0) {
				File file = new File(path);
				for(MultipartFile uploadfile: uploadfiles) {			
					String ofileName = uploadfile.getOriginalFilename();
					String sfileName = "";
					if (ofileName != null && !ofileName.equals("")) {
						if(file.exists()) {
							sfileName = System.currentTimeMillis() + "_" + ofileName;
							itemfilenames.add(sfileName);
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
			/*System.out.println(itemconts.size()+"개가 왔다 왔어!");*/
			for(int i=0; i<itemconts.size(); i++) {
				StylingVoteItemDTO svitemdto = new StylingVoteItemDTO();
				svitemdto.setStyling_vote_seq(stylingseq);
				svitemdto.setStyling_vote_item_contents(itemconts.get(i));
				svitemdto.setStyling_vote_item_photo(itemfilenames.get(i));
				styservice.insertStylingVoteItem(svitemdto);
				insertitem += 1;
			}
			mav.addObject("result",insertResult);
			mav.setViewName("stylingBoard.style");
		}catch(Exception e) {
			e.printStackTrace();;
			mav.setViewName("login.go");
		}
		return mav;

	}
}
