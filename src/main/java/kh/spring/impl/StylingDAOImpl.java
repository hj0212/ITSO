package kh.spring.impl;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.StylingVoteDTO;
import kh.spring.dto.StylingVoteItemDTO;
import kh.spring.dto.StylingVoteResultDTO;
import kh.spring.dto.StylingVoteUserDTO;
import kh.spring.interfaces.IStylingDAO;
import kh.spring.jsonobject.StylingParam;

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

	@Override
	public List<StylingVoteItemDTO> selectStylingVoteItem(int styling_vote_seq) {
		return template.selectList("Styling.selectStylingVoteItem",styling_vote_seq);
	}

	@Override
	public int selectDidVote(int seq,int styling_vote_seq) {
		StylingParam param = new StylingParam(seq,styling_vote_seq);
		return template.selectOne("Styling.selectDidVote",param);
	}

	@Override
	public int doStylingVote(StylingVoteUserDTO votedto) {
		return template.insert("Styling.doStylingVote",votedto);
	}

	@Override
	public int deleteStylingVote(int styling_vote_seq) {
		return template.update("Styling.deleteStylingVote",styling_vote_seq);
	}

	@Override
	public int modifyStylingVote(StylingVoteDTO svdto) {
		System.out.println("수정사항"+svdto.getStyling_vote_seq()+"번글//제목:"+svdto.getStyling_title()+"/내용:"+svdto.getStyling_contents()+"/종료방법:"+svdto.getStyling_end()+"/추가사항"+svdto.getStyling_voternum());
		
		return template.update("Styling.modifyStylingVote",svdto);
	}

	@Override
	public int updateStylingViewcount(int styling_vote_seq) {
		System.out.println("dao 들어옴/ 변수 :" + styling_vote_seq);
		int resul= template.update("Styling.updateStylingViewcount",styling_vote_seq);
		System.out.println(resul);
		return resul;
	}

	@Override
	public List<StylingVoteResultDTO> getStylingVoteResult(int styling_vote_seq) {
		return template.selectList("Styling.getStylingVoteResult",styling_vote_seq);
	}

	@Override
	public StylingVoteItemDTO selectStylingVoteItemName(String styling_vote_item_photo) {
		return template.selectOne("Styling.selectStylingVoteItemName",styling_vote_item_photo);
	}

	@Override
	public int deleteStylingVoteItem(int styling_vote_item_seq) {
		return template.delete("Styling.deleteStylingVoteItem",styling_vote_item_seq);
	}
	
}
