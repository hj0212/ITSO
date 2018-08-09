package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.TipDTO;

public interface ITipDAO {
	public int insertTipData(TipDTO dto);
	public List<TipDTO> getTipData(TipDTO dto);
	public int deleteTipData(TipDTO dto);
	public int updateTipData(TipDTO dto);

}
