package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.AdminPageDTO;
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
	public List<AdminPageDTO> getAllAnalysisData() {
		return null;
	}

	@Override
	public int getMaleUserCounts() {
		return this.dao.getMaleUserCounts();
	}
	
	
	
}
