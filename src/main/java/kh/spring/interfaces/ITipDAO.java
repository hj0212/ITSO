package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SearchedTipDTO;
import kh.spring.dto.TipCommentDTO;
import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;

public interface ITipDAO {
	public int insertTipData(TipDTO dto);

	public List<TipDTO> getBeautyTipData();

	public List<TipDTO> getDietTipData();

	public List<TipDTO> getFashionTipData();

	public List<TipDTO> getBusinessTipData();

	public int deleteTipData(TipDTO dto);

	public int updateTipData(TipDTO dto);

	public List<TipDTO> getSpecificTipView(int seq);

	public int viewCountPlus(int seq);

	public List<TipGoodDTO> getTipLikeCounts(int seq);

	public List<TipDTO> getUpvotingArticles();

	public int insertTipCommentProc(TipCommentDTO dto);

	public List<TipCommentDTO> getCommentsFromTip(int seq);

	public int deleteSpecificTip(int tipSeq);

	public int tipArticleLikeProc(int seq, int tipLikingUser);

	public List<TipGoodDTO> isThisLikeWhetherFirst(int tipSeq, int tipLikingUser);

	public int deleteTipComment(int seq);

	int tipModifyProc(TipDTO dto);
	
	public List<SearchedTipDTO> getSearchedTipList(String word);
	public List<TipDTO> getTipBoardList(String category);
}
