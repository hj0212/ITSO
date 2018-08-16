package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.GoodDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardDAO;
import kh.spring.interfaces.ISocialBoardService;

@Service
public class SocialBoardServiceImpl implements ISocialBoardService{
	
	@Autowired
	private ISocialBoardDAO dao;

	@Override
	public List<SocialBoardDTO> showSocialBoardList(SocialBoardDTO sdto) {
		System.out.println(sdto.getAge()+":"+sdto.getGender());
		return this.dao.showSocialBoardList(sdto);
	}

	@Override
	public int insertSocialBoard(SocialBoardDTO sdto) {
		return this.dao.insertSocialBoard(sdto);
	}

	@Override
	public int updateSocialBoard(SocialBoardDTO sdto) {
		return this.dao.updateSocialBoard(sdto);
	}

	@Override
	public int deleteSocialBoard(SocialBoardDTO sdto) {
		return this.dao.deleteSocialBoard(sdto);
	}

	@Override
	public List<CollectionDTO> getCollectionList(MemberDTO dto) {
		return this.dao.getCollectionList(dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto) {
		return this.dao.getCollectionPhotoList(dto);
	}

	
	
	//좋아요
	@Override
	public int selectGoodCount(GoodDTO gdto) {
		return this.dao.selectGoodCount(gdto);
	}

	@Override
	public int insertGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return this.dao.insertGoodCount(gdto);
	}

	@Override
	public int deleteGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return this.dao.deleteGoodCount(gdto);
	}

	@Override
	public int allGoodCount(GoodDTO gdto) {
		// TODO Auto-generated method stub
		return this.dao.allGoodCount(gdto);
	}

	@Override
	public List<SocialBoardDTO> getMyGoodSocialList(MemberDTO dto) {
		// TODO Auto-generated method stub
		return this.dao.getMyGoodSocialList(dto);
	}

}
