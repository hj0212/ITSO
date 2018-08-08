package kh.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipService;

@Controller
public class TipController {

	@Autowired
	private ITipService service;

	@RequestMapping("/tipInsertProc.tip")
	public int tipWriteProc(TipDTO dto) {

		System.out.println(dto.getTip_title());
		System.out.println(dto.getTip_contents());
		System.out.println(dto.getTip_writer());
		System.out.println(dto.getTip_date());
		System.out.println(dto.getTip_viewcount());
		System.out.println(dto.getCategory());
		
		int result = service.insertTipData(dto);

		
		return result;
	}
}
