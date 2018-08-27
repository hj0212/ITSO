package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
			System.out.println("user already blocked");
			result = 0;
		} else {
			result = service.specificUserblock(userSeq);
		}
		System.out.println("blocked method results : " + result);

		// block result come-out
		if (result > 0) {
			System.out.println("Targeted User is Blocked!");
		} else {
			System.out.println("Block failed");
		}
		return result;
	}

}
