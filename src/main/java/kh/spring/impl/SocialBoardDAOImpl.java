package kh.spring.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int deleteSocialBoard(SocialBoardDTO sdto) {
		return template.delete("SocialBoard.deleteSocialBoard", sdto);
	}

}
