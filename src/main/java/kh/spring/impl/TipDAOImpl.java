package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;
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
		return 0;
	}

	@Override
	public int updateTipData(TipDTO dto) {
		return 0;
	}

	@Override
	public List<TipDTO> getSpecificTipView(int seq) {
		return template.selectList("TipBoard.getSpecificTipView", seq);
	}
	@Override
	public List<TipGoodDTO> getTipLikeCounts(int seq) {

		return template.selectList("TipGood.getTipLikeCounts", seq);
	}
	@Override
	public int viewCountPlus(int seq) {
		return template.update("TipBoard.viewCountPlus", seq);
	}

	@Override
	public int tipArticleLikeProc(int seq) {
		return template.update("TipBoard.tipArticleLikeProc",seq);
	}
	
	@Override
	public List<TipDTO> getUpvotingArticles() {
		return template.selectList("TipBoard.getUpvotingArticles");
	}


}
