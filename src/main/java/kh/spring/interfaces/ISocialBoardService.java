package kh.spring.interfaces;

import java.util.List;

import kh.spring.dto.SocialBoardDTO;

public interface ISocialBoardService {
	public List<SocialBoardDTO> showSocialBoardList();
	public SocialBoardDTO selectSocialBoard(int seq);
	public int getSocialBoardcurrval();
	public int insertSocialBoard(SocialBoardDTO dto);
	public int updateSocialBoard(SocialBoardDTO dto);
	public int deleteSocialBoard(SocialBoardDTO dto);
}
