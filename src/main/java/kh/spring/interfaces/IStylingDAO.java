package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;

public interface IStylingDAO {
	
	public int insertStylingVote(StylingVoteDTO svdto);
	
	public int selectStylingSeq();
	
	public int insertStylingVoteItem(StylingVoteItemDTO svitemdto);
	
	public List<StylingVoteDTO>selectStylingBoard();
	
	public StylingVoteDTO selectStylingVote(int styling_vote_seq);
	
	public List<StylingVoteItemDTO> selectStylingVoteItem(int styling_vote_seq);
	
	public int selectDidVote(int seq,int styling_vote_seq);
}
