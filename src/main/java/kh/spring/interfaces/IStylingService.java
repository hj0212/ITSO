package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;

public interface IStylingService {
	
	public int insertStylingVote(StylingVoteDTO svdto);
	public int selectStylingSeq();
	public int insertStylingVoteItem(StylingVoteItemDTO svitemdto);
	public List<StylingVoteDTO>selectStylingBoard();
	public StylingVoteDTO selectStylingVote(int styling_vote_seq);
}
