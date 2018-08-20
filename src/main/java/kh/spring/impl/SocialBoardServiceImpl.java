package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dto.CollectionDTO;
import kh.spring.dto.MemberDTO;
import kh.spring.dto.SocialBoardDTO;
import kh.spring.interfaces.ISocialBoardDAO;
import kh.spring.interfaces.ISocialBoardService;

@Service
public class SocialBoardServiceImpl implements ISocialBoardService{
	
	@Autowired
	private ISocialBoardDAO dao;

	@Override
	public List<SocialBoardDTO> showSocialBoardList() {
		return this.dao.showSocialBoardList();
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
	public int deleteSocialBoard(int seq) {
		return this.dao.deleteSocialBoard(seq);
	}
	
	@Override
	public int getSocialBoardcurrval() {
		return this.dao.getSocialBoardcurrval();
	}

	@Override
	public SocialBoardDTO selectSocialBoard(int seq) {
		return this.dao.selectSocialBoard(seq);
	}

	@Override
	public List<CollectionDTO> getCollectionList(MemberDTO dto) {
		return this.dao.getCollectionList(dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionPhotoList(MemberDTO dto) {
		return this.dao.getCollectionPhotoList(dto);
	}

	@Override
	public List<SocialBoardDTO> getSocialList(MemberDTO dto) {
		return this.dao.getSocialList(dto);
	}

	@Override
	public List<SocialBoardDTO> getCollectionSocialList(CollectionDTO dto) {
		return this.dao.getCollectionSocialList(dto);
	}

	@Override
	public List<CollectionDTO> getCollectionData(CollectionDTO dto) {
		return this.dao.getCollectionData(dto);
	}

}
