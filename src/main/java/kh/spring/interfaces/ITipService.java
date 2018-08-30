package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.TipCommentDTO;
import kh.spring.dto.TipDTO;
import kh.spring.dto.TipGoodDTO;

public interface ITipService {

	public int insertTipData(TipDTO dto);

	public List<TipDTO> getBeautyTipData();

	public List<TipDTO> getDietTipData();

	public List<TipDTO> getFashionTipData();

	public List<TipDTO> getBusinessTipData();

	public List<TipDTO> getSpecificTipView(int seq);

	public List<TipDTO> getUpvotingArticles();


	public int updateTipData(TipDTO dto);

	public int deleteSpecificTip(int tipSeq);

	public int viewCountPlus(int seq);


	public int insertTipCommentProc(TipCommentDTO dto);


	
	public List<TipGoodDTO> isThisLikeWhetherFirst(int tipSeq, int tipLikingUser);

	public int tipArticleLikeProc(int seq, int tipLikingUser);

	public List<TipGoodDTO> getTipLikeCounts(int seq);

	public List<TipCommentDTO> getCommentsFromTip(int seq);

	public int deleteTipComment(int seq);


	public int tipModifyProc(TipDTO dto);
}
