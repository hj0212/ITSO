package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.ReportDTO;
import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.TipCommentDTO;
import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;

public interface IReportService {	
	public int insertReport(ReportDTO dto);
	public List<ReportDTO> checkReportData(ReportDTO dto);
	public List<ReportDTO> getAllData();
}
