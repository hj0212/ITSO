package kh.spring.impl;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StylingVoteDTO;
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
}
