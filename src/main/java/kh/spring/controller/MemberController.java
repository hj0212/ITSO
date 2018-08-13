package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService mservice;
	@Autowired
	private ISocialBoardService sservice;

	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		System.out.println(dto.getEmail()+":"+dto.getPw());
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = mservice.loginExist(dto);
		if(result.size()>0) {
			session.setMaxInactiveInterval(60*60);
			MemberDTO user = result.get(0);
			session.setAttribute("user", user);
			System.out.println(dto.getEmail());
		}
		mav.addObject("result",result.size());
		mav.setViewName("loginProc.jsp");
		return mav;
		
	}

	@RequestMapping("/login.go")
	public String loginMain() {
		return "redirect:login.jsp";
	}

	@RequestMapping("/signin.do")
	public ModelAndView SigninProc(String mail,String pw, String name,int age) {
		ModelAndView mav = new ModelAndView();

		MemberDTO dto = new MemberDTO(mail,pw,name,age);
		int result = mservice.insertUserData(dto);
		mav.addObject("result", result);
		mav.setViewName("signinProc.jsp");
		return mav;
	}

	@RequestMapping("/mypage.go")
	public ModelAndView goMypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println(((MemberDTO)session.getAttribute("user")).getSeq());
			List<CollectionDTO> collectionList = this.sservice.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.sservice.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));

			mav.addObject("collectionList",collectionList);
			mav.addObject("photoList",photoList);
		}catch(NullPointerException e) {
			System.out.println("로그인x");
		}
		mav.setViewName("mypage.jsp");
		return mav;
	}

	@RequestMapping("/myinfo.go")
	public String goMyinfo() {
		return "redirect:myinfo.jsp";
	}

}
