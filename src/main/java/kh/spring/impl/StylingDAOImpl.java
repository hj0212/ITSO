package kh.spring.impl;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.interfaces.IStylingDAO;

@Repository
public class StylingDAOImpl implements IStylingDAO{

	@Autowired
	private SqlSessionTemplate template;

	@Override
	public int insertStylingVote(StylingVoteDTO svdto) {
		return template.insert("Styling.insertStylingVote", svdto);
	}

	@Override
	public int selectStylingSeq() {	
		return template.selectOne("Styling.selectStylingSeq");
	}

	@Override
	public int insertStylingVoteItem(StylingVoteItemDTO svitemdto) {
		return template.insert("Styling.insertStylingVoteItem", svitemdto);
	}

	@Override
	public List<StylingVoteDTO> selectStylingBoard() {
		return template.selectList("Styling.selectStylingBoard");
	}

	@Override
	public StylingVoteDTO selectStylingVote(int styling_vote_seq) {
		return template.selectOne("Styling.selectStylingVote",styling_vote_seq);
	}
	
}
