package kh.spring.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.dto.StylingVoteResultDTO;
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
	public ModelAndView goStylingBoard(HttpSession session, @RequestParam(value="styling_vote_seq") int styling_vote_seq) {
		ModelAndView mav = new ModelAndView();
		try {	
			/*int result =styservice.updateStylingViewcount(styling_vote_seq);
			System.out.println(result);
*/
			StylingVoteDTO votedto = styservice.selectStylingVote(styling_vote_seq);
			System.out.println("votedto까지 생성완료");
			List<StylingVoteItemDTO>svitemdtos = styservice.selectStylingVoteItem(styling_vote_seq);
			System.out.println(svitemdtos.size()+"개의 voteItemdto 생성완료");
			
			List<StylingVoteResultDTO> resultdtos =styservice.getStylingVoteResult(styling_vote_seq);
			if(resultdtos.size()==0) {
				System.out.println(resultdtos.size()+"개의 투표결과가 컨트롤러 는 무사히..지나감");
				for(int i=0; i<svitemdtos.size();i++) {
					StylingVoteResultDTO dto = new StylingVoteResultDTO();
					dto.setEachrate((double)0);			
					resultdtos.add(dto);
				}
			}else if(resultdtos.size()<svitemdtos.size()) {
				for(int i=0; i< svitemdtos.size()-resultdtos.size();i++) {}
				StylingVoteResultDTO dto = new StylingVoteResultDTO();
				dto.setEachrate((double)0);			
				resultdtos.add(dto);
			}
			
			int seq=((MemberDTO)session.getAttribute("user")).getSeq();		
			int didvote = styservice.selectDidVote(seq,styling_vote_seq);		
			System.out.println(styling_vote_seq +"번글 투표했냐"+didvote);
			/*List<StylingVoteResultDTO>styservice.selectVoteResult(styling_vote_seq);*/

			mav.addObject("didVote",didvote);
			mav.addObject("voteitems",svitemdtos);
			mav.addObject("votedto",votedto);
			mav.addObject("voteresults",resultdtos);
			System.out.println(resultdtos.get(0).getEachrate());
			System.out.println(resultdtos.size()+"개의 투표결과가 컨트롤러 는 무사히..지나감");
			
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
	public ModelAndView modifyStylingVote(HttpSession session, @RequestParam("styling_endtermtxt") String styling_endtermtxt, StylingVoteDTO svdto, int styling_vote_seq, @RequestParam("titlefile")MultipartFile titlefile, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles, @RequestParam("voteitemori[]")List<String> oriconts, @RequestParam("voteitemnew[]")List<String> newconts, @RequestParam("deletedsvitem[]")List<String> delseqs, @RequestParam("itemphotos[]")List<String> svitemphotos) {
		ModelAndView mav = new ModelAndView();
		System.out.println("------------------------------modiCtrl");		
		System.out.println(svitemphotos.size()+":원래사진 개수");
		String path = session.getServletContext().getRealPath("/")+"upload/stylingvote";
		System.out.println(styling_vote_seq+"번 글 수정 Ctrl");
		System.out.println(svdto.getPhoto()+":이건 원래 있던 포토");
		System.out.println(svdto.getStyling_endtermtxt()+"새로들어온 날짜");
		System.out.println(titlefile+":새로운 제목 사진");
		if(!"blank".equals(svdto.getStyling_endtermtxt())) {
			String startdate = svdto.getStyling_endtermtxt();
			
			System.out.println(startdate);
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			java.util.Date tempdate;
			try {
				tempdate = format.parse(startdate);
				java.sql.Date sqldate = new java.sql.Date(tempdate.getTime());
				svdto.setStyling_endterm(sqldate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}	
		
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
			System.out.println("글 주제수정완료"+modiresul);

		}
	
		
		//-----------------후보수정//삭제
		System.out.println(delseqs.size()+"개 지울거임");
		 
		if(delseqs.size() > 1) {
			for(int i =1; i<delseqs.size();i++) {
				int tmpseq = Integer.parseInt(delseqs.get(i));	
				System.out.println(tmpseq);
				styservice.deleteStylingVoteItem(tmpseq);		
			}
		}
		//-----------------원래 있던 사진 update
		if(svitemphotos.size()>1) {
			for(int i =1; i<svitemphotos.size();i++) {
				String tmpname = svitemphotos.get(i);
				String oricont = oriconts.get(i);
				StylingVoteItemDTO svitemDTO =styservice.selectsvitemDTO(tmpname);
				System.out.println("있던사진이름1:"+tmpname);
				System.out.println("1의 내용:"+oricont);
				svitemDTO.setStyling_vote_item_seq(svitemDTO.getStyling_vote_item_seq());
				svitemDTO.setStyling_vote_item_contents(oricont);
				int updateresult= styservice.modifyStylingVoteItem(svitemDTO);
				System.out.println("있던 사진 업데이트 결과:"+updateresult);			
			}		
		}
		
		//-----------------새로운 사진 upload
		System.out.println(uploadfiles.size()+"개 가 새로 들어옴");		
		if(uploadfiles.size() >0) {		 
			/*List<String> itemnames = new ArrayList<String>();*/
			for(int i =0, j=1; i<uploadfiles.size(); i++, j=i+1) {		
				
				StylingVoteItemDTO svitemDTO = new StylingVoteItemDTO();
				svitemDTO.setStyling_vote_seq(styling_vote_seq);
				File file = new File(path);
				for(MultipartFile uploadfile: uploadfiles) {			
					String ofileName = uploadfile.getOriginalFilename();
					String sfileName = "";
					if (ofileName != null && !ofileName.equals("")) {
						if(file.exists()) {
							sfileName = System.currentTimeMillis() + "_" + ofileName;
							svitemDTO.setStyling_vote_item_photo(sfileName);
							svitemDTO.setStyling_vote_item_contents(newconts.get(j));
						}
					}
					try {
						byte[] data = uploadfile.getBytes();
						FileOutputStream fos = new FileOutputStream(path + "/" + sfileName);
						fos.write(data);
						fos.close();	
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
				styservice.insertStylingVoteItem(svitemDTO);
			}
			
		/*	for(int i=0; i<uploadfiles.size();i++) {
				int j=i+1;
				StylingVoteItemDTO svitemDTO = new StylingVoteItemDTO();
				svitemDTO.setStyling_vote_item_photo(itemnames.get(i));
				svitemDTO.setStyling_vote_item_contents(newconts.get(j));
				svitemDTO.setStyling_vote_seq(styling_vote_seq);
				System.out.println("sfileName:내용//" +svitemDTO.getStyling_vote_item_contents());
				styservice.insertStylingVoteItem(svitemDTO);
			}		*/
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


	@RequestMapping(value="/insertStylingVote.style",method = RequestMethod.POST)
	public ModelAndView insertStylingVote(HttpSession session, @RequestParam("styling_title")String styling_title, @RequestParam("styling_contents")String styling_contents,@RequestParam("styling_endtermtxt")String styling_endtermtxt, @RequestParam("styling_voternumtxt")String voternumtxt, @RequestParam("styling_end")int styling_end, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles, @RequestParam("votetitleimgfile")MultipartFile titlefile, @RequestParam("styling_vote_item_contents[]")List<String> itemconts, HttpServletRequest req) {
		/*		System.out.println(svdto.getStyling_end());
		System.out.println(svdto.getStyling_title());*/		
	/*public ModelAndView insertStylingVote(HttpSession session,StylingVoteDTO svDTO, @RequestParam("voteimgfile[]")List<MultipartFile>uploadfiles, @RequestParam("votetitleimgfile")MultipartFile titlefile, @RequestParam("styling_vote_item_contents[]")List<String> itemconts, HttpServletRequest req) {
*/
		System.out.println("인서트 컨트롤러------------------------------------------");
		System.out.println("제목:"+styling_title+"내용:"+styling_contents);
		ModelAndView mav = new ModelAndView();
		try {
			MemberDTO user =(MemberDTO)session.getAttribute("user");
			StylingVoteDTO svDTO = new StylingVoteDTO();
			/*svdto.setStyling_writeip(req.getRemoteAddr());*/
			System.out.println(req.getRemoteAddr());
			/*svdto.setStyling_writer(user.getSeq());*/
			System.out.println(user.getSeq());		
			/*System.out.println(svdto.getStyling_endtermtxt());*/
			String path = session.getServletContext().getRealPath("/")+"upload/stylingvote";
			System.out.println(voternumtxt);
			svDTO.setStyling_writer(user.getSeq());
			svDTO.setStyling_writeip(req.getRemoteAddr());
			svDTO.setStyling_title(styling_title);
			svDTO.setStyling_contents(styling_contents);
			svDTO.setStyling_end(styling_end);
			svDTO.setStyling_voternum(Integer.parseInt(voternumtxt));
					
			if(!"blank".equals(styling_endtermtxt)) {
				String startdate = styling_endtermtxt;
				System.out.println(startdate);
				SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
				java.util.Date tempdate = format.parse(startdate);
				/*SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd-MM-YYYY");
				System.out.println("Output date is = " + outputDateFormat.format(tempDate));*/
				/*svdto.setStyling_endterm(tempDate);*/
				java.sql.Date sqldate = new java.sql.Date(tempdate.getTime());
				svDTO.setStyling_endterm(sqldate);
			}
			
			//사진파일 업로드-주제
			if(titlefile != null) {
				File file2 = new File(path);

				String ofileName = titlefile.getOriginalFilename();
				String sfileName = "";
				if (ofileName != null && !ofileName.equals("")) {
					if(file2.exists()) {
						sfileName = System.currentTimeMillis() + "_" + ofileName;
						/*System.out.println("sfileName : " + sfileName);*/		
						svDTO.setPhoto(sfileName);
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

			int insertResult =styservice.insertStylingVote(svDTO);
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
