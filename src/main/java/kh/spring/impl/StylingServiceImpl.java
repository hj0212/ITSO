package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.SocialBoardDTO;
import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.interfaces.IStylingService;

@Service
public class StylingServiceImpl implements IStylingService{

	@Autowired
	StylingDAOImpl sdao;

	@Override
	public int insertStylingVote(StylingVoteDTO svdto) {
		int insertresult = sdao.insertStylingVote(svdto);
		return insertresult;
	}

	@Override
	public int selectStylingSeq() {
		int seqresult = sdao.selectStylingSeq();
		return seqresult;
	}

	@Override
	public int insertStylingVoteItem(StylingVoteItemDTO svitemdto) {
		int insertitemresult =sdao.insertStylingVoteItem(svitemdto);
		return insertitemresult;
	}

	@Override
	public List<StylingVoteDTO> selectStylingBoard() {
		List<StylingVoteDTO> selectresult = sdao.selectStylingBoard();
		return selectresult;
	}

	@Override
	public StylingVoteDTO selectStylingVote(int styling_vote_seq) {
		StylingVoteDTO dto = sdao.selectStylingVote(styling_vote_seq);
		return dto;
	}


}
