package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardDAO;

@Repository
public class SocialBoardDAOImpl implements ISocialBoardDAO{
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<SocialBoardDTO> showSocialBoardList() {
		return template.selectList("SocialBoard.showSocialBoardList");
	}

	@Override
	public int insertSocialBoard(SocialBoardDTO sdto) {
		return template.insert("SocialBoard.insertSocialBoard", sdto);
	}

	@Override
	public int updateSocialBoard(SocialBoardDTO sdto) {
		return template.update("SocialBoard.updateSocialBoard", sdto);
	}

	@Override
	public int deleteSocialBoard(int seq) {
		return template.delete("SocialBoard.deleteSocialBoard", seq);
	}
	
	@Override
	public int getSocialBoardcurrval() {
		return template.selectOne("SocialBoard.getSocialBoardcurrval");
	}

	@Override
	public SocialBoardDTO selectSocialBoard(int seq) {
		return template.selectOne("SocialBoard.selectSocialBoard", seq);
	}

	@Override
	public List<CollectionDTO> getCollectionList(MemberDTO dto) {
		return template.selectList("SocialBoard.getCollectionList", dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto) {
		return template.selectList("SocialBoard.getCollectionPhotoList", dto);
	}

	@Override
	public List<SocialBoardDTO> getSocialList(MemberDTO dto) {
		return template.selectList("SocialBoard.getMySocialList", dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionSocialList(CollectionDTO dto) {
		return template.selectList("SocialBoard.getCollectionSocialList",dto);
	}

	@Override
	public List<CollectionDTO> getCollectionData(CollectionDTO dto) {
		return template.selectList("SocialBoard.getCollectionData",dto);
	}

}
