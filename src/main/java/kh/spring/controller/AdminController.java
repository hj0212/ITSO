package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HttpSessionMutexListener;

import kh.spring.dto.AdminPageDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IAdminService;

@Controller
public class AdminController {

	@Autowired
	IAdminService service;

	@RequestMapping("/goAdminPageWithAllAnalysisData.adm")
	public ModelAndView getAllAnalysisData() {

		// gender
		int femaleUsers = service.getFemaleUserCounts();
		int maleUsers = service.getMaleUserCounts();

		// ages
		int teenagers = service.getTeenagersCounts();
		int twenties = service.getTwentiesCounts();
		int thirties = service.getThirtiesCounts();
		int forties = service.getFortiesCounts();

		// getReportedUser
		List<MemberDTO> reportedUsers = service.getReportedUser();

		System.out.println(femaleUsers);
		ModelAndView mav = new ModelAndView();

		// gender mav add
		mav.addObject("femaleUsers", femaleUsers);
		mav.addObject("maleUsers", maleUsers);

		// age mav add
		mav.addObject("teenagers", teenagers);
		mav.addObject("twenties", twenties);
		mav.addObject("thirties", thirties);
		mav.addObject("forties", forties);

		// reportedUser lists add
		mav.addObject("reportedUsers", reportedUsers);

		// forward
		mav.setViewName("adminAnalysisPage.jsp");
		return mav;
	}

	@RequestMapping("/goMain.go")
	public String goMain() {
		return "redirect:main.jsp";
	}

	@RequestMapping("/specificUserblock.adm")
	public @ResponseBody int specificUserblock(HttpServletRequest req) {

		int userSeq = Integer.parseInt(req.getParameter("userSeq"));
		int result = 0;
		System.out.println(userSeq);

		String isBlocked = service.isThisUserBlocked(userSeq);

		if (isBlocked.equals("y")) {
			System.out.println("user already blocked, so we will release the block user back");
			result = service.blockUserReleasing(userSeq);
			System.out.println("Target user is unblocked!");

			result = 3;

		} else {
			System.out.println("user wasn't blocked, so we will block him");
			result = service.specificUserblock(userSeq);
			System.out.println("Targeted User is Blocked!");
			result = 4;
		}

		System.out.println("blocked method results : " + result);

		return result;
	}

	@RequestMapping("reportProc.adm")
	public @ResponseBody int reportProc(@RequestBody AdminPageDTO dto) {

		System.out.println(dto.toString());
		int result = 0;
		result = service.reportProc(dto);

		if(result>0) {
			System.out.println(dto.getName() + "님이 " + dto.getReporting_user() + " 님에 의해 " + dto.getReport_reason() +" 라는 이유로 신고되었습니다.");
		}else {
			System.out.println("report proc error!");
		}
		return result;
	}

}
