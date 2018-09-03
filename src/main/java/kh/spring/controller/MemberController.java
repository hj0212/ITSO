package kh.spring.controller;

import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.FollowDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.dto.TipDTO;
import kh.spring.interfaces.IMemberService;
import kh.spring.interfaces.ISocialBoardService;
import kh.spring.interfaces.ITipService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService mservice;
	@Autowired
	private ISocialBoardService sservice;
	@Autowired
	private ITipService tservice;

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

			String userId = result.get(0).getEmail();
			String userPw = result.get(0).getPw();

			// Admin Account Redirect syntax
			if (userId.equals("itso@admin") && userPw.equals("itso@admin")) {
				mav.setViewName("goAdminPageWithAllAnalysisData.adm");
			} else {
				// usual users account redirect syntax
				mav.addObject("result", result.size());
				mav.setViewName("loginProc.jsp");
			}
			//	log.debug("로그인");
		} else {
			mav.setViewName("loginProc.jsp");
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

	@RequestMapping("/userpage.go")
	public ModelAndView goMypage(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		MemberDTO tmp = null;
		int user_seq = 0;
		
		try {
			// 본인
			tmp = (MemberDTO) session.getAttribute("user");
			user_seq = tmp.getSeq();
		} catch (Exception e) {
			System.out.println("로그인x");
			mav.setViewName("login.go");
			return mav;
		}

		int result = 0;
		try {
			// 다른사람
			int seq = Integer.parseInt(request.getParameter("seq"));
			tmp = new MemberDTO();
			tmp.setSeq(seq);
			tmp = mservice.getUserData(tmp).get(0);
			result = mservice.checkFollow(new FollowDTO(user_seq, seq));
		}catch(Exception e) {

		}
		
		List<TipDTO> tipBoardList = this.tservice.getMyTipBoardList(tmp);
		List<SocialBoardDTO> socialList = this.sservice.getMySocialList(tmp);
		socialList = makeHashTag(socialList);
		List<CollectionDTO> collectionList = this.sservice.getCollectionList(tmp);
		List<SocialBoardDTO> photoList = this.sservice.getCollectionPhotoList(tmp);
//		List<SearchedTipDTO> tipList = this.tservice.getMyTipList(tmp);
		List<SocialBoardDTO> goodList = this.sservice.getMyGoodSocialArticleList((MemberDTO) session.getAttribute("user"));
		List<MemberDTO> followerList = this.mservice.getFollowerList(tmp);
		List<MemberDTO> followingList = this.mservice.getFollowingList(tmp);
		
		MemberController.followCheck(followerList, followingList);
		
		mav.addObject("followcheck", result);
		mav.addObject("seq", tmp.getSeq());
		mav.addObject("member", tmp);
//		mav.addObject("tipList", tipBoardList);
		mav.addObject("socialList", socialList);
		mav.addObject("collectionList", collectionList);
		mav.addObject("photoList", photoList);
		mav.addObject("goodList", goodList);
		mav.addObject("followerList", followerList);
		mav.addObject("followingList", followingList);


		if (request.getParameter("view") == null) {
			mav.setViewName("userpage.jsp");
		} else if (request.getParameter("view").equals("collection")) {
			mav.setViewName("userpage.jsp?view=collection");
		} else {
			mav.setViewName("userpage.jsp");
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
		return "userpage.go";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.go";
	}

	public static void followCheck(List<MemberDTO> followerList, List<MemberDTO> followingList) {
		for (MemberDTO followertmp : followerList) {
			if(followingList.size() > 0) {
				for (MemberDTO followingtmp : followingList) {
					if (followertmp.getSeq() == followingtmp.getSeq()) {
						followertmp.setFollowcheck("y");
						break;
					} else {
						followertmp.setFollowcheck("n");
					}
				}
			} else {
				followertmp.setFollowcheck("n");
			}
		}
	}

	private List<SocialBoardDTO> makeHashTag(List<SocialBoardDTO> list) {
		for(SocialBoardDTO dto: list) {
			String contents = dto.getSocial_contents();

			Pattern p = Pattern.compile("\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*)");

			contents = contents.replaceAll("(\\#([0-9a-zA-Z가-힣ㄱ-ㅎㅏ-ㅣ]*))", "<a href='searchTag.go?word="+"$2'>"+"$1"+"</a>");
			dto.setSocial_contents(contents);
		}
		return list;
	}

}
