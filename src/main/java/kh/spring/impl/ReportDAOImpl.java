package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.ReportDTO;
import kh.spring.interfaces.IReportDAO;

@Repository
public class ReportDAOImpl implements IReportDAO {

	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insertReport(ReportDTO dto) {
		System.out.println("insert"+dto.getBoard_seq()+":"+dto.getReporting_user());
		return template.insert("Report.reportArticle", dto);
	}

	@Override
	public List<ReportDTO> checkReportData(ReportDTO dto) {
		System.out.println("select"+dto.getBoard_seq()+":"+dto.getReporting_user());
		return template.selectList("Report.checkArticle");
	}

	@Override
	public List<ReportDTO> getAllData() {
		return template.selectList("Report.getAllData");
	}
}
