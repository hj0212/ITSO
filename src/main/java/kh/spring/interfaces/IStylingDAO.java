package kh.spring.interfaces;

import kh.spring.dto.StylingVoteDTO;

public interface IStylingDAO {
	
	public int insertStylingVote(StylingVoteDTO svdto);
	
	public int selectStylingSeq();
}
