package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.INotificationService;
import kh.spring.interfaces.ISocialBoardService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService mservice;
	@Autowired
	private ISocialBoardService sservice;
	
	
	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = mservice.loginExist(dto);
		if(result.size()>0) {
			session.setMaxInactiveInterval(60*60);
			MemberDTO user = result.get(0);
			session.setAttribute("user", user);
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
	public ModelAndView goMypage(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			List<SocialBoardDTO> socialList = this.sservice.getMySocialList((MemberDTO)session.getAttribute("user"));
			List<CollectionDTO> collectionList = this.sservice.getCollectionList((MemberDTO)session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.sservice.getCollectionPhotoList((MemberDTO)session.getAttribute("user"));
			List<MemberDTO> followerList = this.mservice.getFollowerList((MemberDTO)session.getAttribute("user"));
			List<MemberDTO> followingList = this.mservice.getFollowingList((MemberDTO)session.getAttribute("user"));
			followCheck(followerList, followingList);
			mav.addObject("socialList", socialList);
			mav.addObject("collectionList", collectionList);
			mav.addObject("photoList", photoList);
			mav.addObject("followerList", followerList);
			mav.addObject("followingList", followingList);
		}catch(Exception e) {
			System.out.println("로그인x");
			mav.setViewName("login.go");
			return mav;
		}
		
		if(request.getParameter("view") == null) {
			mav.setViewName("mypage.jsp");
		} else if(request.getParameter("view").equals("collection")) {
			mav.setViewName("mypage.jsp?view=collection");
		} else {
			mav.setViewName("mypage.jsp");
		}
		return mav;
	}

	@RequestMapping("/myinfo.go")
	public String goMyinfo() {
		return "redirect:myinfo.jsp";
	}
	
	@RequestMapping("/editProfile.do")
	public String updateInfo(MemberDTO dto, HttpSession session) {
		dto.setSeq(((MemberDTO)session.getAttribute("user")).getSeq());
		int result = mservice.updateUserData(dto);
		if(result > 0) {
			System.out.println("성공");
			MemberDTO user = mservice.getUserData(dto).get(0);
			session.setAttribute("user", user);
		}
		return "myinfo.go";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.go";
	}
	
	public static void followCheck(List<MemberDTO> followerList, List<MemberDTO> followingList) {
		for(MemberDTO followertmp : followerList) {
			for(MemberDTO followingtmp : followingList) {
				if(followertmp.getSeq() == followingtmp.getSeq()) {
					followertmp.setFollowcheck("y");
					System.out.println("followcheck" +followertmp.getFollowcheck());
					break;
				} else {
					followertmp.setFollowcheck("n");
				}
			}
		}
		
		for(MemberDTO followingtmp : followingList) {
			for(MemberDTO followertmp : followingList) {
				if(followingtmp.getSeq() == followertmp.getSeq()) {
					followingtmp.setFollowcheck("y");
					break;
				} else {
					followingtmp.setFollowcheck("n");
				}
			}
		}	
	}
	
	
}
