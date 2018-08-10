package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipService;

@Controller
public class TipController {

	@Autowired
	private ITipService service;

	@RequestMapping("/tipInsertProc.tip")
	public @ResponseBody int tipWriteProc(@RequestBody TipDTO dto) {

		System.out.println(dto.toString());
		System.out.println("------------------------------------------------------------------------");
		System.out.println(dto.getTip_title());
		System.out.println(dto.getTip_contents());
		System.out.println(dto.getTip_writer());
		System.out.println(dto.getTip_date());
		System.out.println(dto.getTip_viewcount());
		System.out.println(dto.getCategory());

		int result = service.insertTipData(dto);

		return result;
	}
	
	
	@RequestMapping("tipBoardMainPage.go")
	public String goTipBoardHome() {
		return "redirect:tipBoardMainPage.jsp";
	}
	
	
	@RequestMapping("tipInsertPage.go")
	public String goTipInsertPage() {
		return "redirect:tipInsertPage.jsp";
	}
}
