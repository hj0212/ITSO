package kh.spring.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int insertSocialBoard(SocialBoardDTO dto) {
		return this.dao.insertSocialBoard(dto);
	}

	@Override
	public int updateSocialBoard(SocialBoardDTO dto) {
		return this.dao.updateSocialBoard(dto);
	}

	@Override
	public int deleteSocialBoard(SocialBoardDTO dto) {
		return this.dao.deleteSocialBoard(dto);
	}

}
