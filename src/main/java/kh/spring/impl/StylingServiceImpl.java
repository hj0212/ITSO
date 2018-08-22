package kh.spring.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.SocialBoardDTO;
import kh.spring.dto.StylingVoteDTO;
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
	
	
}
