package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.interfaces.IAdminService;

@Controller
public class AdminController {

	@Autowired
	IAdminService service;

	@RequestMapping("/goAdminPageWithAllAnalysisData.adm")
	public ModelAndView getAllAnalysisData() {
		int femaleUsers = service.getFemaleUserCounts();
		int maleUsers = service.getMaleUserCounts();

		System.out.println(femaleUsers);
		ModelAndView mav = new ModelAndView();

		mav.addObject("femaleUsers", femaleUsers);
		mav.addObject("maleUsers", maleUsers);
		mav.setViewName("adminAnalysisPage.jsp");
		return mav;
	}

	@RequestMapping("/goMain.go")
	public String goMain() {
		return "redirect:main.jsp";
	}

}
