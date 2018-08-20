package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardDAO;

@Repository
public class SocialBoardDAOImpl implements ISocialBoardDAO{
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<SocialBoardDTO> showSocialBoardList(SocialBoardDTO sdto) {

		return template.selectList("SocialBoard.showSocialBoardList",sdto);
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
	public int deleteSocialBoard(SocialBoardDTO sdto) {
		return template.delete("SocialBoard.deleteSocialBoard", sdto);
	}

	@Override
	public List<CollectionDTO> getCollectionList(MemberDTO dto) {
		return template.selectList("SocialBoard.getCollectionList", dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto) {
		return template.selectList("SocialBoard.getCollectionPhotoList", dto);
	}
	
	
	//���ƿ� 
	@Override
	public int selectGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return template.selectOne("SocialBoard.selectGoodCount", gdto);
	}

	@Override
	public int insertGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return template.insert("SocialBoard.insertGoodCount",gdto);
	}

	@Override
	public int deleteGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return template.delete("SocialBoard.deleteGoodCount",gdto);
	}

	@Override
	public int allGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return template.selectOne("SocialBoard.allGoodCount",gdto);
	}

	@Override
	public List<SocialBoardDTO> getMyGoodSocialList(MemberDTO dto) {
		return template.selectList("SocialBoard.getMyGoodSocialList", dto);
	}

	
	
	//인기
	@Override
	public List<SocialBoardDTO> showSocialHotBoardList(SocialBoardDTO sdto) {
		// TODO Auto-generated method stub
		System.out.println("2");
		return template.selectList("SocialBoard.showSocialHotBoardList",sdto);
	}
	//팔로잉
	@Override
	public List<SocialBoardDTO> showSocialFollowBoardList(SocialBoardDTO sdto) {
		// TODO Auto-generated method stub
		return template.selectList("SocialBoard.showSocialFollowBoardList",sdto);
	}

}
