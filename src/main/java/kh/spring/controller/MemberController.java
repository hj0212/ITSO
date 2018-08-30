package kh.spring.controller;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
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

//	protected static Logger log = LoggerFactory.getLogger(MemberController.class);

	@RequestMapping("/login.do")
	public ModelAndView login(MemberDTO dto, HttpSession session) {
		System.out.println(dto.getEmail()+":"+dto.getPw());
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> result = mservice.loginExist(dto);
		if (result.size() > 0) {
			session.setMaxInactiveInterval(60 * 60);
			MemberDTO user = result.get(0);
			session.setAttribute("user", user);


			System.out.println("result.get(0) : " + result.get(0).getEmail() + " : " + result.get(0).getPw());
			String userId = result.get(0).getEmail();
			String userPw = result.get(0).getPw();

			// Admin Account Redirect syntax
			if (userId.equals("itso@admin") && userPw.equals("itso@admin")) {
				mav.setViewName("goAdminPageWithAllAnalysisData.adm");
			} else {
				// usual users account redirect syntax
				mav.addObject("result", result.size());
				mav.setViewName("loginProc.jsp");
				System.out.println(result.size());
			}
//			log.debug("로그인");
		} else {
			mav.setViewName("loginProc.jsp");
		}
		mav.addObject("result",result.size());
		System.out.println(result.size());
		mav.setViewName("loginProc.jsp");
		return mav;

	}

	@RequestMapping("/login.go")
	public String loginMain() {
		return "redirect:login.jsp";
	}

	@RequestMapping("/signin.do")
	public ModelAndView SigninProc(String mail,String pw, String name,int age,String gender) {
		ModelAndView mav = new ModelAndView();

		MemberDTO dto = new MemberDTO(mail,pw,name,age,gender);
		dto.setPart("home");
		dto.setBlock("n");
		dto.setState(" ");
		dto.setPhoto("background.jpg");
		dto.setWithdrawal("n");
		int result = mservice.insertUserData(dto);
		mav.addObject("result", result);
		mav.setViewName("signinProc.jsp");
		return mav;
	}

	@RequestMapping("/mypage.go")
	public ModelAndView goMypage(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			List<SocialBoardDTO> socialList = this.sservice.getMySocialList((MemberDTO) session.getAttribute("user"));
			socialList = makeHashTag(socialList);
			List<CollectionDTO> collectionList = this.sservice
					.getCollectionList((MemberDTO) session.getAttribute("user"));
			List<SocialBoardDTO> photoList = this.sservice
					.getCollectionPhotoList((MemberDTO) session.getAttribute("user"));
			List<SocialBoardDTO> goodList = this.sservice.getMyGoodSocialList((MemberDTO)session.getAttribute("user"));
			List<MemberDTO> followerList = this.mservice.getFollowerList((MemberDTO) session.getAttribute("user"));
			List<MemberDTO> followingList = this.mservice.getFollowingList((MemberDTO) session.getAttribute("user"));
			followCheck(followerList, followingList);
			mav.addObject("socialList", socialList);
			mav.addObject("collectionList", collectionList);
			mav.addObject("photoList", photoList);
			mav.addObject("goodList", goodList);
			mav.addObject("followerList", followerList);
			mav.addObject("followingList", followingList);
		} catch (Exception e) {
			System.out.println("로그인x");
			mav.setViewName("login.go");
			return mav;
		}

		if (request.getParameter("view") == null) {
			mav.setViewName("mypage.jsp");
		} else if (request.getParameter("view").equals("collection")) {
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
		dto.setSeq(((MemberDTO) session.getAttribute("user")).getSeq());
		int result = mservice.updateUserData(dto);
		if (result > 0) {
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
		for (MemberDTO followertmp : followerList) {
			for (MemberDTO followingtmp : followingList) {
				if (followertmp.getSeq() == followingtmp.getSeq()) {
					followertmp.setFollowcheck("y");
					System.out.println("followcheck" + followertmp.getFollowcheck());
					break;
				} else {
					followertmp.setFollowcheck("n");
				}
			}
		}

		for (MemberDTO followingtmp : followingList) {
			for (MemberDTO followertmp : followingList) {
				if (followingtmp.getSeq() == followertmp.getSeq()) {
					followingtmp.setFollowcheck("y");
					break;
				} else {
					followingtmp.setFollowcheck("n");
				}
			}
		}
	}
	
	private List<SocialBoardDTO> makeHashTag(List<SocialBoardDTO> list) {
		for(SocialBoardDTO dto: list) {
			String contents = dto.getSocial_contents();
			
			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");

			contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='searchTag.go?word="+"$2'>"+"$1"+"</a>");
			System.out.println("여기-------------------!!!!!!!!!!!!!!!!!"+contents);
			dto.setSocial_contents(contents);
		}
		return list;
	}

}
