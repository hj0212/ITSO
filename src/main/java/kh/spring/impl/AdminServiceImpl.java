package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.AdminPageDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.interfaces.IAdminService;

@Service
public class AdminServiceImpl implements IAdminService{

	@Autowired
	AdminDAOImpl dao;

	@Override
	public int getFemaleUserCounts() {
		return this.dao.getFemaleUserCounts();
	}


	@Override
	public int getMaleUserCounts() {
		return this.dao.getMaleUserCounts();
	}

	@Override
	public int getTeenagersCounts() {
		return this.dao.getTeenagersCounts();
	}

	@Override
	public int getTwentiesCounts() {
		return this.dao.getTwentiesCounts();
	}

	@Override
	public int getThirtiesCounts() {
		return this.dao.getThirtiesCounts();
	}

	@Override
	public int getFortiesCounts() {
		return this.dao.getFortiesCounts();
	}


	@Override
	public List<AdminPageDTO> getAllAnalysisData() {
		return null;
	}


	@Override
	public List<MemberDTO> getReportedUser() {
		return this.dao.getReportedUser();
	}


	@Override
	public int specificUserblock(int userSeq) {
		return this.dao.specificUserblock(userSeq);
	}


	@Override
	public String isThisUserBlocked(int userSeq) {
		return this.dao.isThisUserBlocked(userSeq);
	}


	@Override
	public int blockUserReleasing(int userSeq) {
		return this.dao.blockUserReleasing(userSeq);
	}


	@Override
	public int reportProc(AdminPageDTO dto) {
		return this.dao.reportProc(dto);
	}


	
}
