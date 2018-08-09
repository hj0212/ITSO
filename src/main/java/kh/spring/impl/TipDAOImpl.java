package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipDAO;

@Repository
public class TipDAOImpl implements ITipDAO{

	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public int insertTipData(TipDTO dto) {

		return template.insert("TipBoard.insertData", dto);
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
