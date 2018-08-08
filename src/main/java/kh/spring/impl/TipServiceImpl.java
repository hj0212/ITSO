package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipService;


@Service
public class TipServiceImpl implements ITipService {
	
	@Autowired
	TipDAOImpl dao;
	
	@Override
	public int insertTipData(TipDTO dto) {

		return this.dao.insertTipData(dto);
	}

	@Override
	public List<TipDTO> getTipData(TipDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteTipData(TipDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateTipData(TipDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
