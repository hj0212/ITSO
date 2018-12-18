package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.ReportDTO;
import kh.spring.interfaces.IReportService;

@Service
public class ReportServiceImpl implements IReportService {
	
	@Autowired
	ReportDAOImpl dao;

	@Override
	public int insertReport(ReportDTO dto) {
		return this.dao.insertReport(dto);
	}

	@Override
	public List<ReportDTO> checkReportData(ReportDTO dto) {
		return this.dao.checkReportData(dto);
	}

	@Override
	public List<ReportDTO> getAllData() {
		return this.dao.getAllData();
	}
}
