package kh.spring.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.dto.StylingVoteUserDTO;
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

	@Override
	public List<StylingVoteItemDTO> selectStylingVoteItem(int styling_vote_seq) {
		List<StylingVoteItemDTO> voteitems= sdao.selectStylingVoteItem(styling_vote_seq);
		return voteitems;
	}

	@Override
	public int selectDidVote(int seq,int styling_vote_seq) {
		int result = sdao.selectDidVote(seq,styling_vote_seq);
		return result;
	}

	@Override
	public int doStylingVote(StylingVoteUserDTO votedto) {
		int result = sdao.doStylingVote(votedto);
		return result;
	}

	@Override
	public int deleteStylingVote(int styling_vote_seq) {
		int delresult = sdao.deleteStylingVote(styling_vote_seq);
		return delresult;
	}

	@Override
	public int modifyStylingVote(int styling_vote_seq) {
		int modiresult = sdao.modifyStylingVote(styling_vote_seq);
		return modiresult;
	}


}
