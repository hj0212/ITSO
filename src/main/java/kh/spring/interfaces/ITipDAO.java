package kh.spring.interfaces;

import java.util.List;

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

	public int tipArticleLikeProc(int seq);

	public List<TipGoodDTO> getTipLikeCounts(int seq);

}
