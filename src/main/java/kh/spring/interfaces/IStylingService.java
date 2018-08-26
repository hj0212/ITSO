package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.dto.StylingVoteUserDTO;

public interface IStylingService {
	
	public int insertStylingVote(StylingVoteDTO svdto);
	public int selectStylingSeq();
	public int insertStylingVoteItem(StylingVoteItemDTO svitemdto);
	public List<StylingVoteDTO>selectStylingBoard();
	public StylingVoteDTO selectStylingVote(int styling_vote_seq);
	public List<StylingVoteItemDTO> selectStylingVoteItem(int styling_vote_seq);
	public int selectDidVote(int seq, int styling_vote_seq);
	public int doStylingVote(StylingVoteUserDTO votedto);
	public int deleteStylingVote(int styling_vote_seq);
	public int modifyStylingVote(StylingVoteDTO svdto);
	
}
