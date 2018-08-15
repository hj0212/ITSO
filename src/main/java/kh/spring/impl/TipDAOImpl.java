package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TipDTO;
import kh.spring.interfaces.ITipDAO;

@Repository
public class TipDAOImpl implements ITipDAO {

	@Autowired
	SqlSessionTemplate template;

	@Override
	public int insertTipData(TipDTO dto) {

		return template.insert("TipBoard.insertData", dto);
	}

	@Override
	public List<TipDTO> getBeautyTipData() {
		// TODO Auto-generated method stub
		return template.selectList("TipBoard.getBeautyTipData");
	}

	@Override
	public List<TipDTO> getDietTipData() {
		// TODO Auto-generated method stub
		return template.selectList("TipBoard.getDietTipData");
	}

	@Override
	public List<TipDTO> getFashionTipData() {
		// TODO Auto-generated method stub
		return template.selectList("TipBoard.getFashionTipData");
	}

	@Override
	public List<TipDTO> getBusinessTipData() {
		return template.selectList("TipBoard.getBusinessTipData");
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

	@Override
	public List<TipDTO> getSpecificTipView(int seq) {
		return template.selectList("TipBoard.getSpecificTipView", seq);
	}
	@Override
	public List<TipDTO> getThumpsUpData(int seq) {

		return template.selectList("TipBoard.getThumpsUpData", seq);
	}
	@Override
	public int viewCountPlus(int seq) {
		// TODO Auto-generated method stub
		return template.update("TipBoard.viewCountPlus", seq);
	}

}
