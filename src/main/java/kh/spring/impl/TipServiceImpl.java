package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.MemberDTO;
import kh.spring.dto.ReportDTO;
import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.TipCommentDTO;
import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;
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
	public List<TipDTO> getBeautyTipData() {
		return this.dao.getBeautyTipData();
	}

	@Override
	public List<TipDTO> getDietTipData() {
		return this.dao.getDietTipData();
	}
	
	@Override
	public List<TipDTO> getFashionTipData() {
		return this.dao.getFashionTipData();
	}

	@Override
	public List<TipDTO> getETCTipData(){
		return this.dao.getETCTipData();
	}

	@Override
	public List<TipDTO> getSpecificTipView(int seq) {
		return this.dao.getSpecificTipView(seq);
	}


	@Override
	public int updateTipData(TipDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TipGoodDTO> getTipLikeCounts(int seq) {
		// TODO Auto-generated method stub
		return this.dao.getTipLikeCounts(seq);
	}

	@Override
	public int viewCountPlus(int seq) {
		// TODO Auto-generated method stub
		return this.dao.viewCountPlus(seq);
	}

	@Override
	public int tipArticleLikeProc(int seq, int tipLikingUser) {
		return this.dao.tipArticleLikeProc(seq , tipLikingUser);
	}

	@Override
	public List<TipDTO> getUpvotingArticles() {
		return this.dao.getUpvotingArticles();
	}

	@Override
	public int insertTipCommentProc(TipCommentDTO dto) {
		return this.dao.insertTipCommentProc(dto);
	}

	@Override
	public List<TipCommentDTO> getCommentsFromTip(int seq) {
		return this.dao.getCommentsFromTip(seq);
	}

	@Override
	public int deleteSpecificTip(int tipSeq) {

		return this.dao.deleteSpecificTip(tipSeq);
	}

	@Override
	public List<TipGoodDTO> isThisLikeWhetherFirst(int tipSeq, int tipLikingUser) {
		return this.dao.isThisLikeWhetherFirst(tipSeq,tipLikingUser);
	}

	@Override
	public int deleteTipComment(int seq) {
		return this.dao.deleteTipComment(seq);
	}

	@Override
	public int tipModifyProc(TipDTO dto) {
		return this.dao.tipModifyProc(dto);
	}

	@Override
	public List<SearchedTipDTO> getSearchedTipList(String word) {
		return this.dao.getSearchedTipList(word);
	}

	@Override
	public List<TipDTO> getTipBoardList(String category) {
		return this.dao.getTipBoardList(category);
	}

	@Override
	public int getTipBoardCount(String category) {
		return this.dao.getTipBoardCount(category);
	}

	@Override
	public List<TipDTO> getTipBoardListRange(String category, int start, int end) {
		return this.dao.getTipBoardListRange(category, start, end);
	}

	@Override
	public List<TipDTO> getMyTipBoardList(MemberDTO dto) {
		return this.dao.getMyTipBoardList(dto);
	}

	@Override
	public int insertReport(ReportDTO dto) {
		return this.dao.insertReport(dto);
	}

	@Override
	public List<ReportDTO> checkReportData(ReportDTO dto) {
		return this.dao.checkReportData(dto);
	}
}
