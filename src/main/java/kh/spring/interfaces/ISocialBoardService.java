package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardService {
	public List<SocialBoardDTO> showSocialBoardList();
	public int insertSocialBoard(SocialBoardDTO sdto);
	public int updateSocialBoard(SocialBoardDTO sdto);
	public int deleteSocialBoard(SocialBoardDTO sdto);

}
